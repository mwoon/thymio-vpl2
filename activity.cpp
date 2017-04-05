#include "activity.h"

void Activity::updateBanditLevel(double reward)
{
    banditLevel = beta * banditLevel + eta * reward;
}

void Activity::setDescription(std::string desc) {
    description = desc;
}

void Activity::setSuccessor(Activity a) {
    successor.reset();
    successor = std::make_shared<Activity>(a);
}
