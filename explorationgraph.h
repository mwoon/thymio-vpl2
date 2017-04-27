#ifndef EXPLORATIONGRAPH_H
#define EXPLORATIONGRAPH_H

#include <list>
#include <map>
#include <string>
#include <memory>
#include "activity.h"
#include <QtDebug>

class ExplorationGraph
{
public:
    ExplorationGraph();

    std::list<std::shared_ptr<Activity> > zpd;

    std::shared_ptr<Activity> getActivityFromId(std::string id);
    void updateZPD(std::string id, double newSuccess);
    void addActivity(Activity a);
    void initializeZPD();

private:
    const double theta = 0.3; //
    const double omega = 0.7; //success rate threshold, for removing activities from ZPD
    const unsigned eye = 2; //number of activities to activate

    std::list<std::list <std::shared_ptr<Activity> > > nodes;
    std::map<std::string, std::shared_ptr<Activity>> activities;

};

#endif // EXPLORATIONGRAPH_H
/*
exploration graph should keep a list of all the activities with the same level
need this for the 'free exploration' of nodes that
*/
