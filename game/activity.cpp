#include "game/activity.h"

/*!
 * \class Activity
 *
 * The Activity class encapsulates an item in the exercise graph of the ZPDES algorithm.
 *
 * The following are default values:
 * \list
 * \li id: none
 * \li bandit level / learning rate: 0.5
 * \li activation threshold: 0
 * \li description: none
 * \endlist
 *
 * As of the implementation when this documentation was written, only the id and bandit level are relevant for the zpdes.
 *
 */

/*!
 \fn void Activity::Activity()

 Creates a default Activity with no id and learning rate 0.5
*/


/*!
 \fn void Activity::Activity(std::string id)

 Creates a default Activity with the given id and learning rate 0.5
*/

/*!
 \fn void Activity::Activity(std::string id, double at)

 Creates a default Activity with the given id and learning rate 0.5. the parameter \c at sets the activation threshold.
*/

/*!
 \fn void Activity::Activity(std::string id, double at, std::string desc)

 Creates a default Activity with the given id and learning rate 0.5. the parameter \c at sets the activation threshold. \c desc sets a description for the object. This is the constructor used in the \l Zpdes.
*/

/*!
 \fn void Activity::Activity(std::string id, double at, std::string desc, std::list<std::string> exs)

 Creates a default Activity with the given id and learning rate 0.5. the parameter \c at sets the activation threshold. \c desc sets a description for the object. \c exs specifies a list of exercises in this activity, however this can be omitted as it can be included in the id of the activity.
*/

/*!
    Updates the bandit level / learning rate of the activity based on the last d*2 activities (d = 5 as of this writing).
*/

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

/*!
  Sets a new description for the activity.
*/

void Activity::setDescription(std::string desc) {
    description = desc;
}

/*!
  Returns the average success of this activity based on the number of times it has been played and the scores.
*/

double Activity::getAverageSuccess() {
    return successRate.first / successRate.second;
}
