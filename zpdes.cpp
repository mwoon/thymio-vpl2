#include "zpdes.h"
Zpdes::Zpdes(QObject *parent) : QObject(parent)
{
    //initialize all activities
    initializeActivities();
}


void Zpdes::initializeActivities() {
    //TODO (later): search database for activities, for now just an example exploration graph

    //////////////////// example graph for testing ////////////////////
    //for each activity make an activity object
    std::shared_ptr<Activity> a = std::make_shared<Activity>(Activity("C2", 0.9, "C2"));
    Activity b("C1", 0.7, "C1", std::make_shared<Activity>(*(a.get())));

    exGraph.addActivity(*(a.get()));
    exGraph.addActivity(b);

    a = std::make_shared<Activity>(Activity("A1", 0.9, "A1"));
    exGraph.addActivity(*(a.get()));

    a = std::make_shared<Activity>(Activity("B1", 0.9, "B1"));
    exGraph.addActivity(*(a.get()));

    a = std::make_shared<Activity>(Activity("D1", 0.9, "D1"));
    exGraph.addActivity(*(a.get()));

    ///////////////////////////////////////////////////////////////////

    exGraph.initializeZPD();
}

void Zpdes::generateActivity()
{
    //calculate total bandit level
    double totalBanditLevel{0};
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        totalBanditLevel += (*it).get()->banditLevel;
    }

    //for each activity in the zpd calculate the probability
    std::vector<double> probs(exGraph.zpd.size());
    int numActivity{0};
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        double wa = (*it).get()->banditLevel;
        probs[numActivity] = wa * (1 - gamma) + gamma * totalBanditLevel / exGraph.zpd.size();
        numActivity++;
    }

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());
    std::string description;
    double banditLevel;
    unsigned index = d(gen);
    if(exGraph.zpd.size() > index) {
        auto it = exGraph.zpd.begin();
        std::advance(it, index);
        description = (*it).get()->description;
        banditLevel = (*it).get()->banditLevel;
        lastActivityId = (*it).get()->id;
    }

    std::ostringstream strs;
    strs << banditLevel;
    std::string str = strs.str();

    std::list<std::string> story = storyGen.generateStory(lastActivityId);

    std::string jsonStory = getJsonStory(story, description);

    //emit activityGenerated(QString::fromStdString(description + ", bandit level: " + str));
    emit activityGenerated(QString::fromStdString(jsonStory));
}

void Zpdes::updateZpd(const double result){
    //TODO update banditlevel of activity

    //keep record of last few activities
    if(d * 2 <= mostRecentActivities.size()) {
        mostRecentActivities.pop_back();
    }
    mostRecentActivities.push_front(std::make_pair(lastActivityId, result));

    //calculate reward
    //current success

    double curSuccess{0};
    double prevSuccess{0};
    auto it = mostRecentActivities.begin();
    //current success
    for(unsigned counter{0}; it != mostRecentActivities.end() && counter < d; counter++) {
        curSuccess += (*it).second;
        it++;
    }

    //previous success
    for(; it != mostRecentActivities.end(); it++) {
        prevSuccess += (*it).second;
    }

    double reward = (curSuccess - prevSuccess) / d;

    std::ostringstream strs;
    strs << reward;
    std::string str = strs.str();
    emit rewarded(QString::fromStdString("reward: " + str));

    auto last = exGraph.getActivityFromId(lastActivityId);
    last.get()->banditLevel = last.get()->beta * last.get()->banditLevel + last.get()->eta * reward;


    //TODO update ZPD

    generateActivity();
}

std::string Zpdes::getJsonStory(std::list<std::string> story, std::string activityDesc) {
    std::ostringstream json;
    json << "{ ";
    unsigned counter{0};
    for(auto it = story.begin(); it != story.end(); it++) {
        json << "\"story" << counter << "\": \"" << *it << "\", ";
        counter++;
    }
    json << "\"activity\": \"" << activityDesc << "\"";
    json << " }";
    std::string jsonStr = json.str();

    qDebug() << QString::fromStdString(jsonStr);
    return jsonStr;
}
