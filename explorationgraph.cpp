#include "explorationgraph.h"

ExplorationGraph::ExplorationGraph()
{

}

std::shared_ptr<Activity> ExplorationGraph::getActivityFromId(std::string id)
{
    return activities.find(id)->second;
}

void ExplorationGraph::addActivity(Activity a)
{
    activities.insert(std::make_pair(a.id, std::make_shared<Activity>(a)));

    if(a.successor) {
        auto it = nodes.begin();
        for(; it != nodes.end(); it++) {
            if((*it).front().get()->id == a.successor.get()->id) {
                (*it).push_front(getActivityFromId(a.id));
                break;
            }
        }
        //successor not found
        if(it == nodes.end()) {
            throw std::invalid_argument("activity successor not found, insert activities in right order");
        }
    } else {
        //no successor
        nodes.push_front(std::list<std::shared_ptr<Activity> >());
        nodes.front().push_front(getActivityFromId(a.id));
    }


}

//initialization with all exercises of same difficulty level
void ExplorationGraph::initializeZPD()
{
    zpd.clear();

    for(auto it = nodes.begin(); it != nodes.end(); it++) {
        unsigned counter{0};
        for(auto it2 = (*it).begin(); it2 != (*it).end() && counter < eye; it2++) {
            zpd.push_back(getActivityFromId((*it2).get()->id));
            counter++;
        }
    }
}

void ExplorationGraph::updateZPD(std::string id, double newSuccess) {
    //the last activity, it will be updated
    auto ua = getActivityFromId(id);

    //update the successrate
    ua.get()->successRate.second++;
    ua.get()->successRate.first += newSuccess;

    double successRate = ua.get()->successRate.first / ua.get()->successRate.second;

    //if success is higher than omega and bandit level smaller theta expression
    //remove current activity and add new activities
    //activate new activities

    if(successRate > omega) {
        if(!ua.get()->successor || (ua.get()->banditLevel < ua.get()->successor.get()->banditLevel*theta)) {
            ua.get()->banditLevel = 0;
            zpd.remove(ua);

            //get the activity to be added and its successor
            auto prev = ua;
            unsigned counter{0};
            while(counter < eye) {
                counter++;
                if(ua.get()->successor) {
                    prev = ua;
                    ua = ua.get()->successor;
                } else {
                    break;
                }
            }

            if(counter == eye) { //i+Ith activity found
                ua.get()->banditLevel = prev.get()->banditLevel;
                zpd.push_back(ua);
            }
        }
    }
}

