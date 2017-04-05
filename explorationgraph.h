#ifndef EXPLORATIONGRAPH_H
#define EXPLORATIONGRAPH_H

#include <list>
#include <map>
#include <string>
#include <memory>
#include "activity.h"

class ExplorationGraph
{
public:
    ExplorationGraph();

    std::list<std::shared_ptr<Activity> > zpd;

    std::shared_ptr<Activity> getActivityFromId(std::string id);
    void addActivity(Activity a);
    void initializeZPD();

private:

    std::list<std::list <Activity> > nodes;
    std::map<std::string, Activity> activities;
};

#endif // EXPLORATIONGRAPH_H
