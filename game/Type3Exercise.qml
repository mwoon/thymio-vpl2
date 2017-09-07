import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show 2 programs, player has to choose the correct answer for describing what the difference is
/*!
  \brief Type3Exercise defines the layout and logic for an exercise of type 3.

  Type 3 Exercises show the player 2 different but similar programs and ask what the difference between these two are. Several options are presented to the player which each provide an explanation for the difference. Only one is correct. Players can access the VPL to test programs for themselves by clicking the button in the upper right corner.

  This component is loaded from \l GameInterface which also sets its properties to define an exercise.
*/
Page {

    id: type3Ex
    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    /*!
      This property contains a list of answers. Each item in this list is displayed in full on the screen.

      Care should be taken to word the answers concisely as screen space is a limiting factor and there might not be enough space to display all the items otherwise.
    */    property var answerList;
    /*!
      This property holds a value for each item in \c answerList.

      The values correspond to the score given to the player for choosing the item in \c answerList with the matching index.
    */
    property var scoreList;

    /*!
      This property stores the VPL program in string format that is to be placed on top.
    */
    property var code1;
    /*!
      This property stores the VPL program in string format that is to be placed below.
    */
    property var code2;


    padding: 10

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
        spacing: 5

        ColumnLayout {
            anchors.fill: parent
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Editor {
                id: vplEditorTop
                //property alias fillHeight: Layout.fillHeight
                Layout.preferredWidth: type3Ex.width * 2 / 5
                Layout.preferredHeight: type3Ex.height / 3
                Layout.maximumHeight: parent.height / 2
                anchors.top: parent.top
                scale: 1
                //enabled: false
                clip: true
                actionsVisible: false
                eventsVisible: false
                function fillHeight() {
                    vplEditorTop.Layout.fillHeight = true;
                }
                Rectangle {
                    z:-1
                    width: parent.width - parent.width * 0.3
                    height: parent.height
                    anchors.centerIn: parent
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
                Layout.preferredWidth: type3Ex.width * 2 / 5
                Layout.preferredHeight: type3Ex.height  / 3
                Layout.maximumHeight: parent.height / 2
                anchors.bottom: parent.bottom
                scale: 1
                //enabled: false
                clip: true
                actionsVisible: false
                eventsVisible: false

                function fillHeight() {
                    vplEditorBot.Layout.fillHeight = true;
                }

                Rectangle {
                    z:-1
                    width: parent.width - parent.width * 0.3
                    height: parent.height
                    anchors.centerIn: parent
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
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true

            Text {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("What is the difference between these two?")
                font.pointSize: 24
                topPadding: 5
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

        width: parent.width
        height: parent.height

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

    /*!
      This function is called to close the in exercise VPL editor.
    */
    function closePopup() {
        vplPopup.close();
    }

    /*!
      This function shuffles the two arrays \c answerList and \c scoreList so that the indices still match between each list.

      It is used to randomize the answer order.

      Adapted from: https://bost.ocks.org/mike/shuffle/
    */
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

        color: "#CCc4c4c4"
        border.color: "#FFc4c4c4"
    }

    /*!
      This property holds the script to be played when the exercise is loaded. It is similar to \c storyStack in \l GameInterface.

      When Type1Exercise has finished loading, this array is initialised using the contents from \c storyList.
    */
    property var storyStack: new Array();

    /*!
      This property holds the story content passed to the exercise from \l GameInterface.

      It is not yet formatted to be displayed.
    */
    property var storyList;
    /*!
      The dialogue is advanced when \c next is set to true.

      This is used within an exercise to explain the layout or for the characters to talk about the task.
    */
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

    /*!
      This function is used to display the next action in the exercise explanation.

      See also: \c updateStory in \l GameInterface .

      When the storyStack becomes empty, the DialogueBox is hidden and deactivated.
    */
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

    /*!
      This function sets the speaker and dialogue to be shown within an exercise.
    */
    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = speaker;
        dialogueBox.dialogue = text;
    }

    /*!
      This function is used when multiple story actions should happen at the same time. See also: \c handleScene function in \l GameInterface.
    */
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
