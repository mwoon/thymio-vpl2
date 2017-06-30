import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: from 6 different programs, ask which one produces the required behaviour

Page {

    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    //has to be an entry in scoreList for every entry in answerlist
    property var answerList: [1,2,3,4,5,6]
    property var scoreList;


    padding: 50

    GridLayout {
        anchors.fill: parent
        columnSpacing: 25
        rowSpacing: 25
        columns: 3
        rows: 2

        Repeater {
            model: optionsList
            Editor {
                property var program: code
                property var score: result
                //enabled: false
                actionsVisible: false
                eventsVisible: false

                Layout.fillWidth: true
                Layout.fillHeight: true

                Component.onCompleted:  {
                    loadCode(program);
                }

                MouseArea {
                    anchors.fill: parent
                    z:1
                    onClicked: {
                        completeExercise(score)
                    }
                }
            }
        }
    }

    ListModel {
        id: optionsList

    }


    function completeExercise(score) {
        stote.completeExercise(score);
        gameWindow.next = true;

        gameWindow.toggleDialogueBox(true);
        gameWindow.closeExerciseWindow();
    }

    Component.onCompleted: {
        for(var i = 0; i < answerList.length; i++) {
            optionsList.append({"code": JSON.stringify(answerList[i]), "result": scoreList[i]})
        }
    }


}
