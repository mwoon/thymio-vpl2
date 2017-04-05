#include "explorationgraph.h"

ExplorationGraph::ExplorationGraph()
{

}

std::shared_ptr<Activity> ExplorationGraph::getActivityFromId(std::string id)
{
    return std::make_shared<Activity>(activities.find(id)->second);
}

void ExplorationGraph::addActivity(Activity a)
{
    activities.insert(std::make_pair(a.id, a));

    if(a.successor) {
        auto it = nodes.begin();
        for(; it != nodes.end(); it++) {
            if((*it).front().id == a.successor.get()->id) {
                (*it).push_front(a);
                break;
            }
        }
        //successor not found
        if(it == nodes.end()) {
            throw std::invalid_argument("activity successor not found, insert activities in right order");
        }
    } else {
        //no successor
        nodes.push_front(std::list<Activity>());
        nodes.front().push_front(a);
    }
}

//initialization with all exercises of same difficulty level
void ExplorationGraph::initializeZPD()
{
    zpd.clear();

    for(auto it = nodes.begin(); it != nodes.end(); it++) {
        zpd.push_back(std::make_shared<Activity>((*it).front()));
    }
}
