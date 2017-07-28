import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: complete a program from scratch

Page {

    id: type5Ex
    anchors.fill: parent
    clip:true

    //a sample solution
    property var solution;
    property var method;
    property var checkfor;
    property bool submitted: false;
    property var submittedCode;

    VplInterface {
        id: vpl
        anchors.fill: parent
        Component.onCompleted: {
            vpl.menu.clear();
            vpl.menu.append({
                                "title": "Upload to Remote",
                                "callback": "completeExercise5",
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
                                "title": QT_TR_NOOP("Return to Main Menu"),
                                "callback": "returnToPreviousView",
                                "whiteIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg",
                                "blackIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg"
                            });
            vpl.editor.clearProgram();
            }
    }

    function completeExercise(prog) {

        submittedCode = prog;

        if(method === "fixed") {
            //For now very stupid checking
            var score = 0.0;
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
        } else if(method === "sim") {
            //simulate and check behaviour
            submitted = true;
            var events = vpl.thymio.events;
            var source = vpl.thymio.source;

            //TODO for now it's just a fixed simulation world, but should load it from code
            var scenario = {
                duration: 5,
                worldSize: Qt.vector2d(100, 100),
                thymio : { position: Qt.vector2d(20, 50), angle: 0 },
                walls: [ { position: Qt.vector2d(80, 50), angle: Math.pi / 2, size: Qt.vector3d(20, 2, 10), color: "Blue" } ]
            }
            console.log("running simulation");
            var simError = simulator.runProgram(scenario, events, source);
            if (simError) {
                console.log("simulation error: " + simError)
            } else {
                console.log("simulation complete");
            }
        }
    }

    Connections {
        target: simulator
        onSimulationCompleted: {
            console.log(console.log(JSON.stringify(log)));
            if(submitted) {
                //if submitted and simulation completed -> use this result as the result
                var score = 0.0;
                //close the exercise
                stote.completeExercise(score);
                stote.appendToLog("submitted code: " + JSON.stringify(submittedCode));
                gameWindow.toggleDialogueBox(true);
                gameWindow.closeExerciseWindow(score);
            }


        }

    }

}
