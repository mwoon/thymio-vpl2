#include "storygenerator.h"

StoryGenerator::StoryGenerator()
{
    initializeStory();
}



void StoryGenerator::initializeStory() {
    //TODO (later): search database for stories, for now just an examples

    //Initialise state for first story component
    sLocation = Location::StartOne;

    //setup possible story pieces
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc1", "They move towards the forest.", "The forest is full of leafy trees. Perfect, for hiding from the hot sun.", Location::StartOne, Location::ForestOne)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc2", "The trail they follow leads to a river", "The water gurgles as it rushes past them. It is impossible to get across without getting wet.", Location::ForestOne, Location::RiverOne)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc3", "They walk along the side of the river. Thymio shys away from the splashing water.", "At the end of the river, they watch the water flow down the edge of the island. In the distance, they see another floating island with a huge structure peeking out over snow covered rocks.", Location::RiverOne, Location::EdgeOne)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc4", "Ada is wary of walking along the edge of the island. She urges them to head back into the forest.", "The protection by the trees takes their minds off of the sharp cliffs around the island.", Location::EdgeOne, Location::ForestOne)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc5", "Ada's nose twitches and she squeezes past the dense bushes. Thymio follows her and sees that the huge leaves on the trees hide a small lake from view.", "The water glistens in the sunlight. It is a nice and relaxing place to rest.", Location::ForestOne, Location::LakeOne)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc6", "It is time to leave again. The pair head back into the forest.", "It takes them some time to find the path. After squeezing underneath a bush the path comes back into view.", Location::LakeOne, Location::ForestOne)));

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

    //fill out location description
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


    //Find Matching story component
    //find all the components that fit, choose one at random
    std::vector<std::shared_ptr<StoryComponent> > matches;
    for(auto it = storySections.begin(); it != storySections.end(); it++) {
        if((*it).get()->preCondition == Location::None || (*it).get()->preCondition == sLocation) {
            matches.push_back(*it);
        }
    }

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, matches.size() - 1);

    //index of chosen story
    int index = dis(gen);

    //update location
    sLocation = matches[index].get()->postCondition;

    sequence.push_back(matches[index].get()->description.first);
    sequence.push_back(matches[index].get()->description.second);

    return sequence;
}
