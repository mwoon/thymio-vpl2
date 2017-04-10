#ifndef STORYCOMPONENT_H
#define STORYCOMPONENT_H

#include <string>
#include <utility>
#include <vector>

class StoryComponent
{
public:
    StoryComponent();
    StoryComponent(std::string id):
        id(id) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter):
        id(id),
        description(descBefore, descAfter) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter, unsigned prec):
        id(id),
        description(descBefore, descAfter),
        preCondition(prec) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter, unsigned prec, unsigned postc):
        id(id),
        description(descBefore, descAfter),
        preCondition(prec),
        postCondition(postc) { }

    std::string id;
    std::pair<std::string, std::string> description;
    unsigned preCondition;
    unsigned postCondition;
    unsigned storyType; //unused for now

};

#endif // STORYCOMPONENT_H
