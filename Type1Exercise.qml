import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show an image of a program, player has to choose the correct answer for describing what it does

Page {

    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    //has to be an entry in scoreList for every entry in answerlist
    property var answerList;
    property var scoreList;

    //the program to display
    property var code;


    padding: 50


    RowLayout {
        anchors.fill: parent
        spacing: 25


        Editor {
            id: vplEditor
            Layout.preferredWidth: parent.width * 2 / 5
            Layout.preferredHeight: width * 2 / 3
            enabled: false
            actionsVisible: false
            eventsVisible: false
        }

        ColumnLayout {
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Text {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("What does this program do?")
                font.pointSize: 24
            }

            ListView {
                id: options

                //Layout.fillWidth: true
                Layout.preferredWidth: Screen.width / 2
                Layout.preferredHeight: optionsList.count * 50
                spacing: 12


                model: optionsList
                delegate: Row {
                    id: row
                    spacing: 8

                    Button {
                        id: control
                        implicitWidth: Screen.width / 2
                        text: name
                        background: Rectangle {
                            color: control.highlighted ? "#30efff16" :"#30ffffff"
                            border.color: control.highlighted ? "#a0efff16" : "#50ffffff"
                            radius: 5
                        }
                        contentItem: Text {
                            text: control.text
                            font: control.font
                            color: control.highlighted ? "#efff16" : "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked:  {
                            options.currentIndex = index;
                            options.model[callback]();
                        }
                        highlighted: row.ListView.isCurrentItem
                    }
                }

            }
            ListModel {
                id: optionsList

                function completeExercise() {

                    var score = scoreList[options.currentIndex];

                    stote.completeExercise(score);
                    gameWindow.next = true;

                    gameWindow.toggleDialogueBox(true);
                    gameWindow.closeExerciseWindow();
                }

            }

        }

    }

    Component.onCompleted: {
        for(var i = 0; i < answerList.length; i++) {
            optionsList.append({"name": answerList[i], "callback": "completeExercise"})
        }
        vplEditor.loadCode(code);
    }


}


/* Test exercise popup

ColumnLayout {
    anchors.fill: parent


    RowLayout {
        Layout.fillHeight: parent
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: (parent.height < parent.width ? parent.height : parent.width) / 9

        Rectangle {
            width: (parent.height < parent.width ? parent.height : parent.width) * 2 / 3
            height: (parent.height < parent.width ? parent.height : parent.width) * 2 / 3
            color: "green"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("green");

                    stote.completeExercise(1.0);
                    gameWindow.next = true;

                    gameWindow.toggleDialogueBox(true);
                    gameWindow.closeExerciseWindow();
                }
            }

        }

        Rectangle {
            width: (parent.height < parent.width ? parent.height : parent.width) * 2 / 3
            height: (parent.height < parent.width ? parent.height : parent.width) * 2 / 3
            color: "blue"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("blue");

                    stote.completeExercise(0.5);
                    gameWindow.next = true;

                    gameWindow.toggleDialogueBox(true);
                    gameWindow.closeExerciseWindow();
                }
            }
        }
    }

    DialogueBox {
        id: exerciseDialogue
        speakerName: ""
        dialogue: "Which one is green?"
    }
}*/
