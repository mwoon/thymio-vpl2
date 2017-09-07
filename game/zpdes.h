#ifndef ZPDES_H
#define ZPDES_H

#include <QObject>
#include <random>
#include <vector>
#include <sstream>
#include <iostream>
#include <QtDebug>
#include "game/activity.h"

class Zpdes : public QObject
{
    Q_OBJECT
public:
    //constructor
    explicit Zpdes(QObject *parent = 0);

    std::string chooseActivity(std::list<std::string> availables);

    std::string updateZpd(const double result);
    void resetZpdes();

    void setLastActivity(std::string name);


signals:
    void activityGenerated(const QString& newText);
    void rewarded(const QString& newText);

public slots:

private:
    //constants are currently arbitrary
    const double gamma = 0.3; //exploration rate
    unsigned numExercises = 0;

    std::shared_ptr<Activity>  lastActivity; //the group identifier which contains the name of all included exercises
    std::string lastActivitySpecific; //the actual exercise that was solved
    std::shared_ptr<Activity>  lastActivityMinor; //the type of the exercise that was solved.
    std::shared_ptr<Activity>  lastActivityComplexity; //the complexity of the exercise that was solved.


    void initializeActivities();
    std::string getJsonStory(std::list<std::string> beforeAc, std::list<std::string> afterAc, std::string activityDesc);

    std::list<std::shared_ptr<Activity> > minorActivities;
    std::list<std::shared_ptr<Activity> > complexityActivities;
    std::list<std::shared_ptr<Activity> > categoryActivities;

    unsigned activityFromZpd(std::list<std::shared_ptr<Activity>> &zpd);
};

#endif // ZPDES_H
