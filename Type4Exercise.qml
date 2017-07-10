import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: complete a partial program

Page {

    id: type4Ex
    anchors.fill: parent

    //has to be an entry in scoreList for every entry in answerlist
    property var answerList;
    property var scoreList;

    //the program to display
    property var code;
    property var solution;

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

        //simulate and check behaviour

        //For now very stupid checking
        var score = 0.0;
        var sol = JSON.parse(solution);
        if(JSON.stringify(prog.scene) === JSON.stringify(sol.scene)) {
            score = 1.0;
        }

        stote.completeExercise(score);
        gameWindow.next = true;

        gameWindow.toggleDialogueBox(true);
        gameWindow.closeExerciseWindow();
    }

    Component.onCompleted: {
        vpl.code = code;
        //vpl.editor.loadCode(code);
    }


}

