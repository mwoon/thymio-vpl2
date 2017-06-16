#ifndef ZPDES_H
#define ZPDES_H

#include <QObject>
#include <random>
#include <vector>
#include <sstream>
#include <iostream>
#include <QtDebug>
#include "activity.h"
#include "storygenerator.h"
#include "explorationgraph.h"

class Zpdes : public QObject
{
    Q_OBJECT
public:
    //constructor
    explicit Zpdes(QObject *parent = 0);

    std::string chooseActivity(std::list<std::string> availables);

    void updateZpd(const double result);
    void resetZpdes();

signals:
    void activityGenerated(const QString& newText);
    void rewarded(const QString& newText);

public slots:

private:
    //constants are currently arbitrary
    const double gamma = 0.8; //exploration rate
    unsigned numExercises = 0;

    //ExplorationGraph exGraph;
    //StoryGenerator storyGen;
    //std::list<std::pair<std::string, double> > mostRecentActivities;
    std::shared_ptr<Activity>  lastActivity; //the group identifier which contains the name of all included exercises
    std::string lastActivitySpecific; //the actual exercise that was solved
    std::shared_ptr<Activity>  lastActivityMinor; //the level of the exercise that was solved.


    void initializeActivities();
    std::string getJsonStory(std::list<std::string> beforeAc, std::list<std::string> afterAc, std::string activityDesc);



    // ---------- 20.05.2017 changes -------------
    //first activity in the list is a dummy, the id contains the ids of all subsequent exercise
    std::list<std::list<std::shared_ptr<Activity>> > majorActivities;
    std::list<std::shared_ptr<Activity> > minorActivities;

    unsigned activityFromZpd(std::list<std::shared_ptr<Activity>> &zpd);
};

#endif // ZPDES_H
