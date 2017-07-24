import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show an image of a program, player has to choose the correct answer for describing what it does

Page {

    id: type1Ex
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

    Button {
        anchors.right: parent.right
        anchors.top: parent.top
        width: 80
        height: 40
        background: Rectangle {
            color: "#30efff16"
            border.color: "#a0efff16"
            radius: 5
        }
        Image {
            anchors.centerIn: parent
            source: "qrc:/thymio-vpl2/icons/ic_connection_on_nonAR_white_24px.svg"
        }

      onClicked: {
          vplPopup.open();
      }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 25


        Editor {
            id: vplEditor
            Layout.preferredWidth: parent.width * 2 / 5
            Layout.preferredHeight: width * 2 / 3
            //enabled: false
            clip: true
            actionsVisible: false
            eventsVisible: false

            Rectangle {
                anchors.fill: parent
                z:1
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {}
                }
            }
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
                Layout.preferredHeight: optionsList.count * 100
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
                            //font: control.font
                            font.pointSize: 14
                            color: "#efff16"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            wrapMode: Text.WordWrap
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
                    gameWindow.toggleDialogueBox(true);
                    gameWindow.closeExerciseWindow(score);
                    gameWindow.next = true;
                }

            }

        }

    }


    Popup {

        id: vplPopup
        modal: true
        closePolicy: Popup.NoAutoClose

        width: parent.width
        height:parent.height

        background: Rectangle {
            color: "transparent"
        }

        VplInterface {
            id: vpl
            anchors.fill: parent
            Component.onCompleted: {
                vpl.menu.clear();
                vpl.menu.append({
                                    "title": QT_TR_NOOP("Clear Program"),
                                    "callback": "newProgram",
                                    "whiteIcon": "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg",
                                    "blackIcon": "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg"
                                });
                vpl.menu.append({
                                    "title": QT_TR_NOOP("Back to Ada and Thymio"),
                                    "callback": "closeVplPopup1",
                                    "whiteIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg",
                                    "blackIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg"
                                });
            }
        }
    }

    function closePopup() {
        vplPopup.close();
    }

    //shuffle two arrays the same way
    //adapted from: https://bost.ocks.org/mike/shuffle/
    function shuffleOptions() {
      var m = answerList.length, t, i;

      // While there remain elements to shuffle…
      while (m) {

        // Pick a remaining element…
        i = Math.floor(Math.random() * m--);

        // And swap it with the current element.
        t = answerList[m];
        answerList[m] = answerList[i];
        answerList[i] = t;

        // Swap second array as well
        t = scoreList[m];
        scoreList[m] = scoreList[i];
        scoreList[i] = t;
      }

    }



    Component.onCompleted: {
        shuffleOptions();

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
