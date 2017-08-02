#include "zpdes.h"
Zpdes::Zpdes(QObject *parent) : QObject(parent)
{
    //initialize all activities
    initializeActivities();
}

/*
void Zpdes::initializeActivities() {
    //TODO (later): search database for activities, for now just an example exploration graph

    //////////////////// example graph for testing ////////////////////
    //for each activity make an activity object
    std::shared_ptr<Activity> a = std::make_shared<Activity>(Activity("C2", 0.9, "C2"));
    Activity b("C1", 0.7, "C1", std::make_shared<Activity>(*(a.get())));

    exGraph.addActivity(*(a.get()));
    exGraph.addActivity(b);

    a = std::make_shared<Activity>(Activity("A1", 0.9, "A1"));
    exGraph.addActivity(*(a.get()));

    a = std::make_shared<Activity>(Activity("B1", 0.9, "B1"));
    exGraph.addActivity(*(a.get()));

    a = std::make_shared<Activity>(Activity("D1", 0.9, "D1"));
    exGraph.addActivity(*(a.get()));

    ///////////////////////////////////////////////////////////////////

    exGraph.initializeZPD();

    std::ostringstream strs;
    strs << "ZPD contains: ";
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        strs << (*it).get()->id;
        strs << ", ";
    }
    qDebug() << (QString::fromStdString(strs.str()));
}

void Zpdes::generateActivity()
{
    //calculate total bandit level
    double totalBanditLevel{0};
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        totalBanditLevel += (*it).get()->banditLevel;
    }

    //for each activity in the zpd calculate the probability
    std::vector<double> probs(exGraph.zpd.size());
    int numActivity{0};
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        double wa = (*it).get()->banditLevel;
        probs[numActivity] = wa * (1 - gamma) + gamma * totalBanditLevel / exGraph.zpd.size();
        numActivity++;
    }

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());
    std::string description;
    double banditLevel;
    unsigned index = d(gen);
    if(exGraph.zpd.size() > index) {
        auto it = exGraph.zpd.begin();
        std::advance(it, index);
        description = (*it).get()->description;
        banditLevel = (*it).get()->banditLevel;
        lastActivityId = (*it).get()->id;
    }

    std::ostringstream strs;
    strs << banditLevel;
    std::string str = strs.str();

    std::shared_ptr<std::pair<std::list<std::string>, std::list<std::string> > > story = storyGen.generateStory(lastActivityId);

    std::string jsonStory = getJsonStory(story.get()->first, story.get()->second, std::to_string(++numExercises) + ". "+ description);

    //emit activityGenerated(QString::fromStdString(description + ", bandit level: " + str));
    emit activityGenerated(QString::fromStdString(jsonStory));
}
*/

///////////////////////////////
//Section with new structure

void Zpdes::initializeActivities() {
    //block 1
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E01E02E03", 0.0, "\"dummy1\"")),
                             std::make_shared<Activity>(Activity("E01", 0.5, "\"E01\"", std::list<std::string>{"E01"})),
                             std::make_shared<Activity>(Activity("E02", 0.5, "\"E02\"", std::list<std::string>{"E02"})),
                             std::make_shared<Activity>(Activity("E03", 0.5, "\"E03\"", std::list<std::string>{"E03"}))
                         });

    //block 2
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E04E05", 0.0, "\"dummy2\"")),
                             std::make_shared<Activity>(Activity("E04", 0.5, "\"E04\"", std::list<std::string>{"E04"})),
                             std::make_shared<Activity>(Activity("E05", 0.5, "\"E05\"", std::list<std::string>{"E05"}))
                         });

    //block 3
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E06E08", 0.0, "\"dummy3\"")),
                             std::make_shared<Activity>(Activity("E06", 0.5, "\"E06\"", std::list<std::string>{"E06"})),
                             std::make_shared<Activity>(Activity("E08", 0.5, "\"E08\"", std::list<std::string>{"E08"}))
                         });
    //block 4
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E11E09E10", 0.0, "\"dummy4\"")),
                             std::make_shared<Activity>(Activity("E11", 0.5, "\"E11\"", std::list<std::string>{"E11"})),
                             std::make_shared<Activity>(Activity("E09", 0.5, "\"E09\"", std::list<std::string>{"E09"})),
                             std::make_shared<Activity>(Activity("E10", 0.5, "\"E10\"", std::list<std::string>{"E10"}))
                         });
    //block 5
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E13E14E15", 0.0, "\"dummy5\"")),
                             std::make_shared<Activity>(Activity("E13", 0.5, "\"E13\"", std::list<std::string>{"E13"})),
                             std::make_shared<Activity>(Activity("E14", 0.5, "\"E14\"", std::list<std::string>{"E14"})),
                             std::make_shared<Activity>(Activity("E15", 0.5, "\"E15\"", std::list<std::string>{"E15"}))
                         });

    //block 6
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E26E32E34E35E31E27E25E33", 0.0, "\"dummy6\"")),
                             std::make_shared<Activity>(Activity("E26E32E34E35E31", 0.5, "\"E26 E32 E34 E35 E31\"", std::list<std::string>{"E26", "E32", "E34", "E35", "E31"})),
                             std::make_shared<Activity>(Activity("E27", 0.5, "\"E27\"", std::list<std::string>{"E27"})),
                             std::make_shared<Activity>(Activity("E25E33", 0.5, "\"E25 E33\"", std::list<std::string>{"E25", "E33"}))
                         });
    //block 7
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E28E29E30", 0.0, "\"dummy7\"")),
                             std::make_shared<Activity>(Activity("E28", 0.5, "\"E28\"", std::list<std::string>{"E28"})),
                             std::make_shared<Activity>(Activity("E29E30", 0.5, "\"E29 E30\"", std::list<std::string>{"E29", "E30"}))
                         });
    //block 8
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E36E37E39E38", 0.0, "\"dummy8\"")),
                             std::make_shared<Activity>(Activity("E36E37E39", 0.5, "\"E36 E37 E39\"", std::list<std::string>{"E36", "E37", "E39"})),
                             std::make_shared<Activity>(Activity("E38", 0.5, "\"E38\"", std::list<std::string>{"E38"}))
                         });
    //block 9
    majorActivities.push_back(std::list<std::shared_ptr<Activity>>{
                             std::make_shared<Activity>(Activity("E16E20E17E45E18E41E42E19E44E24E43E22E46E21E40E47E23", 0.0, "\"dummy9\"")),
                             std::make_shared<Activity>(Activity("E16", 0.5, "\"E16\"", std::list<std::string>{"E16"})),
                             std::make_shared<Activity>(Activity("E20E17E45", 0.5, "\"E20 E17 E45\"", std::list<std::string>{"E20", "E17", "E45"})),
                             std::make_shared<Activity>(Activity("E18E41E42", 0.5, "\"E18 E41 E42\"", std::list<std::string>{"E18", "E41", "E42"})),
                             std::make_shared<Activity>(Activity("E19E44", 0.5, "\"E19 E44\"", std::list<std::string>{"E19", "E44"})),
                             std::make_shared<Activity>(Activity("E24E43", 0.5, "\"E24 E43\"", std::list<std::string>{"E24", "E43"})),
                             std::make_shared<Activity>(Activity("E22E46", 0.5, "\"E22 E46\"", std::list<std::string>{"E22", "E46"})),
                             std::make_shared<Activity>(Activity("E21E40E47", 0.5, "\"E21 E40 E47\"", std::list<std::string>{"E21", "E40", "E47"})),
                             std::make_shared<Activity>(Activity("E23", 0.5, "\"E23\"", std::list<std::string>{"E23"}))
                         });

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
    categoryActivities.push_back(std::make_shared<Activity>(Activity(("E36E37E39E38", 0.8, "accelerometer")));
    categoryActivities.push_back(std::make_shared<Activity>(Activity(("E16E20E17E45E18E41E42E19E44E24E43E22E46E21E40E47E23", 0.8, "motor")));
}

std::string Zpdes::chooseActivity(std::list<std::string> availables) {
    /*
    //major
    std::list<std::shared_ptr<Activity>> zpd;

    //look for availables in activities list
    for(auto it = availables.begin(); it != availables.end(); it++) {
        for(auto it2 = majorActivities.begin(); it2 != majorActivities.end(); it2++) {
            if((it2->front()).get()->id.find(*it) != std::string::npos) {
                auto prev = it2->begin();
                for(auto it3 = ++(it2->begin()); it3 != it2->end(); it3++) {
                    if((*it3).get()->id.find(*it) != std::string::npos) {
                        //add available activities to current zpd
                        //TODO add activity only if previous was activated before
                        if((prev == it2->begin()) || (*prev).get()->activated) {
                            qDebug() << QString::fromStdString((*it3).get()->id) << " " << QString::fromStdString(*it);
                            zpd.push_back(*it3);
                        }
                    }
                    prev = it3;
                }
            }
        }
    }
    qDebug() << " ";

    unsigned majorIndex = activityFromZpd(zpd);
    */

    std::list<std::shared_ptr<Activity>> categoryZPD;

    std::vector<int> complexityBinCount(3, 0);
    for(auto it = availables.begin(); it != availables.end(); it++) {
        for(auto it2 = categoryActivities.begin(); it2 != categoryActivities.end(); it2++) {
            if(it2->get()->id.find(*it) != std::string::npos) {

            }
        }
    }


    //minor
    std::list<std::shared_ptr<Activity>> minorZpd;

    auto prev = minorActivities.begin();
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

    std::string description;


    if(zpd.size() > majorIndex) { //safeguard
        auto zpd_it = zpd.begin();
        auto minor_it = minorZpd.begin();

        std::advance(zpd_it, majorIndex);
        std::advance(minor_it, minorIndex);

        lastActivity = *zpd_it;
        lastActivityMinor = *minor_it;

        auto avail_it = availables.begin();
        std::advance(avail_it, majorIndex);
        lastActivitySpecific  = *avail_it;


        //contains exercise in the form of "EXX.XX"
        description = "\"" + *avail_it + "." + lastActivityMinor.get()->id + "\"";
    }


    return description;
}

std::string Zpdes::updateZpd(const double result){


    //find the index of the specific activity
    unsigned index{0};
    for(auto it = lastActivity.get()->exercises.begin(); it != lastActivity.get()->exercises.end(); it++) {
        if(*it == lastActivitySpecific) {
            break;
        }
        index++;
    }

    //Ask activity to update its bandit level of major and minor
    //major
    lastActivity.get()->updateBanditLevel(result);

    //minor
    lastActivityMinor.get()->updateBanditLevel(result);

    //complexity
    lastActivityComplexity.get()->updateBanditLevel(result);

    std::stringstream logText;
    logText << lastActivitySpecific << "." << lastActivityMinor.get()->id << ", " << result << ", " << lastActivity.get()->banditLevel << ", " << lastActivityMinor.get()->banditLevel;
    return logText.str();
}


void Zpdes::resetZpdes() {
    //clear all acitivities and reinitialize
    majorActivities.clear();
    minorActivities.clear();
    complexityActivities.clear();
    initializeActivities();
}

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

//only for setting last activity for tutorials
void Zpdes::setLastActivity(std::string name) {
    for(auto it = majorActivities.begin(); it != majorActivities.end(); it++) {
        if((it->front()).get()->id.find(name) != std::string::npos) {

            for(auto it2 = ++(it->begin()); it2 != it->end(); it2++) {
                if((*it2).get()->id.find(name) != std::string::npos) {

                    lastActivity =  *it2;
                    lastActivitySpecific = (*it2).get()->id;
                }
            }

        }
    }

    for(auto it = minorActivities.begin(); it != minorActivities.end(); it++) {
        if((*it).get()->id.find("04") != std::string::npos) {
            lastActivityMinor = *it;
        }

    }
    return;
}



///////////////////////////////







/*void Zpdes::updateZpd(const double result){
    //update banditlevel of activity

    //keep record of last few activities
    if(d * 2 <= mostRecentActivities.size()) {
        mostRecentActivities.pop_back();
    }
    mostRecentActivities.push_front(std::make_pair(lastActivityId, result));

    //calculate reward
    //current success

    double curSuccess{0};
    double prevSuccess{0};
    auto it = mostRecentActivities.begin();
    //current success
    for(unsigned counter{0}; it != mostRecentActivities.end() && counter < d; counter++) {
        curSuccess += (*it).second;
        it++;
    }

    //previous success
    for(; it != mostRecentActivities.end(); it++) {
        prevSuccess += (*it).second;
    }

    //reward used to update ZPD
    double reward = (curSuccess - prevSuccess) / d;

    //debug printing
    std::ostringstream strs;
    strs << reward;
    std::string str = strs.str();
    emit rewarded(QString::fromStdString(std::to_string(numExercises) + ". reward: " + str));

    //update bandit level
    auto last = exGraph.getActivityFromId(lastActivityId);
    last.get()->banditLevel = last.get()->beta * last.get()->banditLevel + last.get()->eta * reward;


    //TODO update ZPD
    exGraph.updateZPD(lastActivityId, result);

    //debug printing
    strs.clear();
    strs.str("");
    strs << "ZPD contains: ";
    for(auto it = exGraph.zpd.begin(); it != exGraph.zpd.end(); it++) {
        strs << (*it).get()->id << ", ";
    }
    emit rewarded(QString::fromStdString(strs.str()));
    generateActivity();
}*/

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
