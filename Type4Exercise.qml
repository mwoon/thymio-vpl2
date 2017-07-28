import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: complete a partial program

Page {

    id: type4Ex
    anchors.fill: parent
    clip:true

    //has to be an entry in scoreList for every entry in answerlist
    property var answerList;
    property var scoreList;

    //the program to display
    property var code;
    property var solution;
    property var method;
    property var checkfor;

    //only for simulations
    property bool submitted: false;
    property var submittedCode;
    property var scene;
    property int sIdx: 0;
    property real totalScore: 0;
    property bool simulationIsRunning: false;
    property var special;



    VplInterface {
        id: vpl
        anchors.fill: parent
        Component.onCompleted: {
            vpl.menu.clear();
            vpl.menu.append({
                                "title": "Upload to Remote",
                                "callback": "completeExercise4",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_open_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_open_black_24px.svg"
                            });
            vpl.menu.append({
                                "title": QT_TR_NOOP("Clear Program"),
                                "callback": "newProgram",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg"
                            });
            vpl.menu.append({
                                "title": QT_TR_NOOP("Reload Program"),
                                "callback": "restartExercise",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg"
                            });
            vpl.menu.append({
                                "title": QT_TR_NOOP("Return to Main Menu"),
                                "callback": "returnToPreviousView",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg"
                            });
            vpl.editor.loadCode(code);
            }
    }

    function completeExercise(prog) {

        submittedCode = prog;

        if(method === "fixed") {
            var score = 0.0;

            //For now very stupid checking
            var sol = JSON.parse(solution);
            if(JSON.stringify(prog.scene) === JSON.stringify(sol.scene)) {
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
                                            if(r > g && r > b && ((g - b >= 0 && g - b < 4) || (b - g >= 0 && b - g < 4))) {
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
                    var codeScene = vpl.editor.sceneCode;
                    var mode = vpl.editor.modeCode;
                    codeScene.unshift([special.events, special.actions]);
                    var tempCode = { "mode": mode, "scene": codeScene};
                    vpl.editor.loadCode(JSON.stringify(tempCode));
                    vpl.editor.scene.deserialize(vpl.editor.sceneCode);
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

    function nextSimulation() {
        simulationIsRunning = true;
        //setup scene
        var scenario = {};
        scenario.duration = scene[sIdx].duration;
        scenario.worldSize = Qt.vector2d(scene[sIdx].worldSize[0], scene[sIdx].worldSize[1]);
        scenario.thymio = {"position": Qt.vector2d(scene[sIdx].thymio.position[0], scene[sIdx].thymio.position[1]), angle: Math.PI * scene[sIdx].thymio.angle};
        if(scene[sIdx].walls) {
            for(var i = 0; i < scene[sIdx].walls.length; i++){
                scenario.walls[i] = {
                    "position": Qt.vector2d(scene[sIdx].walls[i].position[0], scene[sIdx].walls[i].position[2]),
                    "angle": Math.PI * scene[sIdx].walls[i].angle,
                    "size": Qt.vector3d(scene[sIdx].walls[i].size[0], scene[sIdx].walls[i].size[1], scene[sIdx].walls[i].size[2])
                };
                if(scene[sIdx].walls[i].color) {
                    scenario.walls[i].color = scene[sIdx].walls[i].color;
                }
            }
        } else {
            scenario.walls = [];
        }

        vpl.thymio.playing = true;

        var simError;
        if(scene[sIdx].testFunction) {
            var testFunction = new Function(scene[sIdx].testFunction);
            console.log("running simulation");
            simError = vpl.thymio.runSimulationWithFunction(scenario, testFunction);

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



    /*---------------------------------------- Story Logic --------------------------------------------------*/
    DialogueBox {
        id: dialogueBox

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25

        color: "#50c4c4c4"
        border.color: "#90c4c4c4"
    }

    property var storyStack: new Array();
    property var storyList;
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

    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = speaker;
        dialogueBox.dialogue = text;
    }

    function handleScene(scene) {
        for(var i = 0; i < scene.length; i++) {
            if (scene[i].cmd === "dialogue") {
                handleDialogue(scene[i].speaker, scene[i].text);
            }
        }
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

