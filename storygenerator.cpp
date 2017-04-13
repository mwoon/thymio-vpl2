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
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"They move towards the forest."},
                std::list<std::string>{"The forest is full of leafy trees. Perfect, for hiding from the hot sun."})),
                Location::StartOne, Location::ForestOne
    )));

    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr2",
                StoryType::Transition,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"The trail they follow leads to a river"},
                std::list<std::string>{"The water gurgles as it rushes past them.", "It is impossible to get across without getting wet."})),
                Location::ForestOne, Location::RiverOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr3",
                StoryType::Transition,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"They walk along the side of the river.", "Thymio shys away from the splashing water."},
                std::list<std::string>{"At the end of the river, they watch the water flow down the edge of the island.",
                                       "In the distance, they see another floating island with a huge structure peeking out over snow covered rocks."})),
                Location::RiverOne, Location::EdgeOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr4",
                StoryType::Transition,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"Ada is wary of walking along the edge of the island.", "She urges them to head back into the forest."},
                std::list<std::string>{"The protection by the trees takes their minds off of the sharp cliffs around the island."})),
                Location::EdgeOne, Location::ForestOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr5",
                StoryType::Transition,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"Ada's nose twitches and she squeezes past the dense bushes.",
                                       "Thymio follows her and sees that the huge leaves on the trees hide a small lake from view."},
                std::list<std::string>{"The water glistens in the sunlight. It is a nice and relaxing place to rest."})),
                Location::ForestOne, Location::LakeOne
    )));
    storyTrsSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "tr6",
                StoryType::Transition,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"It is time to leave again. The pair head back into the forest."},
                std::list<std::string>{"It takes them some time to find the path.", "After squeezing underneath a bush the path comes back into view."})),
                Location::LakeOne, Location::ForestOne
    )));
    //transitions END

    //main story START
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m1",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"A yellow creature looks at the screen of a tablet. \\\"Is anyone there?\\\" She asks. "},
                std::list<std::string>{"\\\"Hello! I'm Ada.\\\" She says."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m2",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"A loud sound comes from nearby. Ada looks up.",
                                       "\\\"What was that? Let's go check it out!",
                                       "\\\" She grabs the tablet and sprints off."},
                std::list<std::string>{"In a clearing nearby, a white robot sits against the roots of a tree. The sounds are coming from there.",
                                       "Ada is unsure if she should go closer. She waits for a while, observing the robot.",
                                       "Then she walks up to it, ready to run away should anything happen."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m3",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"The robot doesn't move. Ada looks closely at it.",
                                       "\\\"I think it needs help.\\\"",
                                       "Suddenly the screen on the tablet she is holding changes.",
                                       "\\\"Oh, I know what this is! It's a programming environment. We can use this to find out what's wrong.\\\""},
                std::list<std::string>{"\\\"There, that should be better.\\\" The robot has stopped making loud noises."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m4",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"\\\"Thank you so much for your help. I must be off now. Bye.\\\" The robot says.",
                                       "\\\"Wait, why are you in such a hurry?\\\" Ada seems frustrated at the robot.",
                                       "\\\"I must return home to have my functions restored. My systems encountered an error when I landed here.\\\"",
                                       "\\\"Hmmm... My motors have malfunctioned too, it seems. You wouldn't mind helping out again, would you?\\\"",
                                       "Ada smirks at him. \\\"Only if you tell me your name.\\\"",
                                       "\\\"My name is Thymio-ASB45XQ92.\\\"",
                                       "\\\"Oh wow, that sure is a mouthful. I'll just call you Thymio.\\\"",
                                       "Thymio takes a while to respond.",
                                       "\\\"That is acceptable.\\\""},
                std::list<std::string>{"m4"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m5",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m5"},
                std::list<std::string>{"m5"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m6",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m6"},
                std::list<std::string>{"m6"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m7",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m7"},
                std::list<std::string>{"m7"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m8",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m8"},
                std::list<std::string>{"m8"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m9",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m9"},
                std::list<std::string>{"m9"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m10",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m10"},
                std::list<std::string>{"m10"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m11",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m11"},
                std::list<std::string>{"m11"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m12",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m12"},
                std::list<std::string>{"m12"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m13",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m13"},
                std::list<std::string>{"m13"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m14",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m14"},
                std::list<std::string>{"m14"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m15",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m15"},
                std::list<std::string>{"m15"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m16",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m16"},
                std::list<std::string>{"m16"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m17",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m17"},
                std::list<std::string>{"m17"})),
                Location::StartOne, Location::StartOne
    )));
    //main story END

}


std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > StoryGenerator::generateStory(std::string activityId) {
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

    std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > sequence;

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
            sequence = storyMainSections[mainIndex].get()->getStory();
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

        sequence = (matchesTrs[index].get()->getStory());
        //Auto choose transition section END
    }


    return sequence;
}
