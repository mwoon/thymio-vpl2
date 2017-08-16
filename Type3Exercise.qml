import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show 2 programs, player has to choose the correct answer for describing what the difference is

Page {

    id: type3Ex
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

        ColumnLayout {
            anchors.fill: parent
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Editor {
                id: vplEditorTop
                //property alias fillHeight: Layout.fillHeight
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: type3Ex.height / 2 - 100
                //enabled: false
                clip: true
                actionsVisible: false
                eventsVisible: false
                function fillHeight() {
                    vplEditorTop.Layout.fillHeight = true;
                }
                Rectangle {
                    z:-1
                    anchors.fill: parent
                    color: "#30ffffff"
                    border.color: "#50ffffff"
                    radius: 5
                }

                //hacky workaround to make scroll-dragging in editor work without being able to change the code
                onBlockEditorVisibleChanged: {
                    if(blockEditorVisible) {
                        blockEditorVisible = false;
                    }
                }

                Component.onCompleted: {
                    disableDestroy();
                }
                //end hacky workaround
            }

            Editor {
                id: vplEditorBot
                //property alias fillHeight: Layout.fillHeight
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: parent.width  / 5
                //enabled: false
                clip: true
                actionsVisible: false
                eventsVisible: false

                function fillHeight() {
                    vplEditorBot.Layout.fillHeight = true;
                }

                Rectangle {
                    z:-1
                    anchors.fill: parent
                    color: "#30ffffff"
                    border.color: "#50ffffff"
                    radius: 5
                }

                //hacky workaround to make scroll-dragging in editor work without being able to change the code
                onBlockEditorVisibleChanged: {
                    if(blockEditorVisible) {
                        blockEditorVisible = false;
                    }
                }

                Component.onCompleted: {
                    disableDestroy();
                }
                //end hacky workaround
            }
        }


        ColumnLayout {
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Text {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("What is the difference between these two?")
                font.pointSize: 24
            }

            ListView {
                id: options

                //Layout.fillHeight: true
                Layout.preferredWidth: Screen.width / 2
                Layout.preferredHeight: optionsList.count * 75

                spacing: 12
                interactive: false

                model: optionsList
                delegate: Row {
                    id: row
                    spacing: 8

                    Button {
                        id: control
                        implicitWidth: type3Ex.width / 2
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
                            color:  "#efff16"
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
                                    "callback": "closeVplPopup3",
                                    "whiteIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg",
                                    "blackIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg"
                                });
            }

            editor.clip: true
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
        shuffleOptions();
        for(var i = 0; i < answerList.length; i++) {
            optionsList.append({"name": answerList[i], "callback": "completeExercise"})
        }
        var parsed1 = JSON.parse(code1);
        var parsed2 = JSON.parse(code2);
        if(parsed1.scene.length > parsed2.scene.length) {
            vplEditorTop.fillHeight();
        } else if (parsed2.scene.length > parsed1.scene.length) {
            vplEditorBot.fillHeight();
        } else {
            vplEditorBot.fillHeight();
            vplEditorTop.fillHeight();
        }

        vplEditorTop.loadCode(code1);
        vplEditorBot.loadCode(code2);

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
