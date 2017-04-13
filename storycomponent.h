#ifndef STORYCOMPONENT_H
#define STORYCOMPONENT_H

#include <string>
#include <list>
#include <utility>
#include <vector>
#include <memory>

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
    StoryComponent(std::string id, StoryType type, std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > desc):
        id(id),
        storyType(type),
        description(desc) { }
    StoryComponent(std::string id, StoryType type, std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > desc, Location prec):
        id(id),
        storyType(type),
        description(desc),
        preCondition(prec) { }
    StoryComponent(std::string id, StoryType type, std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > desc, Location prec, Location postc):
        id(id),
        storyType(type),
        description(desc),
        preCondition(prec),
        postCondition(postc) { }

    Location getPrec();
    Location getPostc();
    StoryType getType();
    std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > getStory();

private:
    std::string id;
    StoryType storyType;
    std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > description;
    Location preCondition;
    Location postCondition;

};

#endif // STORYCOMPONENT_H
