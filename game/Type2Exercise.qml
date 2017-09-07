import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: from 6 different programs, ask which one produces the required behaviour
/*!
  \brief Type2Exercise defines the layout and logic for an exercise of type 2.

  Type 2 exercises give a description of a program and show the player 6 VPL programs to choose from. Players can access the VPL to try programs out for themselves using the button in the upper right corner.

  This component is loaded from \l GameInterface which also sets its properties to define an exercise.
*/
Page {

    id: type2Ex
    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    /*!
      This property holds a list of VPL code in string format. These serve as the answers players can choose from.
    */
    property var answerList: [1,2,3,4,5,6]
    /*!
      This property holds a value for each item in \c answerList.

      The values correspond to the score given to the player for choosing the item in \c answerList with the matching index.
    */
    property var scoreList;

    /*!
      This property holds the program description that should match the correct answer in \c answerList.
    */
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
            Layout.alignment: Qt.AlignLeft
            Layout.rightMargin: 200
            Layout.preferredWidth: type2Ex.width - 200
            text: question
            font.pointSize: 24
            wrapMode: Text.WordWrap
        }

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true


            columnSpacing: 25
            rowSpacing: 5
            columns: 3
            rows: 2

            Repeater {
                model: optionsList
                Rectangle {
                    z:-1
                    width: editor.width
                    height: editor.height
                    color: "#30ffffff"
                    border.color: "#50ffffff"
                    radius: 5

                        Editor {
                            id: editor
                            property var program: code
                            property var score: result
                            //enabled: false
                            actionsVisible: false
                            eventsVisible: false
                            clip:true
                            anchors.left: parent.left



                            scale: 1.9
                            width: type2Ex.width / 3 - 75
                            height: type2Ex.height / 3

                            Component.onCompleted:  {
                                loadCode(program);
                                disableDestroy();
                            }



                            //hacky workaround to make scroll-dragging in editor work without being able to change the code
                            onBlockEditorVisibleChanged: {
                                if(blockEditorVisible) {
                                    blockEditorVisible = false;
                                }
                            }
                            //end hacky workaround



                        }
                        Button {
                            id: submit
                            z:1
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            width: background.width
                            height:background.height
                            background: Rectangle {
                                anchors.centerIn: parent
                                color: "#30efff16"
                                border.color: "#a0efff16"
                                width:40
                                height:width
                                radius: width
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/thymio-vpl2/icons/ic_open_white_24px.svg"
                            }

                            }

                            onClicked: {
                                completeExercise(result);
                            }
                        }
                }
            }
        }
    }



    ListModel {
        id: optionsList

    }


    /*!
      This function closes the exercise window when an answer is given by the player and sends the result to the \l StoryTeller.
    */
    function completeExercise(score) {
        stote.completeExercise(score);
        gameWindow.toggleDialogueBox(true);
        gameWindow.closeExerciseWindow(score);
    }

    Popup {

        id: vplPopup
        modal: true

        width: parent.width
        height: parent.height
        topMargin: 0
        leftMargin: 0

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
            optionsList.append({"code": JSON.stringify(answerList[i]), "result": scoreList[i]})
        }

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
