#include "zpdes.h"
#include <sstream>

Zpdes::Zpdes(QObject *parent) : QObject(parent)
{
    //initialize all activities
    initializeActivities();

}


void Zpdes::initializeActivities() {
    //TODO (later): search database for activities, for now just an example exploration graph

    //for each activity make an activity object
    Activity a("C2", 0.9, "C2");
    Activity b("C1", 0.4, "C1", std::make_shared<Activity>(a));

    exGraph.addActivity(a);
    exGraph.addActivity(b);

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
    unsigned index = d(gen);
    if(exGraph.zpd.size() > index) {
        auto it = exGraph.zpd.begin();
        std::advance(it, index);
        description = (*it).get()->description;
    }

    emit activityGenerated(QString::fromStdString(description));
}

void Zpdes::updateZpd(const double result){
    //TODO
}
