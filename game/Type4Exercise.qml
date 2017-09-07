import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: complete a partial program
/*!
  \brief Type4Exercise defines the layout and logic for an exercise of type 4.

  Type 4 exercises are programming exercises where part of the code is given. A task description is given before the exercise is started but can be reviewed again by clicking the button labelled "Ask Ada what to do". Part of the solution is loaded as VPL code in the beginning.

  This component is loaded from \l GameInterface which also sets its properties to define an exercise.
*/
Page {

    id: type4Ex
    anchors.fill: parent
    clip:true

    /*!
      Used to hold the exercise description. The descriptions are in the same format as other dialogue story content.
    */
    property var description;

    /*!
      Not used for this exercise type
    */
    property var answerList;
    /*!
      Not used for this exercise type
    */
    property var scoreList;

    /*!
      This property stores the code that should be loaded in the beginning. This code should be an incomplete program.
    */
    property var code;

    /*!
      This property holds a sample solution of VPL code in string format.

      If no other method for code correction is given, a one to one comparison with the user submitted code is done with this sample solution.
    */
    property var solution;

    /*!
      This property stores the method that should be used to evaluate the code submitted by a student.

      It should be set to \a sim or \a fixed.
    */
    property var method;

    /*!
      If \c method is set to \a fixed, this property should store an array of javaobjects specifying what the user submitted code should contain.
    */
    property var checkfor;

    //only for simulations:

    /*!
      This property stores whether the user has already submitted the code.

      Should be obsolete but was used in earlier versions to verify that simulations are running because the user has submitted their code.
    */
    property bool submitted: false;

    /*!
      This property stores a copy of the code a user submitted.

      It is used to pass on to \l StoryTeller for logging purposes and to reset the code if multiple simulations are run and the code needs to be extended to be properly simulated.
    */
    property var submittedCode;

    /*!
      This property stores all details relevant for the simulations. Scene should be a JSON array where each item is an object describing 1 simulation.
    */
    property var scene;

    /*!
      The index of the simulation that is currently being run.
    */
    property int sIdx: 0;

    /*!
      The total score of the student.

      This score can be increased after each simulation run.
    */
    property real totalScore: 0;

    /*!
      Boolean to check if the simulation is still running. If it is still running, the exercise should not close yet.
    */
    property bool simulationIsRunning: false;

    /*!
      This property stores any special steps that should be taken before any simulation is run.

      For example, to simulate the color changing when sensor values change, a line of code making the motor move forwards could be added so the sensor values in the simulation will eventually change. This makes it easier to ensure that the color is not just changing by default in the beginning but really reacting to the sensor value change.
    */
    property var special;



    VplInterface {
        id: vpl
        anchors.fill: parent
        Component.onCompleted: {
            vpl.menu.clear();
            vpl.menu.append({
                                "title": qsTr("Clear Program"),
                                "callback": "newProgram",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg"
                            });
            vpl.menu.append({
                                "title": qsTr("Reload Program"),
                                "callback": "restartExercise",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg"
                            });
            /*
            vpl.menu.append({
                                "title": QT_TR_NOOP("Return to Main Menu"),
                                "callback": "returnToPreviousView",
                                "whiteIcon": "",
                                "blackIcon": ""
                            });
            */
            vpl.editor.loadCode(code);
            vpl.setUploadButton(function(){completeExercise(vpl.editor.scene.serialize())});
            if(description){vpl.setQuestionButton(function(){showDescription()});}
            }
    }

    /*!
      This function evaluates the submitted code based on the \c method for a particular exercise and closes the exercise to return back to the game.
    */
    function completeExercise(prog) {

        submittedCode = prog;
        console.log(JSON.stringify(submittedCode));

        if(method === "fixed") {
            var score = 0.0;

            //For now very stupid checking
            var sol = JSON.parse(solution);
            if(JSON.stringify(prog) === JSON.stringify(sol.scene)) {
                score = 1.0;
            } else if (checkfor && checkfor.length > 0) {
                console.log("checking variable solutions");
                for(var i = 0; i < checkfor.length; i++) {
                    if(checkfor[i].type === "buttoncolor") {
                        for(var j = 0; j < prog.scene.length; j++) {
                            //prog.scene[j][0] = events, prog.scene[j][1] = actions
                            //checks if this row contains the correct button
                            if(prog.scene[j][0].length === 1 && prog.scene[j][0][0].definition === "ButtonsEventBlock" &&  JSON.stringify(prog.scene[j][0][0].params) === JSON.stringify(checkfor[i].button)) {
                                //one of the actions has to contain the correct color
                                for(var actions = 0; actions < prog.scene[j][1].length; actions++) {
                                    if(prog.scene[j][1][actions].definition === "PaletteTopColorActionBlock" || prog.scene[j][1][actions].definition === "TopColorActionBlock") {
                                        var r = prog.scene[j][1][actions].params[0];
                                        var g = prog.scene[j][1][actions].params[1];
                                        var b = prog.scene[j][1][actions].params[2];

                                        if(checkfor[i].color === "red") {
                                            console.log(prog.scene[j][1][actions].params);
                                            if(r > g && r > b && ((g - b >= 0 && g - b <= 4) || (b - g >= 0 && b - g <= 4))) {
                                                score = 1.0;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            stote.completeExercise(score);
            stote.appendToLog("submitted code: " + JSON.stringify(submittedCode));
            gameWindow.toggleDialogueBox(true);
            gameWindow.closeExerciseWindow(score);

        } else if(method === "sim"){
            //simulate and check behaviour
            submitted = true;

            //check for special simulations
            if(special) {
                switch(special.cmd) {
                case "insertCode":
                    vpl.editor.saveProgram("autosaveName");
                    var codeScene = submittedCode;
                    var mode = vpl.editor.modeCode;
                    codeScene.unshift([special.events, special.actions]);
                    var tempCode = { "mode": mode, "scene": codeScene};
                    vpl.editor.loadCode(JSON.stringify(tempCode));
                    vpl.editor.compiler.forceCompile();
                    break;
                default:
                    break;
                }
            }

            //start all simulations
            while(sIdx < scene.length) {
                nextSimulation();
                while(simulationIsRunning){}
                sIdx++;
            }


            //close the exercise
            stote.completeExercise(totalScore);
            stote.appendToLog("submitted code: " + JSON.stringify(submittedCode));
            gameWindow.toggleDialogueBox(true);
            gameWindow.closeExerciseWindow(totalScore);

        }

    }

    /*!
      This function completes one simulation as described by an item in \c scene.
    */
    function nextSimulation() {
        simulationIsRunning = true;

        //check for special simulations
        if(scene[sIdx].special) {
            switch(scene[sIdx].special.cmd) {
            case "insertCode":
                vpl.editor.saveProgram("autosaveName");
                var codeScene = submittedCode;
                var mode = vpl.editor.modeCode;
                codeScene.unshift([scene[sIdx].special.events, scene[sIdx].special.actions]);
                var tempCode = { "mode": mode, "scene": codeScene};
                vpl.editor.loadCode(JSON.stringify(tempCode));
                vpl.editor.compiler.forceCompile();
                break;
            case "removeCodeOfType":
                vpl.editor.saveProgram("autosaveName");
                var codeScene = submittedCode;
                var mode = vpl.editor.modeCode;
                for(var i = 0; i < codeScene.length; i++) {
                    var contains = false;
                    for(var j = 0; j < codeScene[i][0].length; j++) {
                        if(codeScene[i][0][j].definition.indexOf(scene[sIdx].special.type) !== -1) {
                            contains = true;
                        }
                    }
                    if(contains) {
                        codeScene.splice(i, 1);
                        i--;
                    }
                }
                var tempCode = { "mode": mode, "scene": codeScene};
                vpl.editor.loadCode(JSON.stringify(tempCode));
                vpl.editor.compiler.forceCompile();
                break;
            default:
                break;
            }
        }


        //setup scene
        var scenario = {};
        scenario.duration = scene[sIdx].duration;
        scenario.worldSize = Qt.vector2d(scene[sIdx].worldSize[0], scene[sIdx].worldSize[1]);
        scenario.thymio = {"position": Qt.vector2d(scene[sIdx].thymio.position[0], scene[sIdx].thymio.position[1]), angle: Math.PI * scene[sIdx].thymio.angle};
        scenario.walls = [];
        if(scene[sIdx].walls) {
            for(var i = 0; i < scene[sIdx].walls.length; i++){
                scenario.walls[i] = {
                    "position": Qt.vector2d(scene[sIdx].walls[i].position[0], scene[sIdx].walls[i].position[1]),
                    "angle": Math.PI * scene[sIdx].walls[i].angle,
                    "size": Qt.vector3d(scene[sIdx].walls[i].size[0], scene[sIdx].walls[i].size[1], scene[sIdx].walls[i].size[2])
                };
                if(scene[sIdx].walls[i].color) {
                    scenario.walls[i].color = scene[sIdx].walls[i].color;
                }
            }
        }
        if(scene[sIdx].ground_img) {
            scenario.groundTexture = stote.returnExerciseFolder() + scene[sIdx].ground_img;
        }

        vpl.thymio.playing = true;

        var simError;
        if(scene[sIdx].testFunction) {
            console.log("running simulation");
            simError = vpl.thymio.runSimulationWithFunction(scenario, scene[sIdx].testFunction);

        } else {
            console.log("running simulation");
            simError = vpl.thymio.runSimulation(scenario);

        }
    }

    Connections {
        target: simulator
        onSimulationCompleted: {

            vpl.thymio.playing = false;

            console.log("Checking results of simulation");
            //console.log(JSON.stringify(log))
            if(submitted) {
                //if submitted and simulation completed -> check the simulation for the result
                var score = 1.0;

                if (scene[sIdx].checkfor && scene[sIdx].checkfor.length > 0) {
                    score = 0.0;
                    var scorePerCheck = 1.0 / scene[sIdx].checkfor.length;
                    for(var curCheck = 0; curCheck < scene[sIdx].checkfor.length; curCheck++) {
                        switch(scene[sIdx].checkfor[curCheck].type) {
                        case "xgreater" :
                            if(scene[sIdx].checkfor[curCheck].endpos < log[log.length - 1].position.x) {score += scorePerCheck;}
                            break;
                        case "xsmaller" :
                            if(scene[sIdx].checkfor[curCheck].endpos > log[log.length - 1].position.x) {score += scorePerCheck;}
                            break;
                        case "topcolor" :
                            if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length > 0) { //was there a native call
                                console.log("checking color");
                                var matched = false;
                                for(var j = 0; j < log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length; j++) {
                                    if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].id === 5) { //was the native call to the top color
                                        console.log("checking top color");
                                        var coloration = log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].values;
                                        matched = matched || checkColor(coloration, scene[sIdx].checkfor[curCheck].color);
                                    }
                                }
                                if(matched) {
                                    score += scorePerCheck;
                                }
                            }
                            break;
                        case "nottopcolor":
                            if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length > 0) {
                                var matched = false;
                                for(var j = 0; j < log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length; j++) {
                                    matched = matched || (log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].id === 5);
                                }
                                if(!matched) {
                                    score += scorePerCheck;
                                }
                            } else {
                                score += scorePerCheck;
                            }
                            break;
                        case "botcolor":
                            if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length > 0) { //was there a native call
                                console.log("checking color");
                                var matched = false;
                                for(var j = 0; j < log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length; j++) {
                                    if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].id === 7) { //was the native call to the top color
                                        console.log("checking top color");
                                        var coloration = log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].values;
                                        matched = matched || checkColor(coloration, scene[sIdx].checkfor[curCheck].color);
                                    }
                                }
                                if(matched) {
                                    score += scorePerCheck;
                                }
                            }
                            break;
                        case "notbotcolor":
                            if(log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length > 0) {
                                var matched = false;
                                for(var j = 0; j < log[scene[sIdx].checkfor[curCheck].time].nativeCalls.length; j++) {
                                    matched = matched || (log[scene[sIdx].checkfor[curCheck].time].nativeCalls[j].id === 7);
                                }
                                if(!matched) {
                                    score += scorePerCheck;
                                }
                            } else {
                                score += scorePerCheck;
                            }
                            break;
                        default:
                            break;
                        }
                    }
                }

                totalScore += score / scene.length;
                console.log("totalScore: " + totalScore);

            }

            simulationIsRunning = false;
        }

    }

    /*!
      A function used to decide if the given RGB value in \c coloration match the color textual color given in \c color.

      The colors are matched based on some intervals defined by hand. available \c colors are: \a red, \a green, \a blue, \a pink, \a light blue, \a yellow, \a orange.

      Returns true or false depending on if the color matched or not.
    */
    function checkColor(coloration, color){
        var match = false;

        var r = coloration[0];
        var g = coloration[1];
        var b = coloration[2];
        var correct = false;
        switch(color) {
        case "red" :
            if(r > g && r > b && ((g - b >= 0 && g - b <= 4) || (b - g >= 0 && b - g <= 4) || (r > 30 && (b + g < 20)))) {match = true;}
            break;
        case "green" :
            if((g > r && g > b && ((r - b >= 0 && r - b <= 4) || (r - g >= 0 && r - g <= 4))) || (g > r*2 && g > b*2)){match = true;}
            break;
        case "pink" :
            if((r >= 30 && b >= 14  && ((b - g) >= 0))){match = true;}
            break;
        case "blue" :
            if((b > r && b > g && ((g <= 24 && g - r >= 0) || (r <= 7 && r - g >= 0)))){match = true;}
            break;
        case "light blue" :
            if(b > r+3 && g > r+3 && b >= g && b - g <= 6 ){match = true;}
            break;
        case "yellow" :
            if(r > b && g > b && ((g - r >= 0 && g - r <= 4) || (r - g >= 0 && r - g <= 4)) && ((g - r >= 0 && g >= b*2) || (r - g >= 0 && r<= b*2) || (r + g >= 58)) ){match = true;}
            break;
        case "orange":
            if(r <= g * 5 && g > b * 2 && r * 7 / 8 > g) {match = true;}
        default:
            break;
        }

        return match;
    }

    /*---------------------------------------- Story Logic --------------------------------------------------*/
    DialogueBox {
        id: dialogueBox

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25

        color: "#CCc4c4c4"
        border.color: "#FFc4c4c4"
    }

    /*!
      This property holds the script to be played when the exercise is loaded. It is similar to \c storyStack in \l GameInterface.

      When Type1Exercise has finished loading, this array is initialised using the contents from \c storyList.
    */
    property var storyStack: new Array();

    /*!
      This property holds the story content passed to the exercise from \l GameInterface.

      It is not yet formatted to be displayed.
    */
    property var storyList;
    /*!
      The dialogue is advanced when \c next is set to true.

      This is used within an exercise to explain the layout or for the characters to talk about the task.
    */
    property bool next: false //signals when a new segment is ready to be read
    onNextChanged: {
        if(next) {
            updateStory();
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        z: 2

        onClicked: {
            next = true;
        }
    }

    /*!
      This function is used to display the next action in the exercise explanation.

      See also: \c updateStory in \l GameInterface .

      When the storyStack becomes empty, the DialogueBox is hidden and deactivated.
    */
    function updateStory() {
        if(!next) { return; }
        next = false;

        if(storyStack.length > 0) {
            var part = storyStack.shift();

            if(part.type === "story" || part.type === "activity") {
                if (part.content.cmd === "multi") {
                    handleScene(part.content.scene);
                } else if (part.content.cmd === "dialogue") {
                    handleDialogue(part.content.speaker, part.content.text);
                }
            }
        } else {
            mouse.enabled = false;
            dialogueBox.visible = false;
        }
    }

    /*!
      This function sets the speaker and dialogue to be shown within an exercise.
    */
    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = speaker;
        dialogueBox.dialogue = text;
    }

    /*!
      This function is used when multiple story actions should happen at the same time. See also: \c handleScene function in \l GameInterface.
    */
    function handleScene(scene) {
        for(var i = 0; i < scene.length; i++) {
            if (scene[i].cmd === "dialogue") {
                handleDialogue(scene[i].speaker, scene[i].text);
            }
        }
    }

    /*!
      This function causes the description to be shown to the player again in dialogue format.
    */
    function showDescription() {
        if(description) {
            var part;
            for(var i = 0; i < description.length; i++) {
                part = {};
                part.type = "story";
                part.content = description[i];
                storyStack.push(part);
            }
        }
        next = true;
        mouse.enabled = true;
        dialogueBox.visible = true;
    }
    /*--------------------------------------------------------------------------------------------------------*/




    Component.onCompleted: {
        vpl.code = code;
        //vpl.editor.loadCode(code);

        if(storyList) {
            var part;
            for(var i = 0; i < storyList.length; i++) {
                part = {};
                part.type = "story";
                part.content = storyList[i];
                storyStack.push(part);
            }
        }

        next = true;
    }


}

