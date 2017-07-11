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

    function completeExercise(code) {

        if(method === "fixed") {
            //For now very stupid checking
            var score = 0.0;
            var sol = JSON.parse(solution);
            if(JSON.stringify(code.scene) === JSON.stringify(sol.scene)) {
                score = 1.0;
            }

            stote.completeExercise(score);
            gameWindow.next = true;

            gameWindow.toggleDialogueBox(true);
            gameWindow.closeExerciseWindow();
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
            console.log(positionLog + " " + sensorLog);
            if(submitted) {
                //if submitted and simulation completed -> use this result as the result

                //close the exercise
                gameWindow.next = true;

                gameWindow.toggleDialogueBox(true);
                gameWindow.closeExerciseWindow();
            }


        }

    }

}
