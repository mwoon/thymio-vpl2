#include "activity.h"

void Activity::updateBanditLevel(double result)
{
    //push new result to front of list of results
    prevResults.push_front(result);

    //calculate reward
    double curSuccess{0};
    double prevSuccess{0};
    auto it = prevResults.begin();

    for(unsigned i = 0; it != prevResults.end() && i < d; i++) {
        curSuccess += *it;
        it++;
    }

    for(unsigned i = 0; it != prevResults.end() && i < d; i++) {
        prevSuccess += *it;
        it++;
    }

    double reward = (curSuccess - prevSuccess) / d;

    banditLevel = beta * banditLevel + eta * reward;
}

void Activity::setDescription(std::string desc) {
    description = desc;
}

/*void Activity::setSuccessor(Activity a) {
    successor.reset();
    successor = std::make_shared<Activity>(a);
}*/
