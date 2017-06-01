#ifndef ACTIVITY_H
#define ACTIVITY_H

#include <string>
#include <memory>
#include <list>
#include <vector>
#include <string>

class Activity
{
public:
    //constants
    const double beta = 0.3;
    const double eta = 0.7;

    //constructors
    Activity(): banditLevel(0.5), activationThreshold(0){ }
    Activity(std::string id): id(id), banditLevel(0.5), activationThreshold(0){ }
    Activity(std::string id, double at): id(id), banditLevel(0.5), activationThreshold(at) { }
    Activity(std::string id, double at, std::string desc): id(id), banditLevel(0.5), activationThreshold(at), description(desc) { }
    //Activity(std::string id, double at, std::string desc, std::shared_ptr<Activity> a): id(id), banditLevel(0.5), activationThreshold(at), description(desc), successor(a) { }


    std::string id;
    double banditLevel;
    double activationThreshold;
    std::string description;
    //std::shared_ptr<Activity> successor; //for now only one successor allowed
    std::pair<double, unsigned> successRate = std::make_pair<double, unsigned>(0,0); //total success and over how many activities


    void updateBanditLevel(double reward);
    void setDescription(std::string desc);
    //void setSuccessor(Activity a);


    //store all previous results from using this activity for each difficulty
    std::vector<std::list<double> > prevResults;

    //list of exercise scripts contained within this activity (what images loaded, what blocks needed etc.)
    //including all the different sub activities with the 6 difficulties
    std::list<std::vector<std::string> > exercises;

    //Learning rate for 6 difficulties
    std::vector<double> bLevels;

    //TODO function to update bandit level using result, major and minor
    //has to also append to prevResults list

};

#endif // ACTIVITY_H
