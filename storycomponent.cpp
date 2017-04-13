#include "storycomponent.h"

StoryComponent::StoryComponent() { }

Location StoryComponent::getPrec()
{
    return preCondition;
}

Location StoryComponent::getPostc()
{
    return postCondition;
}

StoryType StoryComponent::getType()
{
    return storyType;
}


std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > StoryComponent::getStory()
{
    return description;
}
