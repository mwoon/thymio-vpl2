#ifndef STORYTELLER_H
#define STORYTELLER_H

#include <QObject>
#include <QStandardPaths>
#include <random>
#include <QSysInfo>
#include <QtDebug>
#include <QFile>
#include <QDir>
#include <QTextStream>
#include <sstream>
#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include "game/scriptblock.h"
#include "game/zpdes.h"

class StoryTeller : public QObject
{
    Q_OBJECT
public:
    explicit StoryTeller(QObject *parent = 0);




signals:
    void segmentGenerated(const QString& newText);


public slots:
    QString advanceScript();
    void resetScript();
    void completeExercise(const double result);
    QString lastGenerated();

    void appendToLog(QString toLog);
    void writeLogToFile(QString fileName);

    //simulation slots
    void simulateWithFailPercent(const double percent);
    void simulateFixedSuccessByTypeOfExercise(const double prob1, const double prob2, const double prob3, const double prob4, const double prob5);
    void simulateIncreasePerTrial();
    void simulateIptSc();

    //not strictly speaking part of the storyteller but this is a convenient place to put it
    //used to load ground texture images for the simulator because those need to be external files
    QString returnExerciseFolder();

private:
    // simplification of main story

    // The script of the story
    // use mainIndex to keep track of where the story is at
    unsigned mainIndex;
    unsigned successfulExercises;
    unsigned totalExInBlock;

    const unsigned succExLimit = 3;
    const unsigned totalExLimit = 10;

    std::vector<ScriptBlock> script;
    Zpdes its;
    QString last;
    std::list<std::string> log;

    void initializeScript();
    std::string makeJsonArray(std::string propertyName, std::list<std::string> content);
    std::string makeJsonArray(std::string propertyName, std::string content);
    std::string readFromFile(const std::string &fileName);

    unsigned logcounter{0};


    //simulation used for increase per trial
    double type1Rate{0};
    double type2Rate{0};
    double type3Rate{0};
    double type4Rate{0};
    double type5Rate{0};
};

#endif // STORYTELLER_H
