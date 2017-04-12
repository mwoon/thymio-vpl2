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
    Side, // not used for now
    Transition,
    Stationary,
    Unlock //not used for now

};


class StoryComponent
{
public:
    StoryComponent();
    StoryComponent(std::string id):
        id(id) { }
    StoryComponent(std::string id, StoryType type, std::string descBefore, std::string descAfter):
        id(id),
        storyType(type),
        description(descBefore, descAfter) { }
    StoryComponent(std::string id, StoryType type, std::string descBefore, std::string descAfter, Location prec):
        id(id),
        storyType(type),
        description(descBefore, descAfter),
        preCondition(prec) { }
    StoryComponent(std::string id, StoryType type, std::string descBefore, std::string descAfter, Location prec, Location postc):
        id(id),
        storyType(type),
        description(descBefore, descAfter),
        preCondition(prec),
        postCondition(postc) { }

    Location getPrec();
    Location getPostc();
    StoryType getType();
    std::string getPart1();
    std::string getPart2();

private:
    std::string id;
    StoryType storyType;
    std::pair<std::string, std::string> description;
    Location preCondition;
    Location postCondition;

};

#endif // STORYCOMPONENT_H
