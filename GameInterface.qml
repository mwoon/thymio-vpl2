import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

Page {

    id: gameWindow

    property bool askForFeedback: false;
    property StackView view
    property var storyStack: new Array()
    property bool next: false //signals when a new segment is ready to be read
    onNextChanged: {
        if(next) {
            updateStory();
        }
    }

    //used to decide what text to show after an exercise
    property var lastScore: 0;

    title: qsTr("Thymio game WIP")
    visible: true

    Rectangle {
        //Box to hold the background
        id: bgrd
        //color: "steelblue"
        anchors.fill: parent

        Image {
            id:backgroundImage
            //x: -1000
            //anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "/assets/island_1.png"

            Behavior on x {
                NumberAnimation {
                    id:bgrdAnimation
                    duration: 500
                    easing.type: Easing.OutQuad
                }
            }
        }
    }

    Rectangle {
        id: darkScreen
        visible: false
        anchors.fill: parent
        color: "#50000000"
    }

    DialogueBox {
        id: dialogueBox


        anchors.top: parent.top
        anchors.topMargin: 75
    }

    MouseArea {
        anchors.fill: parent
        z: 2

        onClicked: {
            if(!storyLogLayout.visible) {
                next = true;
            } else {
                gameMenu.toggleStoryLog();
            }
        }
    }

    ColumnLayout {

        id: storyLogLayout

        anchors.fill: parent
        spacing: 10
        visible: false
        anchors.topMargin: 75
        anchors.leftMargin: 25
        anchors.rightMargin: 25

        ListView {
            id: storyLogView
            clip: true //apparently this can affect performance
            spacing: 10
            model: dialogueLog
            Layout.fillHeight: true
            Layout.fillWidth: true
            delegate: Rectangle {
                height: speakerText.height
                width: parent.width
                color: "#80ffffff"
                border.color: "#f0ffffff"
                border.width: 3
                radius: 20
                Text {
                    id: speakerText
                    font.pointSize: 24
                    text: "> " + ((speaker === "") ? "" : speaker + "\n   " ) + conversation
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    padding: 5
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        }
    }

    ColumnLayout {

        id: logLayout

        anchors.fill: parent
        spacing: 10
        visible: false

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
                visible: false
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

            if(part.type === "story" || part.type === "activity") {
                if(part.content.cmd === "text") {
                    handleText(part.content.text)
                } else if (part.content.cmd === "bg") {
                    handleBgColor(part.content.color);
                } else if (part.content.cmd === "multi") {
                    handleScene(part.content.scene);
                } else if (part.content.cmd === "ex") {
                    handleEx(part.content);
                } else if (part.content.cmd === "bgImage") {
                    handleBgImage(part.content);
                } else if (part.content.cmd === "dialogue") {
                    handleDialogue(part.content.speaker, part.content.text);
                } else if (part.content.cmd === "feedback") {
                    handleFeedback(part.content.options);
                }
            }

            /*
            if(part.type === "story") {
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
                //textOutput.append({"output": part.content});
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
            */
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
            var file;
            var type;
            if(newStorySequence.story0) {
                type = "story";
                file = "thymio-vpl2/story/" + newStorySequence.story0[0] + ".json";
            }

            if(newStorySequence.activity)  {
                type = "activity";
                //file = "/exercises/" + newStorySequence.activity[0] + ".json";
                file = "/exercises/" + "E06.01" + ".json";

                /*
                for(var i = 0; i < newStorySequence.activity.length; i++) {
                    part = {};
                    part.type = "activity";
                    part.content = newStorySequence.activity[i];
                    storyStack.push(part);
                }
                next = true;*/
            }


            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                    print('HEADERS_RECEIVED')
                } else if(xhr.readyState === XMLHttpRequest.DONE) {
                    print('DONE');
                    //console.log(xhr.status);
                    //console.log(xhr.responseText.toString());
                    var a = JSON.parse(xhr.responseText.toString());
                    for(var i = 0; i < a.list.length; i++) {
                        part = {};
                        part.type = type;
                        part.content = a.list[i];
                        storyStack.push(part);
                    }
                    next = true;
                }
            }

            console.log(file);
            xhr.open("GET", file);
            xhr.send();
        }
    }



    ListModel {
        id: textOutput
    }

    ListModel {
        id: dialogueLog
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
        z: 3
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
            title: "Toggle log";
            callback: "toggleLog";
        }

        ListElement {
            title: "Story Log";
            callback: "toggleStoryLog";
        }

        /*
        ListElement {
            title: "Test Functions";
            callback: "showFunction";
        }
        */

        function showHome() {
            startupWindow.showHome();
            stote.resetScript();
        }

        function toggleLog() {
            logLayout.visible = !logLayout.visible;
        }

        function toggleStoryLog() {
            storyLogLayout.visible = !storyLogLayout.visible;
            dialogueBox.visible = !storyLogLayout.visible;
            darkScreen.visible = storyLogLayout.visible;
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

        Loader {
            id: exLoader
            anchors.fill: parent
            source: ""
        }




    }

/*-------------------------- Functions to Update Story --------------------------------------*/

    function toggleDialogueBox(truefalse) {
        dialogueBox.visible = truefalse;
    }

    function closeExerciseWindow(score) {
        exercisePopup.close();
        lastScore = score;

        if(askForFeedback) {
            exercisePopup.open();
            toggleDialogueBox(false);
            exLoader.setSource("DifficultyFeedback.qml", { });
        } else {
            next = true;
        }
    }

    function closeFeedbackWindow() {
        exercisePopup.close();
        toggleDialogueBox(true);
        next = true;
    }

    function handleText(text) {
        //TODO this will change later when the list is removed
        textOutput.append({"output": text});
    }

    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = speaker;
        dialogueBox.dialogue = text;

        dialogueLog.insert(0, {"speaker" : speaker, "conversation" : text});
    }

    function handleBgColor(color) {
        //bgrd.color = color;
    }

    function handleBgImage(scene) {
        if(scene.anim) {
            bgrdAnimation.duration = scene.duration;
            if(scene.easing) {
                if(scene.easing === "outback") {
                    bgrdAnimation.easing.type = Easing.OutBack;
                } else if(scene.easing === "outquad") {
                    bgrdAnimation.easing.type = Easing.OutQuad;
                }
            }

        }
        backgroundImage.source = scene.bgImage;
        if(scene.sizeX) {
            backgroundImage.x = (scene.sizeX - Screen.width + scene.x < 0 ) ? - scene.sizeX + Screen.width : scene.x;
        } else {
            backgroundImage.x = scene.x;
        }
    }

    function handleFeedback(options) {
        console.log("lastscore: " + lastScore);
        var nextStory;
        if(lastScore > 0.5) {
            nextStory = options[0];
        } else {
            nextStory = options[1];
        }

        var part;

        //add them to the front of the story stack in reverse order (other stuff is already on the stack)
        //essentially replacing the options that was on the stack before with its contents
        for(var i = nextStory.length - 1; i >= 0; i--) {
            part = {};
            part.type = "story";
            part.content = nextStory[i];
            storyStack.unshift(part);
        }
        next = true;
    }

    function handleScene(scene) {
        for(var i = 0; i < scene.length; i++) {
            if(scene[i].cmd === "text") {
                handleText(scene[i].text);
            } else if (scene[i].cmd === "bg") {
                handleBgColor(scene[i].color);
            } else if (scene[i].cmd === "bgImage") {
                handleBgImage(scene[i]);
            } else if (scene[i].cmd === "ex") {
                handleEx(scene[i]);
            } else if (scene[i].cmd === "dialogue") {
                handleDialogue(scene[i].speaker, scene[i].text);
            } else if (scene[i].cmd === "feedback") {
                handleFeedback(scene[i].options);
            }
        }
    }

    function handleEx(content) {
        if(content.type === "type1") {
            exLoader.setSource("Type1Exercise.qml", { "answerList": content.answerList, "scoreList": content.scoreList, "storyList": content.list, "code" : JSON.stringify(content.code) });
        } else if (content.type === "type2") {
            exLoader.setSource("Type2Exercise.qml", {"answerList": content.answerList, "scoreList": content.scoreList, "storyList": content.list, "question": content.description});
        } else if (content.type === "type3") {
            exLoader.setSource("Type3Exercise.qml", { "answerList": content.answerList, "scoreList": content.scoreList, "storyList": content.list, "code1" : JSON.stringify(content.code1), "code2" : JSON.stringify(content.code2)  });
        } else if(content.type === "type4") {
            if(!content.method) {
                content.method = "fixed";
            }

            if(content.method === "fixed") {
                exLoader.setSource("Type4Exercise.qml", { "solution" : JSON.stringify(content.solution), "code" : JSON.stringify(content.code), "method": content.method, "storyList": content.list, "checkfor": content.checkfor});
            } else if (content.method === "sim") {
                console.log("loading sim version of ex4")
                exLoader.setSource("Type4Exercise.qml", { "solution" : JSON.stringify(content.scene), "code" : JSON.stringify(content.code), "method": content.method, "storyList": content.list, "scene": content.scene, "special": content.special});
            }
        } else if(content.type === "type5") {
            if(!content.method) {
                content.method = "fixed";
            }

            if(content.method === "fixed") {
                exLoader.setSource("Type5Exercise.qml", { "solution" : JSON.stringify(content.solution), "method": content.method, "storyList": content.list, "checkfor": content.checkfor });
            } else if (content.method === "sim") {
                exLoader.setSource("Type5Exercise.qml", { "solution" : JSON.stringify(content.scene), "method": content.method, "storyList": content.list, "scene": content.scene, "special": content.special });
            }
        }

        textOutput.append({"output": content.text});
        exercisePopup.open();
        toggleDialogueBox(false);
    }

}
