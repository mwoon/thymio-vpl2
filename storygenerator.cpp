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
                                       "\\\"What was that? Let's go check it out!\\\"",
                                       "She grabs the tablet and sprints off."},
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
                                       "\\\"I think it needs help.\\\" She says",
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
                std::list<std::string>{"Something inside Thymio whirrs and his wheels move him forwards. Ada hurries to catch up."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m5",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"Ada hurries to catch up. \\\"Hey, hey wait up! Do you even know where you're going?\\\"",
                                       "Thymio's wheels never stop as he answers her. \\\"Yes, my memory tells me that I should reach home if I keep heading straight.\\\"",
                                       "Ada becomes alarmed at his words. She jumps in front of Thymio and holds him back. \\\"We need to give him a program to stop him. Please help me!\\\""},
                std::list<std::string>{"Thymio's wheels stop and Ada breaths a sigh of relief.",
                                       "\\\"What do you mean 'if you keep heading straight'? You’ll fall off the island if you do that!\\\"",
                                       "\\\"Island?\\\" He asks.",
                                       "Ada is shocked. \\\"You don't know that you're on a floating island right now?\\\"",
                                       "Thymio doesn't answer which confirms Ada's suspicions."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m6",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"\\\"Wow, under what rock have you been living until now?\\\"",
                                       "\\\"I come from the planet known as Earth. On Earth, it is impossible to fall off an island. Islands do not float.\\\"",
                                       "Both are quiet for a while. Thymio is unsure how he will find his way to his destination.",
                                       "\\\"I suppose I can show you a way to get onto another island. Do you know where it is you need to go?\\\"",
                                       "\\\"Your unexpected information tells me I might have some corrupted memory, so I'm not sure if everything I remember is correct. I seem to have arrived out of a large portal of some kind.\\\"",
                                       "\\\"Hmm… A large portal?\\\" Ada thinks for a moment. She looks over the tips of the trees and into the distance. A stone structure can be seen just over the tops of the trees.",
                                       "\\\"It is in this direction. But we'll have to find a way to get onto the other island first. Follow me!\\\" She declares and walks ahead and through the forest.",
                                       "When they reach a corner in the path, Thymio stops and says \\\"Hold on. I am unable to turn in the moment. Would you help me restore that function? I don't think I will be able to follow the path otherwise.\\\"",},
                std::list<std::string>{"Thymio tests out the turning features. He spins in a circle a few times. \\\"Okay, I think it works. I just need to boot up the previous program...\\\" Thymio stops spinning. \\\"There! I'm ready to set off now.\\\"",
                                       "Ada looks at Thymio in wonder. \\\"You can just turn on any program you want?\\\"",
                                       "\\\"No, I can't. Not at the moment at least. A huge portion of my storage was lost when I came here. I don't have enough space to store everything anymore.\\\"",
                                       "\\\"It's not something we can fix with this tablet thing?\\\" Ada sounds like she already knows the answer.",
                                       "\\\"No, I don't think you can. I was given the tablet in case my basic functions were not enough to handle something. I am lucky that it can restore my basic functions at all. The only way to get me fixed is for me to head back home.\\\"",
                                       "Ada is sad for Thymio but she really wants to help him. They continue along the path with Ada in the lead."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m7",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"Sometimes they hear the sound of some insects buzzing around but the forest is quite calm.",
                                       "\\\"Is the forest here always so quiet?\\\" Thymio asks.",
                                       "\\\"Most of us live on another island. It's not so safe here.\\\" Ada tells him.",
                                       "Just then Ada stops and Thymio stops right behind her.",
                                       "\\\"Shhhh!\\\" Ada says and points to a huge robot. \\\"Let's go around it, but we need to be quiet. Can you go as slowly as possible?\\\"",
                                       "\\\"I'll need a new program for that.\\\"",},
                std::list<std::string>{"They sneak away from the robot without getting its attention.",
                                       "\\\"When you said it was dangerous around here, you were talking about that robot, weren't you?\\\" Thymio asks.",
                                       "Ada nods. \\\"That robot goes around the island chasing off anyone it sees. That's why everyone is living on the other island now.\\\"",
                                       "\\\"But that must mean that there are other robots around here, right?\\\" Thymio wants to talk with another robot. \\\"Maybe they will know why my systems were damaged when I came here.\\\"",
                                       "Ada looks away and shakes her head. \\\"I don't think you'll be able to talk to any robot. They all don't talk like you do and they just want to chase everyone away. They're dangerous.\\\"",
                                       "\\\"I see. Then we'll just head for the portal.\\\" He hasn't given up on the other robots yet, but there is no reason for him to argue with Ada when he doesn't know much about this world.",
                                       "They travel in silence for a while."})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m8",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m8a"},
                std::list<std::string>{"m8b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m9",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m9a"},
                std::list<std::string>{"m9b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m10",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m10a"},
                std::list<std::string>{"m10b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m11",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m11a"},
                std::list<std::string>{"m11b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m12",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m12a"},
                std::list<std::string>{"m12b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m13",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m13a"},
                std::list<std::string>{"m13b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m14",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m14a"},
                std::list<std::string>{"m14b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m15",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m15a"},
                std::list<std::string>{"m15b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m16",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m16a"},
                std::list<std::string>{"m16b"})),
                Location::StartOne, Location::StartOne
    )));
    storyMainSections.push_back(
        std::make_shared<StoryComponent>(
            StoryComponent(
                "m17",
                StoryType::Main,
                std::make_shared<std::pair<std::list<std::string>, std::list<std::string> > >(std::make_pair(
                std::list<std::string>{"m17a"},
                std::list<std::string>{"m17b"})),
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
