#ifndef STORYTELLER_H
#define STORYTELLER_H

#include <QObject>
#include <random>
#include <QtDebug>
#include <QFile>
#include <QDir>
#include <QTextStream>
#include <sstream>
#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include "scriptblock.h"
#include "zpdes.h"

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
    void writeLogToFile(QString fileName);

    //simulation slots
    void simulateWithFailPercent(const double percent);

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
};

#endif // STORYTELLER_H
