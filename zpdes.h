#ifndef ZPDES_H
#define ZPDES_H

#include <QObject>
#include <random>
#include <vector>
#include "activity.h"
#include "explorationgraph.h"

class Zpdes : public QObject
{
    Q_OBJECT
public:
    //constants are currently arbitrary
    const double theta = 0.6; //
    const double omega = 0.7; //success rate threshold
    const int eye = 1; //number of activities to activate
    const double gamma = 0.7; //exploration rate
    const int d = 5; // number of most recent activities to consider when calculating the reward

    //constructor
    explicit Zpdes(QObject *parent = 0);

signals:
    void activityGenerated(const QString& newText);

public slots:
    void updateZpd(const double result);
    void generateActivity();

private:
    ExplorationGraph exGraph;

    void initializeActivities();

};

#endif // ZPDES_H
