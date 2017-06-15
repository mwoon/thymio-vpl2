import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

    property StackView view
    property var storyStack: new Array()
    property bool next: false //signals when a new segment is ready to be read
    onNextChanged: {
        if(next) {
            updateStory();
        }
    }


    id: gameWindow
    title: qsTr("Thymio game WIP")
    visible: true

    Rectangle {
        //Box to hold the background
        id: bgrd
        color: "steelblue"
        anchors.fill: parent
    }

    DialogueBox {
        id: dialogueBox
    }

    ColumnLayout {

        anchors.fill: parent
        spacing: 10

        RowLayout {
            ListView {
                id:lView
                clip: true //apparently this can affect performance
                model: textOutput
                Layout.fillHeight: true
                Layout.fillWidth: true
                delegate: Text {
                    font.pointSize: 24
                    text: "> " + output
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        }

        Row {

            id: answersList
            spacing: 20

            Button {
                id: answer0
                visible: false
                text: qsTr("1.0")
                onClicked: {
                    stote.completeExercise(1.0);
                    next = true;
                }
            }

            Button {
                id: answer1
                visible: false
                text: qsTr("0.9")
                onClicked: {
                    stote.completeExercise(0.9);
                    next = true;
                }
            }

            Button {
                id: answer2
                visible: false
                text: qsTr("0.8")
                onClicked: {
                    stote.completeExercise(0.8);
                    next = true;
                }
            }

            Button {
                id: answer3
                visible: false
                text: qsTr("0.7")
                onClicked: {
                    stote.completeExercise(0.7);
                    next = true;
                }
            }

            Button {
                id: answer4
                visible: false
                text: qsTr("0.6")
                onClicked: {
                    stote.completeExercise(0.6);
                    next = true;
                }
            }

            Button {
                id: answer5
                visible: false
                text: qsTr("0.5")
                onClicked: {
                    stote.completeExercise(0.5);
                    next = true;
                }
            }

            Button {
                id: answer6
                visible: false
                text: qsTr("0.4")
                onClicked: {
                    stote.completeExercise(0.4);
                    next = true;
                }
            }

            Button {
                id: answer7
                visible: false
                text: qsTr("0.3")
                onClicked: {
                    stote.completeExercise(0.3);
                    next = true;
                }
            }

            Button {
                id: answer8
                visible: false
                text: qsTr("0.2")
                onClicked: {
                    stote.completeExercise(0.2);
                    next = true;
                }
            }

            Button {
                id: answer9
                visible: false
                text: qsTr("0.1")
                onClicked: {
                    stote.completeExercise(0.1);
                    next = true;
                }
            }

            Button {
                id: answer10
                visible: false
                text: qsTr("0.0")
                onClicked: {
                    stote.completeExercise(0.0);
                    next = true;
                }
            }

            Button {
                id: nextButton
                text: qsTr("Next")
                onClicked: {
                    next = true;
                }
            }
        }
    }

    function updateStory() {
        if(!next) { return; }
        next = false;

        if(storyStack.length > 0) {
            var part = storyStack.shift();
            if(part.type === "story") {
                if(part.content.cmd === "text") {
                    handleText(part.content.text)
                } else if (part.content.cmd === "bg") {
                    handleBgColor(part.content.color);
                } else if (part.content.cmd === "multi") {
                    handleScene(part.content.scene);
                }

                nextButton.visible = true;
                answer0.visible = false;
                answer1.visible = false;
                answer2.visible = false;
                answer3.visible = false;
                answer4.visible = false;
                answer5.visible = false;
                answer6.visible = false;
                answer7.visible = false;
                answer8.visible = false;
                answer9.visible = false;
                answer10.visible = false;
            } else if (part.type === "activity") {
                textOutput.append({"output": part.content});
                nextButton.visible = false;
                answer0.visible = true;
                answer1.visible = true;
                answer2.visible = true;
                answer3.visible = true;
                answer4.visible = true;
                answer5.visible = true;
                answer6.visible = true;
                answer7.visible = true;
                answer8.visible = true;
                answer9.visible = true;
                answer10.visible = true;
            }

            lView.positionViewAtEnd();
        } else {
            stote.advanceScript();
        }
    }

    Connections {
        target: stote
        onSegmentGenerated: {

            var newStorySequence = JSON.parse(newText);
            var part;
            if(newStorySequence.story0) {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                        print('HEADERS_RECEIVED')
                    } else if(xhr.readyState === XMLHttpRequest.DONE) {
                        print('DONE');
                        console.log(xhr.status);
                        console.log(xhr.responseText.toString());
                        var a = JSON.parse(xhr.responseText.toString());
                        for(var i = 0; i < a.list.length; i++) {
                            part = {};
                            part.type = "story";
                            part.content = a.list[i];
                            storyStack.push(part);
                        }
                        next = true;
                    }
                }
                var file = "thymio-vpl2/story/" + newStorySequence.story0[0] + ".json";
                console.log(file);
                xhr.open("GET", file);
                xhr.send();
/*
                for(var i = 0; i < a.length; i++) {
                    part = {};
                    part.type = "story";
                    part.content = a[i];
                    storyStack.push(part);
                }
                */
            }

            if(newStorySequence.activity)  {
                for(var i = 0; i < newStorySequence.activity.length; i++) {
                    part = {};
                    part.type = "activity";
                    part.content = newStorySequence.activity[i];
                    storyStack.push(part);
                }
                next = true;
            }

            if(newStorySequence.story1) {
                for(var i = 0; i < newStorySequence.story1.length; i++) {
                    part = {};
                    part.type = "story";
                    part.content = newStorySequence.story1[i]
                    storyStack.push(part);
                }
            }
        }
    }



    ListModel {
        id: textOutput
    }

    Component.onCompleted: {
        next = true;
    }


/*-------------------------- Title Bar & Drawer Menu --------------------------------------*/

    header: gameTB

    GameTitleBar {
        id: gameTB
        visible: true
        onOpenDrawer: {
            drawer.open()
        }
        z: 1
        x: 10
        y: 10
    }

    MenuDrawer {
        id: drawer
        drawerModel: gameMenu
    }

    ListModel {
        id: gameMenu

        ListElement {
            title: "Return to Home";
            callback: "showHome";
        }

        ListElement {
            title: "Test Functions";
            callback: "showFunction";
        }

        function showHome() {
            startupWindow.showHome();
            stote.resetScript();
        }

        //This function should be adapted whenever something needs to be tested on button press
        function showFunction() {
            exercisePopup.open();
            dialogueBox.visible = false;
        }
    }

/*-------------------------- Exercise Popup --------------------------------------*/

    Popup {

        id: exercisePopup
        modal: true
        closePolicy: Popup.NoAutoClose

        leftMargin: (parent.width - width) / 2;
        topMargin: (parent.height - height) / 2;
        width: parent.width
        height:parent.height

        background: Rectangle {
            color: "transparent"
        }

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
                            next = true;

                            dialogueBox.visible = true;
                            exercisePopup.close();
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
                            next = true;

                            dialogueBox.visible = true;
                            exercisePopup.close();
                        }
                    }
                }
            }

            DialogueBox {
                id: exerciseDialogue
                speakerName: ""
                dialogue: "Which one is correct?"
            }
        }

    }

/*-------------------------- Functions to Update Story --------------------------------------*/

    function handleText(text) {
        //TODO this will change later when the list is removed
        textOutput.append({"output": text});
    }

    function handleBgColor(color) {
        bgrd.color = color;
    }

    function handleScene(scene) {
        for(var i = 0; i < scene.length; i++) {
            if(scene[i].cmd === "text") {
                handleText(scene[i].text);
            } else if (scene[i].cmd === "bg") {
                handleBgColor(scene[i].color);
            }
        }
    }

}
