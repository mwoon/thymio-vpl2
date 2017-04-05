#ifndef ACTIVITY_H
#define ACTIVITY_H

#include <string>
#include <memory>

class Activity
{
public:
    //constants
    const double beta = 0.7;
    const double eta = 0.3;

    //constructors
    Activity(): banditLevel(0.5), activationThreshold(0){ }
    Activity(std::string id): id(id), banditLevel(0.5), activationThreshold(0){ }
    Activity(std::string id, double at): id(id), banditLevel(0.5), activationThreshold(at) { }
    Activity(std::string id, double at, std::string desc): id(id), banditLevel(0.5), activationThreshold(at), description(desc) { }
    Activity(std::string id, double at, std::string desc, std::shared_ptr<Activity> a): id(id), banditLevel(0.5), activationThreshold(at), description(desc), successor(a) { }


    std::string id;
    double banditLevel;
    double activationThreshold;
    std::string description;
    std::shared_ptr<Activity> successor; //for now only one successor allowed


    void updateBanditLevel(double reward);
    void setDescription(std::string desc);
    void setSuccessor(Activity a);

};

#endif // ACTIVITY_H
