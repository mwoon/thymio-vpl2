#include "storyteller.h"

StoryTeller::StoryTeller(QObject *parent) : QObject(parent)
{
    initializeScript();
    mainIndex = 0;
}

void StoryTeller::initializeScript() {
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"dummy\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"1\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"\"1\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"2\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"3\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"\"1\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"4\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"5\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"\"1\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"6\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"7\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"8\""}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"9\""}));


}

void StoryTeller::advanceScript(){

 //check previous segment type
 if(mainIndex < script.size()) {
    if(script[mainIndex].type == "story") {
        qDebug() << QString::fromStdString("story: next");
        //previous was a story -> continue story
        mainIndex++;

    } else {
        qDebug() << QString::fromStdString("story: stay");
        //previous was an exercise block
        //check if number of successfully completed exercises sufficient
        // TODO if yes, advance story: increment mainIndex and dish out new story,
        // if no, draw another exercise

        //FIXME for now just increment
        mainIndex++;
    }
 }

 //no more story to show
 if(mainIndex >= script.size()) {
     emit segmentGenerated("{\"story0\":[\"the end\"]}");
     return;
 }

 //check current segment type
 if(script[mainIndex].type == "story") {
     qDebug() << QString::fromStdString("make story");

    //send next story back to front end
    std::string next = makeJsonArray("story0", script[mainIndex].content); //property name is temporary
    qDebug() << QString::fromStdString(next);
    emit segmentGenerated(QString::fromStdString("{" + next + "}"));

 } else {
     qDebug() << QString::fromStdString("make exercise");
     emit segmentGenerated("{\"story0\":[\"an exercise\"]}");
 }

}


//turns the string into an array of strings that can be added to a json
//content has to be a list of json objects
std::string StoryTeller::makeJsonArray(std::string propertyName, std::list<std::string> content) {
    std::ostringstream json;
    json << "\"" << propertyName << "\" : [";
    for(auto it = content.begin(); it != content.end(); it++) {
        if(it != content.begin()) {
            json << ", ";
        }
        json << *it ;
    }
    json << "] ";
    std::string jsonStr = json.str();



    return jsonStr;
}
