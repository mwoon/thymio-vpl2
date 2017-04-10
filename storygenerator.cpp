#include "storygenerator.h"

StoryGenerator::StoryGenerator()
{
    initializeStory();
}



void StoryGenerator::initializeStory() {
    //TODO (later): search database for stories, for now just an examples

    //Initialise state for first story component
    sLocation = 1;

    //setup possible story pieces
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc1", "They move towards the forest.", "The forest is full of leafy trees. Perfect, for hiding from the hot sun.", 1, 2)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc2", "The trail they follow leads to a river", "The water gurgles as it rushes past them. It is impossible to get across without getting wet.", 2, 3)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc3", "They walk along the side of the river. Thymio shys away from the splashing water.", "At the end of the river, they watch the water flow down the edge of the island. In the distance, they see another floating island with a huge structure peeking out over snow covered rocks.", 3, 5)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc4", "Ada is wary of walking along the edge of the island. She urges them to head back into the forest.", "The protection by the trees takes their minds off of the sharp cliffs around the island.", 5, 2)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc5", "Ada's nose twitches and she squeezes past the dense bushes. Thymio follows her and sees that the huge leaves on the trees hide a small lake from view.", "The water glistens in the sunlight. It is a nice and relaxing place to rest.", 2, 4)));
    storySections.push_back(std::make_shared<StoryComponent>(StoryComponent("sc6", "It is time to leave again. The pair head back into the forest.", "It takes them some time to find the path. After squeezing underneath a bush the path comes back into view.", 4, 2)));

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
        case 1 : locationDescription = "Thymio and Ada are at the place they first met.";
                 break;
        case 2 : locationDescription = "Thymio and Ada are in the forest.";
                 break;
        case 3 : locationDescription = "Thymio and Ada are at the river.";
                 break;
        case 4 : locationDescription = "Thymio and Ada are by the lakeside.";
                 break;
        case 5 : locationDescription = "Thymio and Ada are at the edge of the island.";
                 break;
    }
    sequence.push_back(locationDescription);


    //Find Matching story component
    //find all the components that fit, choose one at random
    std::vector<std::shared_ptr<StoryComponent> > matches;
    for(auto it = storySections.begin(); it != storySections.end(); it++) {
        if(!(*it).get()->preCondition || (*it).get()->preCondition == sLocation) {
            matches.push_back(*it);
        }
    }

    std::random_device rd;  //Will be used to obtain a seed for the random number engine
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
