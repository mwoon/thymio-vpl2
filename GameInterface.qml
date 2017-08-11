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
    property var lastStory;

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
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "qrc:/its-game/assets/island_1.png"

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
        id: storyAdvancementArea
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

    }

    ListModel {
        id: textOutput
    }

    function updateStory() {
        if(!next) { return; }
        next = false;

        console.log("story advanced");

        if(storyStack.length > 0) {
            var part = storyStack.shift();

            if(part.type === "story" || part.type === "activity") {
                storyPartAction(part.content);
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
            var file;
            var type;
            if(newStorySequence.story0) {
                type = "story";
                file = "qrc:/its-game/story/" + newStorySequence.story0[0] + ".json";
                lastStory = newStorySequence.story0[0];
                console.log(lastStory);
            }

            if(newStorySequence.activity)  {
                type = "activity";
                file = "qrc:/its-game/exercises/" + newStorySequence.activity[0] + ".json";
                //file = "/exercises/" + "E04.04" + ".json";

            }


            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                    //print('HEADERS_RECEIVED')
                } else if(xhr.readyState === XMLHttpRequest.DONE) {
                    var a = JSON.parse(xhr.responseText.toString());

                    var storyList;
                    if(a[lastStory+"list"]) {
                        storyList = a[lastStory+"list"];
                    } else {
                        storyList = a["list"];
                    }

                    for(var i = 0; i < storyList.length; i++) {
                        part = {};
                        part.type = type;
                        part.content = storyList[i];
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

    function storyPartAction(part){
        if(part.cmd === "text") {
            handleText(part.text)
        } else if (part.cmd === "bg") {
            handleBgColor(part.color);
        } else if (part.cmd === "multi") {
            handleScene(part.scene);
        } else if (part.cmd === "ex") {
            handleEx(part);
        } else if (part.cmd === "bgImage") {
            handleBgImage(part);
        } else if (part.cmd === "dialogue") {
            handleDialogue(part.speaker, part.text);
        } else if (part.cmd === "feedback") {
            handleFeedback(part.options);
        }
    }

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
            storyAdvancementArea.enabled = true;
            next = true;
        }
    }

    function closeFeedbackWindow() {
        exercisePopup.close();
        storyAdvancementArea.enabled = true;
        toggleDialogueBox(true);
        next = true;
    }

    function handleText(text) {
        textOutput.append({"output": text});
    }

    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = qsTranslate("general", speaker);
        dialogueBox.dialogue = qsTranslate("general", text);

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
        backgroundImage.source = "qrc:/its-game" + scene.bgImage;
        if(scene.sizeX) {
            backgroundImage.x = (scene.sizeX - Screen.width + scene.x < 0 ) ? - scene.sizeX + Screen.width : scene.x;
        } else {
            backgroundImage.x = scene.x;
        }
    }

    function handleFeedback(options) {
        console.log("lastscore: " + lastScore);
        var nextStory;
        if(options.length === 2) {
            if(lastScore > 0.5) {
                nextStory = options[0];
            } else {
                nextStory = options[1];
            }
        } else if (options.length === 3) {
            if (lastScore >= 0.99) {
                nextStory = options[0];
            }else if(lastScore > 0.5) {
                nextStory = options[1];
            } else {
                nextStory = options[2];
            }
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
            storyPartAction(scene[i]);
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
                exLoader.setSource("Type4Exercise.qml", { "solution" : JSON.stringify(content.solution), "code" : JSON.stringify(content.code), "method": content.method, "storyList": content.list, "checkfor": content.checkfor, "description": content.description});
            } else if (content.method === "sim") {
                console.log("loading sim version of ex4")
                exLoader.setSource("Type4Exercise.qml", { "solution" : JSON.stringify(content.scene), "code" : JSON.stringify(content.code), "method": content.method, "storyList": content.list, "scene": content.scene, "special": content.special, "description": content.description});
            }
        } else if(content.type === "type5") {
            if(!content.method) {
                content.method = "fixed";
            }

            if(content.method === "fixed") {
                exLoader.setSource("Type5Exercise.qml", { "solution" : JSON.stringify(content.solution), "method": content.method, "storyList": content.list, "checkfor": content.checkfor, "description": content.description });
            } else if (content.method === "sim") {
                exLoader.setSource("Type5Exercise.qml", { "solution" : JSON.stringify(content.scene), "method": content.method, "storyList": content.list, "scene": content.scene, "special": content.special, "description": content.description });
            }
        }

        storyAdvancementArea.enabled = false;
        textOutput.append({"output": content.text});
        exercisePopup.open();
        toggleDialogueBox(false);
    }

}
