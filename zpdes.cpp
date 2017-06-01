#include "zpdes.h"
Zpdes::Zpdes(QObject *parent) : QObject(parent)
{
    //initialize all activities
    initializeActivities();
}

/*
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

    std::ostringstream strs;
    strs << "ZPD contains: ";
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        strs << (*it).get()->id;
        strs << ", ";
    }
    qDebug() << (QString::fromStdString(strs.str()));
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

    std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > story = storyGen.generateStory(lastActivityId);

    std::string jsonStory = getJsonStory(story.get()->first, story.get()->second, std::to_string(++numExercises) + ". "+ description);

    //emit activityGenerated(QString::fromStdString(description + ", bandit level: " + str));
    emit activityGenerated(QString::fromStdString(jsonStory));
}
*/

///////////////////////////////
//Section with new structure

void Zpdes::initializeActivities() {
    //block 1
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E01E02E03", 0.0, "\"dummy1\"")),
                             std::make_shared<Activity>(Activity("E01", 0.5, "\"E01\"")),
                             std::make_shared<Activity>(Activity("E02", 0.5, "\"E02\""))
                         });

    //block 2
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E03E04E05", 0.0, "\"dummy2\"")),
                             std::make_shared<Activity>(Activity("E03", 0.5, "\"E03\"")),
                             std::make_shared<Activity>(Activity("E04", 0.5, "\"E04\"")),
                             std::make_shared<Activity>(Activity("E05", 0.5, "\"E05\""))
                         });

    //block 3
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E06", 0.0, "\"dummy3\"")),
                             std::make_shared<Activity>(Activity("E06", 0.5, "\"E06\"")),
                             std::make_shared<Activity>(Activity("E08", 0.5, "\"E08\""))
                         });
    //block 4
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E11E09E10", 0.0, "\"dummy4\"")),
                             std::make_shared<Activity>(Activity("E11", 0.5, "\"E11\"")),
                             std::make_shared<Activity>(Activity("E09", 0.5, "\"E09\"")),
                             std::make_shared<Activity>(Activity("E10", 0.5, "\"E10\""))
                         });
    //block 5
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E13E14E15", 0.0, "\"dummy5\"")),
                             std::make_shared<Activity>(Activity("E13", 0.5, "\"E13\"")),
                             std::make_shared<Activity>(Activity("E14", 0.5, "\"E14\"")),
                             std::make_shared<Activity>(Activity("E15", 0.5, "\"E15\""))
                         });

    //block 6
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E26E32E34E35E31E27E25E33", 0.0, "\"dummy6\"")),
                             std::make_shared<Activity>(Activity("E26E32E34E35E31", 0.5, "\"E26 E32 E34 E35 E31\"")),
                             std::make_shared<Activity>(Activity("E27", 0.5, "\"E27\"")),
                             std::make_shared<Activity>(Activity("E25E33", 0.5, "\"E25 E33\""))
                         });
    //block 7
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E28E29E30", 0.0, "\"dummy7\"")),
                             std::make_shared<Activity>(Activity("E28", 0.5, "\"E28\"")),
                             std::make_shared<Activity>(Activity("E29E30", 0.5, "\"E29 E30\""))
                         });
    //block 8
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E36E37E39E38", 0.0, "\"dummy8\"")),
                             std::make_shared<Activity>(Activity("E36E37E39", 0.5, "\"E36 E37 E39\"")),
                             std::make_shared<Activity>(Activity("E38", 0.5, "\"E38\""))
                         });
    //block 9
    activities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E16E20E17E45E18E41E42E19E44E24E43E22E46E21E40E47E23", 0.0, "\"dummy9\"")),
                             std::make_shared<Activity>(Activity("E16", 0.5, "\"E16\"")),
                             std::make_shared<Activity>(Activity("E20E17E45", 0.5, "\"E20 E17 E45\"")),
                             std::make_shared<Activity>(Activity("E18E41E42", 0.5, "\"E18 E41 E42\"")),
                             std::make_shared<Activity>(Activity("E19E44", 0.5, "\"E19 E44\"")),
                             std::make_shared<Activity>(Activity("E24E43", 0.5, "\"E24 E43\"")),
                             std::make_shared<Activity>(Activity("E22E46", 0.5, "\"E22 E46\"")),
                             std::make_shared<Activity>(Activity("E21E40E47", 0.5, "\"E21 E40 E47\"")),
                             std::make_shared<Activity>(Activity("E23", 0.5, "\"E23\""))
                         });

}

std::string Zpdes::chooseActivity(std::list<std::string> availables) {
    std::list<std::shared_ptr<Activity>> zpd;

    //look for availables in activities list
    for(auto it = availables.begin(); it != availables.end(); it++) {
        for(auto it2 = activities.begin(); it2 != activities.end(); it2++) {
            if((it2->front()).get()->id.find(*it) != std::string::npos) {
                for(auto it3 = ++(it2->begin()); it3 != it2->end(); it3++) {
                    if((*it3).get()->id.find(*it) != std::string::npos) {
                        //add available activities to current zpd
                        //TODO add activity only if previous was activated before
                        //check sub activities and add the subs
                        qDebug() << QString::fromStdString((*it3).get()->id) << " " << QString::fromStdString(*it);
                        zpd.push_back(*it3);
                    }
                }
            }
        }
    }
    qDebug() << " ";

    //TODO make sure all activities in zpd are activated



    //calculate total bandit level
    double totalBanditLevel{0};
    for(auto it = zpd.begin(); it != zpd.end(); it++) {
        totalBanditLevel += (*it).get()->banditLevel;
    }

    //for each activity in the zpd calculate the probability
    std::vector<double> probs(zpd.size());
    int numActivity{0};
    for(auto it = zpd.begin(); it != zpd.end(); it++) {
        double wa = (*it).get()->banditLevel;
        probs[numActivity] = wa * (1 - gamma) + gamma * totalBanditLevel / zpd.size();
        numActivity++;
    }

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());

    std::string description;
   // double banditLevel;

    unsigned index = d(gen);
    if(zpd.size() > index) {
        auto zpd_it = zpd.begin();
        std::advance(zpd_it, index);
        //banditLevel = (*zpd_it).get()->banditLevel;
        lastActivityId = (*zpd_it).get()->id;


        auto avail_it = availables.begin();
        std::advance(avail_it, index);
        description = "\"" + *avail_it + "\"";
    }

    return description;
}

void Zpdes::updateZpd(const double result){
    //TODO fill out this code
    //TODO Search for exercise using lastActivityId (which should be the specific exercise)
        //Split lastactivityid into major and minor i.e. E4.6 = major: E4 and minor: 6
    //TODO ask activity to update its bandit level using major and minor
}

///////////////////////////////







/*void Zpdes::updateZpd(const double result){
    //update banditlevel of activity

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

    //reward used to update ZPD
    double reward = (curSuccess - prevSuccess) / d;

    //debug printing
    std::ostringstream strs;
    strs << reward;
    std::string str = strs.str();
    emit rewarded(QString::fromStdString(std::to_string(numExercises) + ". reward: " + str));

    //update bandit level
    auto last = exGraph.getActivityFromId(lastActivityId);
    last.get()->banditLevel = last.get()->beta * last.get()->banditLevel + last.get()->eta * reward;


    //TODO update ZPD
    exGraph.updateZPD(lastActivityId, result);

    //debug printing
    strs.clear();
    strs.str("");
    strs << "ZPD contains: ";
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        strs << (*it).get()->id << ", ";
    }
    emit rewarded(QString::fromStdString(strs.str()));
    generateActivity();
}*/

std::string Zpdes::getJsonStory(std::list<std::string> beforeAc, std::list<std::string> afterAc, std::string activityDesc) {
    std::ostringstream json;
    json << "{ ";
    json << "\"story0\" : [";
    for(auto it = beforeAc.begin(); it != beforeAc.end(); it++) {
        if(it != beforeAc.begin()) {
            json << ", ";
        }
        json << "\""<< *it << "\"";
    }
    json << "], ";

    json << "\"story1\" : [";
    for(auto it = afterAc.begin(); it != afterAc.end(); it++) {
        if(it != afterAc.begin()) {
            json << ", ";
        }
        json << "\""<< *it << "\"";
    }
    json << "], ";

    json << "\"activity\": \"" << activityDesc << "\"";
    json << " }";
    std::string jsonStr = json.str();

    //qDebug() << QString::fromStdString(jsonStr);
    return jsonStr;
}
