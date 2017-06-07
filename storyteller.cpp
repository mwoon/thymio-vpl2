#include "storyteller.h"

StoryTeller::StoryTeller(QObject *parent) : QObject(parent)
{
    initializeScript();
    mainIndex = 0;
}

void StoryTeller::initializeScript() {
    script.push_back(ScriptBlock("story", std::list<std::string>{"{\"cmd\": \"text\", \"text\": \"dummy\"}", "{\"cmd\": \"bg\", \"color\": \"#00B000\"}"}));
    /*script.push_back(ScriptBlock("story", std::list<std::string>{"\"story1\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E01", "E02"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story2\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E03", "E04", "E05"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story3\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E06", "E08", "E11", "E9", "E10"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story4\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E11", "E13", "E14", "E15"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story5\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E14", "E15", "E16", "E17", "E18", "E19", "E20", "E21", "E22", "E23"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story6\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E16", "E17", "E24", "E20", "E21", "E14", "E15", "E22", "E25", "E26", "E27"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story7\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E28", "E29", "E30", "E31", "E32", "E33", "E11", "E13", "E14", "E15"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story8\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E28", "E29", "E30", "E31", "E32", "E33", "E34", "E35"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story9\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E38", "E39", "E28", "E29", "E30", "E31", "E32", "E33", "E34", "E35", "E11", "E13", "E14", "E15"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story10\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E17", "E40", "E21", "E23", "E22"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story11\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E16", "E17", "E24", "E20", "E21", "E14", "E15", "E22", "E25", "E26", "E27", "E40"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story12\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E41", "E42", "E43", "E44", "E28", "E36"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story13\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E38", "E39", "E34", "E35", "E28", "E29", "E30", "E31", "E32", "E33"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story14\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E38", "E39", "E34", "E35"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story15\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E16", "E17", "E24", "E45", "E21", "E14", "E15", "E22", "E25", "E26", "E27", "E40", "E46", "E36", "E37", "E38", "E39", "E34", "E35"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story16\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E39", "E38", "E34", "E35", "E28", "E29", "E30", "E31", "E32", "E33"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story17\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E41", "E42", "E43", "E44", "E28", "E36", "E47"}));
    */script.push_back(ScriptBlock("story", std::list<std::string>{"\"story18\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E41", "E42", "E43", "E44", "E28", "E36"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story19\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E39", "E38", "E34", "E35", "E28", "E29", "E30", "E31", "E32", "E33"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story20\""}));

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
        if(successfulExercises > 0) {
            //FIXME for now just increment
            successfulExercises = 0;
            mainIndex++;
        }
    }
 }

 //no more story to show
 if(mainIndex >= script.size()) {
     emit segmentGenerated("{\"story0\":[\"the_end\"]}");
     return;
 }

 //check current segment type
 std::string next;
 if(script[mainIndex].type == "story") {
     qDebug() << QString::fromStdString("make story");

    //send next story back to front end
/*
    std::string file = "qrc:/thymio-vpl2/story/" + *(script[mainIndex].content.begin());
    qDebug() << QString::fromStdString(file);
    std::string content = readFromFile(file);
    next = makeJsonArray("story0", content); //property name is temporary
*/
    next = makeJsonArray("story0", script[mainIndex].content);

    qDebug() << QString::fromStdString(next);
    emit segmentGenerated(QString::fromStdString("{" + next + "}"));

 } else {
     qDebug() << QString::fromStdString("make exercise");
     //call zpdes to pick an exercise here
     std::string chosen = its.chooseActivity(script[mainIndex].content);
     next = makeJsonArray("activity", std::list<std::string>{chosen});
     emit segmentGenerated(QString::fromStdString("{" + next + "}"));
 }

}


void StoryTeller::completeExercise(const double result) {
    //update condition for progressing story after exercise
    //FIXME Need to tune this condition and see what is good
    //maybe also add a hard limit on the number of exercises?
    if(result > 0.5) {
        successfulExercises++;
    } else {
        successfulExercises = 0;
    }

    //call zpd to update graph
    its.updateZpd(result);
}

//----------------- Helper functions -----------------

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

std::string StoryTeller::makeJsonArray(std::string propertyName, std::string content) {
    std::ostringstream json;
    json << "\"" << propertyName << "\" : [";
    json << content;
    json << "] ";
    std::string jsonStr = json.str();



    return jsonStr;
}

//from: https://stackoverflow.com/a/525103
std::string StoryTeller::readFromFile(const std::string &fileName)
{
    std::ifstream ifs(fileName.c_str(), std::ios::in | std::ios::ate);
    if(!ifs.is_open())
    {
        qDebug() << QString::fromStdString("file not found");
    }
    //get file size https://stackoverflow.com/a/22986486
    ifs.ignore(std::numeric_limits<std::streamsize>::max());
    std::streamsize length = ifs.gcount();

    ifs.seekg(0, std::ios::beg);
    std::vector<char> bytes(length);

    ifs.read(&bytes[0], length);

    return std::string(&bytes[0], length);
}
