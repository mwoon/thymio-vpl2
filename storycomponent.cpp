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

std::string StoryComponent::getPart1()
{
    return description.first;
}

std::string StoryComponent::getPart2()
{
    return description.second;
}
