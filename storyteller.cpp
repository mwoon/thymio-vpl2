#include "storyteller.h"

StoryTeller::StoryTeller(QObject *parent) : QObject(parent)
{
    initializeScript();
    mainIndex = 10;
    successfulExercises = 3;
    totalExInBlock = 0;
}

void StoryTeller::initializeScript() {
    script.push_back(ScriptBlock("story", std::list<std::string>{"{\"cmd\": \"text\", \"text\": \"dummy\"}", "{\"cmd\": \"bg\", \"color\": \"#00B000\"}"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story1\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E01"}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E02"}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E03"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story2\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E04"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story2_1\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E05"}));
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
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story18\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E41", "E42", "E43", "E44", "E28", "E36"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story19\""}));
    script.push_back(ScriptBlock("exercise", std::list<std::string>{"E36", "E37", "E39", "E38", "E34", "E35", "E28", "E29", "E30", "E31", "E32", "E33"}));
    script.push_back(ScriptBlock("story", std::list<std::string>{"\"story20\""}));

}

QString StoryTeller::advanceScript(){

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
        if((successfulExercises > succExLimit - 1) || (totalExInBlock > totalExLimit - 1) || (mainIndex < 9)) {
            //FIXME for now just increment
            successfulExercises = 0;
            totalExInBlock = 0;
            mainIndex++;
        }
    }
 }

 //no more story to show
 if(mainIndex >= script.size()) {
     last = QString::fromStdString("{\"story0\":[\"the_end\"]}");
     log.push_back("\"the_end\"");
     emit segmentGenerated(last);
     return last;
 }

 //check current segment type
 std::string next;
 if(script[mainIndex].type == "story") {
     qDebug() << QString::fromStdString("make story");

    //send next story back to front end
    next = makeJsonArray("story0", script[mainIndex].content);

    //Some tracking
    log.push_back(next);
    last = QString::fromStdString("{" + next + "}");
    emit segmentGenerated(last);

 } else {
     qDebug() << QString::fromStdString("make exercise");
     //call zpdes to pick an exercise here
     std::string chosen;

     //special handling for first few exercises / "tutorials"
     if(mainIndex < 5) {
        std::ostringstream chosenBuilder;
        chosenBuilder << "\"";
        chosenBuilder << script[mainIndex].content.front();
        chosenBuilder << ".01\"";
        chosen = chosenBuilder.str();
        its.setLastActivity(script[mainIndex].content.front());

     } else {
         chosen = its.chooseActivity(script[mainIndex].content);
     }
     next = makeJsonArray("activity", std::list<std::string>{chosen});

     //Tracking
     last = QString::fromStdString("{" + next + "}");
     //log.push_back(chosen);

     emit segmentGenerated(last);
 }

 return last;
}


void StoryTeller::completeExercise(const double result) {
    std::ostringstream score;
    score << "result " << result << ", ex: ";
    qDebug() << QString::fromStdString(score.str()) << last;
    //update condition for progressing story after exercise
    //FIXME Need to tune this condition and see what is good
    //maybe also add a hard limit on the number of exercises?
    totalExInBlock++;

    if(result >= 0.5) {
        successfulExercises++;
    } else {
        successfulExercises = 0;
    }

    //call zpd to update graph
    std::string toLog = its.updateZpd(result);

    log.push_back(toLog);
}


void StoryTeller::resetScript() {
    mainIndex = 0;
    its.resetZpdes();

    //reset simulation
    type1Rate = 0;
    type2Rate = 0;
    type3Rate = 0;
    type4Rate = 0;
    type5Rate = 0;


    std::ostringstream filename;
    filename << "autoLogOnReset" << logcounter++;
    writeLogToFile(QString::fromStdString(filename.str()));
}


QString StoryTeller::lastGenerated() {
    return last;
}

void StoryTeller::appendToLog(QString toLog) {
    std::string logString;
    logString = toLog.toStdString();
    log.push_back(logString);
}

//---------------- Simulation functions -------------------


//student passes an exercise with 30%
void StoryTeller::simulateWithFailPercent(const double percent) {

    std::vector<double> probs(2);
    probs[0] = percent;
    probs[1] = 1 - percent;

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());

    unsigned index = d(gen);

    completeExercise(index);
}

//fixed success by type of exercise, probabilities provided are the probabilities to fail exercises of that type
void StoryTeller::simulateFixedSuccessByTypeOfExercise(const double prob1, const double prob2, const double prob3, const double prob4, const double prob5) {

    double percent{0};

    std::string lastString = last.toStdString();

    if (lastString.find(".01") != std::string::npos) {
        percent = prob1;
    } else if (lastString.find(".02") != std::string::npos) {
        percent = prob2;
    } else if (lastString.find(".03") != std::string::npos) {
        percent = prob3;
    } else if (lastString.find(".04") != std::string::npos) {
        percent = prob4;
    } else if (lastString.find(".05") != std::string::npos) {
        percent = prob5;
    }


    std::vector<double> probs(2);
    probs[0] = percent;
    probs[1] = 1 - percent;

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());

    unsigned index = d(gen);

    completeExercise(index);
}


void StoryTeller::simulateIncreasePerTrial() {
    double percent{0};

    std::string lastString = last.toStdString();

    if (lastString.find(".01") != std::string::npos) {
        percent = type1Rate;
    } else if (lastString.find(".02") != std::string::npos) {
        percent = type2Rate;
    } else if (lastString.find(".03") != std::string::npos) {
        percent = type3Rate;
    } else if (lastString.find(".04") != std::string::npos) {
        percent = type4Rate;
    } else if (lastString.find(".05") != std::string::npos) {
        percent = type5Rate;
    }

    qDebug() << QString::fromStdString("percent: ") << percent;

    std::vector<double> probs(2);
    probs[0] = 1 - percent;
    probs[1] = percent;

    // sample a proportional to probs
    std::random_device rd;
    std::mt19937 gen(rd());
    std::discrete_distribution<unsigned> d(probs.begin(), probs.end());

    unsigned index = d(gen);

    double learning = index ? 0.1 : 0.05;

    if (lastString.find(".01") != std::string::npos) {
        type1Rate += learning;
    } else if (lastString.find(".02") != std::string::npos) {
        type2Rate += learning;
    } else if (lastString.find(".03") != std::string::npos) {
        type3Rate += learning;
    } else if (lastString.find(".04") != std::string::npos) {
        type4Rate += learning;
    } else if (lastString.find(".05") != std::string::npos) {
        type5Rate += learning;
    }

    completeExercise(index);
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
//Should not be needed anymore
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

//tutorial for file io with qt: http://expletive-deleted.com/2015/02/26/file-io-in-qt5/
void StoryTeller::writeLogToFile(QString fileName) {
    QDir dir(QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation));
    dir.mkdir(QString::fromStdString("simulations"));


    QFile output(QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + QDir::separator() + QString::fromStdString("simulations") + QDir::separator() + fileName + QString::fromStdString( ".txt"));

    qDebug() << "file written to: " << QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) << QDir::separator() << QString::fromStdString("simulations") << QDir::separator() << fileName << QString::fromStdString( ".txt");

    if(output.open(QIODevice::WriteOnly)){
        QTextStream stream(&output);

        while(!log.empty()) {
            stream << QString::fromStdString(log.front()) << endl;
            log.pop_front();
        }
        output.close();
    } else {
        qDebug() << QString::fromStdString("Could not write to file.");
    }
}
