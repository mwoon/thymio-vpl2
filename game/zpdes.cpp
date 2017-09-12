#include "game/zpdes.h"

/*!
 \class Zpdes

 The Zpdes class encompasses all functions of the ITS. It maintains the state of the activity graphs, chooses exercises and updates the bandit levels of activities.

 Activities are the elements the ITS manages while exercises are concrete tasks resulting from choosing the activities.

 The ITS maintains 3 activity graphs: One each for Type, Complexity and Category of the exercises.
*/

Zpdes::Zpdes(QObject *parent) : QObject(parent)
{
    //initialize all activities
    initializeActivities();
}

/*!
 Initializes the activity graphs for the three dimensions category, type and complexity.
*/

void Zpdes::initializeActivities() {

    //minor activities AKA type of activity
    minorActivities.push_back(std::make_shared<Activity>(Activity("01", 0.8, "Given program, predict function")));
    minorActivities.push_back(std::make_shared<Activity>(Activity("02", 0.8, "Given behaviour, choose program")));
    minorActivities.push_back(std::make_shared<Activity>(Activity("03", 0.8, "Given two behaviours, decide what is the difference")));
    minorActivities.push_back(std::make_shared<Activity>(Activity("04", 0.8, "Given a specification, complete a partial program")));
    minorActivities.push_back(std::make_shared<Activity>(Activity("05", 0.8, "Given specification, write a program")));

    //complexity of activity
    complexityActivities.push_back(std::make_shared<Activity>(Activity("E01E02E03E04E05E06E08E11E13E26E32E34E35E31E28E16E20E17E45E18E41E42", 0.8, "easy exercises")));
    complexityActivities.push_back(std::make_shared<Activity>(Activity("E09E14E27E29E30E19E44E24E43", 0.8, "medium exercises")));
    complexityActivities.push_back(std::make_shared<Activity>(Activity("E10E15E25E33E22E46E21E40E47E23", 0.8, "hard exercises")));


    //category of activity
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E01E02E03", 0.8, "tutorial")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E04E05", 0.8, "tutorial-esque")));

    categoryActivities.push_back(std::make_shared<Activity>(Activity("E06E08", 0.8, "buttons and colors")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E11E09E10E13E14E15", 0.8, "sensors and colors")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E26E32E34E35E31E27E25E33", 0.8, "tap/clap and ")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E28E29E30", 0.8, "sound")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E36E37E39E38", 0.8, "accelerometer")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity("E16E20E17E45E18E41E42E19E44E24E43E22E46E21E40E47E23", 0.8, "motor")));
    qDebug() << QString::fromStdString("finished initialization");
}

/*!
  Chooses an exercise based on the available exercises at the current point in the story. \c is a list of available exercises
*/

std::string Zpdes::chooseActivity(std::list<std::string> availables) {

    //make sure there are exercises in the bins before choosing bins
    //prevent choosing a complexity if there are no exercises in there
    std::vector<int> complexityBinCount(3, 0);
    for(auto it = availables.begin(); it != availables.end(); it++) {
        unsigned index{0};
        for(auto it2 = complexityActivities.begin(); it2 != complexityActivities.end(); it2++) {
            if(it2->get()->id.find(*it) != std::string::npos) {
                complexityBinCount[index]++;
            }
            index++;
        }
    }

    //pick a complexity
    std::list<std::shared_ptr<Activity>> complexityZPD;
    unsigned index{0};
    auto prev = complexityActivities.begin();
    for(auto it = complexityActivities.begin(); it != complexityActivities.end(); it++) {
        if((complexityBinCount[index] > 0) && (it == complexityActivities.begin() || prev->get()->activated)) {
            complexityZPD.push_back(*it);
        }
        index++;
    }
    unsigned complexityIndex = activityFromZpd(complexityZPD);
    //qDebug() << QString::fromStdString("complexity chosen");

    //--------------------------------------------------------------------------------------

    //add only activities in chosen complexity to ZPD

    std::list<std::shared_ptr<Activity>> categoryZPD;

    qDebug() << "size: " << complexityZPD.size() << ", index: " << complexityIndex;
    auto complexity_it = complexityZPD.begin();
    std::advance(complexity_it, complexityIndex);
    lastActivityComplexity = *complexity_it;

    for(auto it = availables.begin(); it != availables.end();) {
        //check if activity is in right complexity
        if(complexity_it->get()->id.find(*it) != std::string::npos) {
            for(auto it2 = complexityActivities.begin(); it2 != complexityActivities.end(); it2++){
                if(it2->get()->id.find(*it) != std::string::npos) {
                    categoryZPD.push_back(*it2);
                    qDebug() << QString::fromStdString("category added");
                }
            }
            it++;
        } else {
            //don't need this value anymore, it would get in the way
            availables.erase(it++);
        }
    }

    unsigned categoryIndex = activityFromZpd(categoryZPD);



    //qDebug() << QString::fromStdString("category chosen");

    //---------------------------------------------------------------

    //minor
    std::list<std::shared_ptr<Activity>> minorZpd;

    prev = minorActivities.begin();
    for(auto it = minorActivities.begin(); it != minorActivities.end(); it++) {
        if(it == minorActivities.begin() || prev->get()->activated) {
            minorZpd.push_back(*it);
            qDebug() << QString::fromStdString((*it).get()->id) << " ";
        } else {
            break;
        }
        prev = it;
    }

    unsigned minorIndex = activityFromZpd(minorZpd);

    //---------------------------------------------------------------

    std::string description;

    //qDebug() << "size: " << categoryZPD.size() << ", index: " << categoryIndex;
    //if(categoryZPD.size() > categoryIndex) { //safeguard
        auto zpd_it = categoryZPD.begin();
        auto minor_it = minorZpd.begin();

        std::advance(zpd_it, categoryIndex);
        std::advance(minor_it, minorIndex);

        lastActivity = *zpd_it;
        lastActivityMinor = *minor_it;

        auto avail_it = availables.begin();
        std::advance(avail_it, categoryIndex);
        lastActivitySpecific  = *avail_it;


        //contains exercise in the form of "EXX.XX"
        description = "\"" + *avail_it + "." + lastActivityMinor.get()->id + "\"";
        //qDebug() << QString::fromStdString("generated exercise: ")<< QString::fromStdString(description);
    //}


    return description;
}

/*!
  Updates the bandit levels / learning rates for the three activity graphs and updates the zpd.
 */
std::string Zpdes::updateZpd(const double result){

    //Ask activity to update its bandit level of major and minor
    //major
    lastActivity.get()->updateBanditLevel(result);

    //minor
    lastActivityMinor.get()->updateBanditLevel(result);

    //complexity
    lastActivityComplexity.get()->updateBanditLevel(result);

    std::stringstream logText;
    logText << lastActivitySpecific << "." << lastActivityMinor.get()->id << ", ";
    logText << "result: " << result << ", ";
    logText << "category: " << lastActivity.get()->banditLevel << ", " << lastActivity.get()->getAverageSuccess() << ", ";
    logText << "type: " << lastActivityMinor.get()->banditLevel <<  ", " << lastActivityMinor.get()->getAverageSuccess() << ", ";
    logText << "complexity: " << lastActivityComplexity.get()->banditLevel << ", " << lastActivityComplexity.get()->getAverageSuccess();
    return logText.str();
}

/*!
    Resets the Zpdes algorithm, deleting bandit levels / learning rates and resetting the activity graphs.
*/

void Zpdes::resetZpdes() {
    //clear all acitivities and reinitialize
    minorActivities.clear();
    categoryActivities.clear();
    complexityActivities.clear();
    initializeActivities();
}

/*!
    Given a ZPD, i.e. a list of exercises that can be chosen, select one randomly based on the learning rates of each activity.
*/
unsigned Zpdes::activityFromZpd(std::list<std::shared_ptr<Activity> > &zpd) {

    double totalBanditLevel{0};
    for(auto it = zpd.begin(); it != zpd.end(); it++) {
        totalBanditLevel += it->get()->banditLevel;
    }

    //for each activity in the zpd calculate the probability
    std::vector<double> probs(zpd.size());
    int numActivity{0};
    for(auto it = zpd.begin(); it != zpd.end(); it++) {
        double wa = it->get()->banditLevel;
        probs[numActivity] = wa * (1 - gamma) + gamma * totalBanditLevel / zpd.size(); //transformation of the original equation by * totalBanditLevel
        numActivity++;
    }

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());

    unsigned index = d(gen);

    return index;
}

/*!
  Sets the values for the last activity.

  Only for setting last activity for tutorials since these are not selected directly through the algorithm.
*/
void Zpdes::setLastActivity(std::string name) {

    for(auto it = minorActivities.begin(); it != minorActivities.end(); it++) {
        if((*it).get()->id.find("04") != std::string::npos) {
            lastActivityMinor = *it;
        }

    }

    for(auto it = complexityActivities.begin(); it != complexityActivities.end(); it++) {
        if((*it).get()->id.find(name) != std::string::npos) {
            lastActivityComplexity = *it;
        }

    }

    for(auto it = categoryActivities.begin(); it != categoryActivities.end(); it++) {
        if((*it).get()->id.find(name) != std::string::npos) {
            lastActivity = *it;
        }

    }
    lastActivitySpecific = name;
    return;
}

std::string Zpdes::getJsonStory(std::list<std::string> beforeAc, std::list<std::string> afterAc, std::string activityDesc) {
    std::ostringstream json;
    json << "{ ";
    json << "\"story0\" : [";
    for(auto it = beforeAc.begin(); it != beforeAc.end(); it++) {
        if(it != beforeAc.begin()) {
            json << ", ";
        }
        json << "\""<< *it << "\"";
    }
    json << "], ";

    json << "\"story1\" : [";
    for(auto it = afterAc.begin(); it != afterAc.end(); it++) {
        if(it != afterAc.begin()) {
            json << ", ";
        }
        json << "\""<< *it << "\"";
    }
    json << "], ";

    json << "\"activity\": \"" << activityDesc << "\"";
    json << " }";
    std::string jsonStr = json.str();

    //qDebug() << QString::fromStdString(jsonStr);
    return jsonStr;
}

/*!
   \fn void Zpdes::activityGenerated(const QString& newText)

   Notifies listeners that an activity has been chosen.

   No longer used as all frontend communication proceeds through \l StoryTeller.
*/

/*!
  \fn void Zpdes::rewarded(const QString& newText)

  Notifies listeners that the update of the learning rates and ZPD has been completed.

  No longer used as all frontend communication proceeds through \l StoryTeller.
*/
