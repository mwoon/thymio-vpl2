#ifndef STORYCOMPONENT_H
#define STORYCOMPONENT_H

#include <string>
#include <utility>
#include <vector>

enum class Location { //numbering refers to island, maybe don't need so many? is it better to add them as needed?
    None,
    StartOne,
    ForestOne,
    RiverOne,
    LakeOne,
    CaveOne,
    EdgeOne,
    HutOne,

    VillageTwo,
    LakeTwo,
    StoneSlabTwo,
    MountainTwo,
    MetalHouseTwo,
    CliffTwo,

    OutsideLabThree,
    EdgeThree,
    EntranceThree,
    CompilerRoomThree,
    DataRoomThree,
    ArchivesThree,

    PortalFour,
    EdgeFour

};

enum class StoryType {
    Main,
    Side,
    Transition,
    Stationary,
    Unlock

};


class StoryComponent
{
public:
    StoryComponent();
    StoryComponent(std::string id):
        id(id) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter):
        id(id),
        description(descBefore, descAfter) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter, Location prec):
        id(id),
        description(descBefore, descAfter),
        preCondition(prec) { }
    StoryComponent(std::string id, std::string descBefore, std::string descAfter, Location prec, Location postc):
        id(id),
        description(descBefore, descAfter),
        preCondition(prec),
        postCondition(postc) { }

    std::string id;
    std::pair<std::string, std::string> description;
    Location preCondition;
    Location postCondition;
    unsigned storyType; //unused for now

};

#endif // STORYCOMPONENT_H
