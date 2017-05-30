#ifndef STORYTELLER_H
#define STORYTELLER_H

#include <QObject>
#include <QtDebug>
#include <sstream>
#include <string>
#include "scriptblock.h"

class StoryTeller : public QObject
{
    Q_OBJECT
public:
    explicit StoryTeller(QObject *parent = 0);




signals:
    void segmentGenerated(const QString& newText);


public slots:
    void advanceScript();



private:
    // simplification of main story

    // The script of the story
    // use mainIndex to keep track of where the story is at
    unsigned mainIndex;
    std::vector<ScriptBlock> script;
    void initializeScript();

    std::string makeJsonArray(std::string propertyName, std::list<std::string> content);
};

#endif // STORYTELLER_H
