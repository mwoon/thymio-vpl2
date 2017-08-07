#include "activity.h"

void Activity::updateBanditLevel(double result)
{
    //if result is better than 0.5 activate it
    if(result >= 0.5) {
        activated = true;
    }

    //update success rate
    successRate.first += result;
    successRate.second++;

    //push new result to front of list of results
    prevResults.push_front(result);

    //calculate reward
    double curSuccess{0};
    double prevSuccess{0};
    auto it = prevResults.begin();

    unsigned i = 0;
    for(; it != prevResults.end() && i < d; i++) {
        curSuccess += *it;
        it++;
    }

    //fill up curSuccess with 0.5
    if(i < d) {
        curSuccess += 0.5 * (d-i);
    }

    i = 0;
    for(; it != prevResults.end() && i < d; i++) {
        prevSuccess += *it;
        it++;
    }

    //fill up prevSuccess with 0.5
    if(i < d) {
        prevSuccess += 0.5 * (d-i);
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

double Activity::getAverageSuccess() {
    return successRate.first / successRate.second;
}
