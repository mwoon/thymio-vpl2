#include "storygenerator.h"

StoryGenerator::StoryGenerator()
{
    initializeStory();
}



void StoryGenerator::initializeStory() {
    //TODO (later): search database for stories, for now just an examples

    //Initialise state for first story component
    //TODO fetch state from database
    sLocation = Location::StartOne;
    //TODO fetch main story index from database
    mainIndex = 0;

    //setup possible story pieces
    //transitions START
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr1",
                StoryType::Transition,
                "They move towards the forest.",
                "The forest is full of leafy trees. Perfect, for hiding from the hot sun.",
                Location::StartOne, Location::ForestOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr2",
                StoryType::Transition,
                "The trail they follow leads to a river",
                "The water gurgles as it rushes past them. It is impossible to get across without getting wet.",
                Location::ForestOne, Location::RiverOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr3",
                StoryType::Transition,
                "They walk along the side of the river. Thymio shys away from the splashing water.",
                "At the end of the river, they watch the water flow down the edge of the island. "
                "In the distance, they see another floating island with a huge structure peeking out over snow covered rocks.",
                Location::RiverOne, Location::EdgeOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr4",
                StoryType::Transition,
                "Ada is wary of walking along the edge of the island. She urges them to head back into the forest.",
                "The protection by the trees takes their minds off of the sharp cliffs around the island.",
                Location::EdgeOne, Location::ForestOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr5",
                StoryType::Transition,
                "Ada's nose twitches and she squeezes past the dense bushes. "
                "Thymio follows her and sees that the huge leaves on the trees hide a small lake from view.",
                "The water glistens in the sunlight. It is a nice and relaxing place to rest.",
                Location::ForestOne, Location::LakeOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr6",
                StoryType::Transition,
                "It is time to leave again. The pair head back into the forest.",
                "It takes them some time to find the path. After squeezing underneath a bush the path comes back into view.",
                Location::LakeOne, Location::ForestOne
    )));
    //transitions END

    //main story START
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m1",
                StoryType::Main,
                "m1",
                "m1",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m2",
                StoryType::Main,
                "m2",
                "m2",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m3",
                StoryType::Main,
                "m3",
                "m3",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m4",
                StoryType::Main,
                "m4",
                "m4",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m5",
                StoryType::Main,
                "m5",
                "m5",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m6",
                StoryType::Main,
                "m6",
                "m6",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m7",
                StoryType::Main,
                "m7",
                "m7",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m8",
                StoryType::Main,
                "m8",
                "m8",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m9",
                StoryType::Main,
                "m9",
                "m9",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m10",
                StoryType::Main,
                "m10",
                "m10",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m11",
                StoryType::Main,
                "m11",
                "m11",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m12",
                StoryType::Main,
                "m12",
                "m12",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m13",
                StoryType::Main,
                "m13",
                "m13",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m14",
                StoryType::Main,
                "m14",
                "m14",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m15",
                StoryType::Main,
                "m15",
                "m15",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m16",
                StoryType::Main,
                "m16",
                "m16",
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m17",
                StoryType::Main,
                "m17",
                "m17",
                Location::StartOne, Location::StartOne
    )));
    //main story END

}


std::list<std::string> StoryGenerator::generateStory(std::string activityId) {
    // final structure is like this:
    // 1. describe location
    // 2. description from story component
    // 3. activity lead in
    // 4. ouput activity
    // 5. successful conclusion of story
    // 6. unsuccessful conclusion of story (not now)
    // for now:
    // 1. describe location
    // 2. story description before activity
    // 3. activity
    // 4. conclusion

    //Find a story component that fits
    //find a lead-in that matches story chosen
    //find a lead-out that matches story

    std::list<std::string> sequence;

    //location description START
    //A better way to do this: use a map
    std::string locationDescription;
    switch (sLocation) {
        case Location::StartOne : locationDescription = "Thymio and Ada are at the place they first met.";
                 break;
        case Location::ForestOne : locationDescription = "Thymio and Ada are in the forest.";
                 break;
        case Location::RiverOne : locationDescription = "Thymio and Ada are at the river.";
                 break;
        case Location::LakeOne : locationDescription = "Thymio and Ada are by the lakeside.";
                 break;
        case Location::EdgeOne : locationDescription = "Thymio and Ada are at the edge of the island.";
                 break;
        default : locationDescription = "Thymio and Ada are somewhere.";
                 break;
    }
    sequence.push_back(locationDescription);
    // location description END

    //Find Matching story components
    //find all the components that fit, choose one at random
    std::vector<std::shared_ptr<StoryComponent> > matchesStn;

    std::random_device rd;
    std::mt19937 gen(rd());

    //check if main story can be advanced
    //TODO: this needs to be changed once it's clear how Knowledge components update
    if(mainIndex < storyMainSections.size()) {
        bool mainStoryCanAdvance = storyMainSections[mainIndex].get()->getPrec() == Location::None || storyMainSections[mainIndex].get()->getPrec() == sLocation;
        if (mainStoryCanAdvance) {
            sequence.push_back(storyMainSections[mainIndex].get()->getPart1());
            sequence.push_back(storyMainSections[mainIndex].get()->getPart2());

            mainIndex++;
        }
    } else {
        //TODO: also add stationaries in here later
        //Auto choose transition section START
        std::vector<std::shared_ptr<StoryComponent> > matchesTrs;
        for(auto it = storyTrsSections.begin(); it != storyTrsSections.end(); it++) {
            if((*it).get()->getPrec() == Location::None || (*it).get()->getPrec() == sLocation) {
                matchesTrs.push_back(*it);
            }
        }

        std::uniform_int_distribution<> dis(0, matchesTrs.size() - 1);

        //index of chosen story
        int index = dis(gen);

        //update location
        sLocation = matchesTrs[index].get()->getPostc();

        sequence.push_back(matchesTrs[index].get()->getPart1());
        sequence.push_back(matchesTrs[index].get()->getPart2());
        //Auto choose transition section END
    }


    return sequence;
}
