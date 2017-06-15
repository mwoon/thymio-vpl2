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
    Activity(std::string id, double at, std::string desc, std::list<std::string> exs): id(id), banditLevel(0.5), activationThreshold(at), description(desc), exercises(exs){
        unsigned numEx = exs.size();
        for(unsigned i = 0; i < numEx; i++) {
            prevResults.push_back(std::list<double>{});
            bLevels.push_back(banditLevel);
        }

    }
    //Activity(std::string id, double at, std::string desc, std::shared_ptr<Activity> a): id(id), banditLevel(0.5), activationThreshold(at), description(desc), successor(a) { }


    std::string id;
    double banditLevel;
    double activationThreshold;
    std::string description;
    //std::shared_ptr<Activity> successor; //for now only one successor allowed
    std::pair<double, unsigned> successRate = std::make_pair<double, unsigned>(0,0); //total success and over how many activities
    bool activated = false;

    void updateBanditLevel(double reward);
    void setDescription(std::string desc);
    //void setSuccessor(Activity a);


    //store all previous results from using this activity for each difficulty
    std::vector<std::list<double> > prevResults;

    //contains the name of each exercise (to find the file)
    std::list<std::string> exercises;

    //Learning rate for 6 difficulties
    std::vector<double> bLevels;

    //TODO function to update bandit level using result, major and minor
    //has to also append to prevResults list

};

#endif // ACTIVITY_H
