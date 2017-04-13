#ifndef STORYGENERATOR_H
#define STORYGENERATOR_H

#include <string>
#include <list>
#include <memory>
#include <random>
#include "storycomponent.h"

class StoryGenerator
{
public:
   StoryGenerator();
   std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > generateStory(std::string activityId);

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
};

#endif // STORYGENERATOR_H