import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: from 6 different programs, ask which one produces the required behaviour

Page {

    id: type2Ex
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

    property var question;


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

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignCenter
            Layout.leftMargin: 50
            Layout.rightMargin: 200
            Layout.preferredWidth: Screen.width - 300
            text: question
            font.pointSize: 24
            wrapMode: Text.WordWrap
        }

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true


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
                    clip:true




                    width: Screen.width / 3 - 75
                    height: Screen.height / 3

                    Component.onCompleted:  {
                        loadCode(program);
                        disableDestroy();
                    }

                    MouseArea {
                        anchors.fill: parent
                        z:-0.5

                        onClicked: {
                            console.log("clicked");
                            completeExercise(score);
                        }
                    }


                    //hacky workaround to make scroll-dragging in editor work without being able to change the code
                    onBlockEditorVisibleChanged: {
                        if(blockEditorVisible) {
                            blockEditorVisible = false;
                        }
                    }
                    //end hacky workaround

                    Rectangle {
                        z:-1
                        anchors.fill: parent
                        color: "#30efff16"
                        border.color: "#a0efff16"
                        radius: 5
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
        gameWindow.toggleDialogueBox(true);
        gameWindow.closeExerciseWindow(score);
        gameWindow.next = true;
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
                                    "callback": "closeVplPopup2",
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
            optionsList.append({"code": JSON.stringify(answerList[i]), "result": scoreList[i]})
        }
    }


}
