#ifndef STORYGENERATOR_H
#define STORYGENERATOR_H

#include <string>
#include <list>
#include <memory>
#include <random>
#include <QtDebug>
#include <sstream>
#include "storycomponent.h"
#include "scriptblock.h"

class StoryGenerator
{
public:
   StoryGenerator();
   std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > generateStory(std::string activityId);


   // ---------- 20.05.2017 changes -------------
   void advanceScript();

private:
    void initializeStory();

    std::list<std::shared_ptr<StoryComponent> > storyTrsSections; //transitions
    std::list<std::shared_ptr<StoryComponent> > storyStnSections; //stationaries
    std::vector<std::shared_ptr<StoryComponent> > storyMainSections; //main story

    unsigned mainIndex; //where the main story is at

    //state variables
    //1: starting location, 2: foresty area, 3: river, 4: lake, 5: island edge
    //0: not specified / no constraint
    //1 -> 2,3; 2 -> 3,4,5; 3 -> 1,2,4,5; 4 -> 2,3; 5 -> 2,3;
    Location sLocation;

    // ---------- 20.05.2017 changes -------------
    // simplification of main story

    // The script of the story
    // use mainIndex to keep track of where the story is at
    std::vector<ScriptBlock> script;

    std::string makeJsonArray(std::string propertyName, std::list<std::string> content);

};

#endif // STORYGENERATOR_H
