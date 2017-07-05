import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show 2 programs, player has to choose the correct answer for describing what the difference is

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
    property var code1;
    property var code2;


    padding: 50


    RowLayout {
        anchors.fill: parent
        spacing: 25

        ColumnLayout {
            anchors.fill: parent
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Editor {
                id: vplEditorTop
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: width * 2 / 3
                enabled: false
                actionsVisible: false
                eventsVisible: false
            }

            Editor {
                id: vplEditorBot
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: width * 2 / 3
                enabled: false
                actionsVisible: false
                eventsVisible: false
            }
        }


        ColumnLayout {
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Text {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("What is the difference between these two?")
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
                            color: "#30efff16"
                            border.color: "#a0efff16"
                            radius: 5
                        }
                        contentItem: Text {
                            text: control.text
                            font: control.font
                            color:  "#efff16"
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
        vplEditorTop.loadCode(code1);
        vplEditorBot.loadCode(code2);
    }


}
