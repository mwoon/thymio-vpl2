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
        zpd.push_back(getActivityFromId((*it).front().get()->id));
    }
}
