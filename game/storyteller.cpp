#include "game/storyteller.h"

/*!
  \class StoryTeller
  \brief The StoryTeller class serves as a gateway between front and backend.

  The StoryTeller class manages the script of the game and decides the next action in the game. It chooses between the next story block and staying in an exercise block, resets the script when the game is reset.

  Additionally, various behaviours for simulating the a user of the game are in this class. These functions generate a score according to each of their specifications.

  Finally, the StoryTeller also does some bookkeeping by holding and writing logs of the exercises and corresponding scores into files.


*/

/*!
  Sets up a storyteller object by initialising the script and variables.
*/

StoryTeller::StoryTeller(QObject *parent) : QObject(parent)
{
    initializeScript();
    mainIndex = 0;
    successfulExercises = 0;
    totalExInBlock = 0;
}

/*!
  Sets up the script which is a list of objects to determine the flow of the story.
*/

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

/*!
  \brief StoryTeller::advanceScript decides the next section of the story after the current one is finished.

  Is used whenever \l GameInterface has exhausted its current list of actions and requests the next one. It decides if the story should progress after an exercise or another exercise should be solved before the story will move on. If an exercise should be chosen, one will be selected from \l Zpdes.
*/
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

/*!
  \brief StoryTeller::completeExercise adjusts the state of the story according to the outcome of the exercise.

  Increments the exercise counts, forwards the result to \l Zpdes and appends the result to the log.
*/
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

/*!
  \brief StoryTeller::resetScript resets the game so it can be played from the beginning.

  Resets all the variables.

  This is called when returning to \l HomeScreen.
*/
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

/*!
 * \brief StoryTeller::lastGenerated returns the last string sent to the game.
 *
 * This function returns the string representation of the last json object sent to the  \l GameInterface.
 *
 * It is used mainly for the simulations as a stopping condition and to set the probability of succeeding.
 */
QString StoryTeller::lastGenerated() {
    return last;
}

/*!
  \brief StoryTeller::appendToLog appends a QString to the log which is written to file upon resetting of the game.
*/
void StoryTeller::appendToLog(QString toLog) {
    std::string logString;
    logString = toLog.toStdString();
    log.push_back(logString);
}

/*!
 * \brief StoryTeller::returnExerciseFolder returns the folder name where exercises are stored.
 *
 * For android devices, the folder where additional project files are stored is in a different location than on desktop.
 *
 * returns the name of the folder where exercises are stored
 */
QString StoryTeller::returnExerciseFolder() {
    std::string folderName;
    if(QSysInfo::productType() == "android") {
        folderName = "assets:/";
    } else {
        folderName = "exercises/";
    }
    return QString::fromStdString(folderName);
}

//---------------- Simulation functions -------------------

/*!
  Used to simulate playthroughs of the game.

  Student passes an exercise with 30%.
*/
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

/*!
  Used to simulate playthroughs of the game.

  Fixed success rate by type of exercise.

  Probabilities provided are the probabilities to fail exercises of that type. For example, prob1 = 0.3 means that a type 1 exercise has 30% chance of failing.
*/
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

/*!
  Used to simulate playthroughs of the game.

  Simulates a student who increases his chance of success for a type of exercise with each successful exercise by 0.1 and with each failed exercise by 0.05.
*/
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

/*!
  Used to simulate playthroughs of the game.

  Simulates a student who increases his chance of success for a type of exercise with each successful exercise by 0.1 and with each failed exercise by 0.05.

  Additionally, the chance of success is scaled by the complexity of the exercise. 0.7 for medium exercises and 0.5 for hard exercises.
*/
void StoryTeller::simulateIptSc() {
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

    std::string ex = lastString.substr(lastString.find("[\"") + 2, 3);
    qDebug() << QString::fromStdString(ex);

    std::string basic = "E01E02E03E04E05E06E08E11E13E26E32E34E35E31E28E16E20E17E45E18E41E42";
    std::string medium = "E09E14E27E29E30E19E44E24E43";
    std::string hard = "E10E15E25E33E22E46E21E40E47E23";

    if(basic.find(ex) != std::string::npos) {
        percent = percent * 1;
    } else if(medium.find(ex) != std::string::npos) {
        percent = percent * 0.7;
    } else if(hard.find(ex) != std::string::npos) {
        percent = percent * 0.5;
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

/*!
  Turns the string into an array of strings that can be added to a json.
  Content has to be a list of json objects.
*/
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

/*!
  Returns a string representing a json object (without the enclosing curly braces).
  The property called propertyName is an array whose data is content.
 */
std::string StoryTeller::makeJsonArray(std::string propertyName, std::string content) {
    std::ostringstream json;
    json << "\"" << propertyName << "\" : [";
    json << content;
    json << "] ";
    std::string jsonStr = json.str();



    return jsonStr;
}

/*!

  A Helper function to write logs to file.

  This is used to save the playthrough logs to disk to be evaluated further.

  It was adapted from this tutorial for file io with Qt: http://expletive-deleted.com/2015/02/26/file-io-in-qt5/
*/
//
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

/*!
  \fn void StoryTeller::segmentGenerated(const QString& newText)

  Is called when a new story segment is generated by \l advanceScript.

  \l GameInterface handles this signal by loading the corresponding file.
*/
