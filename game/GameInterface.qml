import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

/*!
  \brief GameInterface contains the logic of the main game.

  GameInterface contains the logic of the main game. It reads story and exercise files and shows their contents to the user in the blocks defined in the files.
*/
Page {

    id: gameWindow

    /*!
      Used to control if the game should ask the player how difficult they found an exercise right after it it solved.

      Set to true to enable asking for feedback.

      By default it is false.
    */
    property bool askForFeedback: false;

    /*!
      Stores the next actions to be taken by the game.

      All the contents of a file is pushed to this stack when a story or exercise file is read.
    */
    property var storyStack: new Array()

    /*!
      The game proceeds to the next action on the stack when \c next is set to true.

      For example, when a user clicks on the screen during a story section or when a user answers an exercise question.
    */
    property bool next: false
    onNextChanged: {
        if(next) {
            updateStory();
        }
    }
    /*!
      Stores the score of the last exercise.

      Used to decide what text to show after an exercise.
    */
    property var lastScore: 0;

    /*!
      Stores the last story sequence loaded.

      Used when loading exercises to decide which version of the exercise to load.
    */
    property var lastStory;

    title: qsTr("Thymio Game Prototype")
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

    /*!
      If \c storyStack is not empty the next section is displayed otherwise a new section is requested from \l StoryTeller.
    */
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

    /*!
      Is a temporary object used to instantiate the QtObject holding the next story or exercise Component.
    */
    property var storyObject;

    Connections {
        target: stote
        onSegmentGenerated: {

            var newStorySequence = JSON.parse(newText);
            var file;

            if(newStorySequence.story0) {
                file = "qrc:/its-game/story/" + newStorySequence.story0[0] + ".qml";
                lastStory = newStorySequence.story0[0];
                console.log(lastStory);
            }

            if(newStorySequence.activity)  {
                file = "qrc:/its-game/exercises/" + newStorySequence.activity[0] + ".qml";
                //file = "exercises/" + "E08.03" + ".qml";

            }

            if(file === "qrc:/its-game/story/the_end.qml") {
                gameMenu.showHome();
                return;
            }

            console.log(file);
            storyObject = Qt.createComponent(file);
            if (storyObject.status === Component.Ready) {
                    finishStoryObjectCreation();
            } else {
                    storyObject.statusChanged.connect(finishStoryObjectCreation);
            }

        }
    }

    /*!
      This function is called as soon as \c storyObject was properly instantiated.

      It processes the story or exercise and adds their parts to the \c storyStack.
    */
    function finishStoryObjectCreation() {
        if (storyObject.status === Component.Ready) {
            var a = storyObject.createObject(null);

            var storyList;
            if(a.scenario[lastStory+"list"]) {
                storyList = a.scenario[lastStory+"list"];
            } else {
                storyList = a.scenario["list"];
            }

            var part;
            var type = "story";
            for(var i = 0; i < storyList.length; i++) {
                part = {};
                part.type = type;
                part.content = storyList[i];
                storyStack.push(part);
            }
            next = true;
        } else if (component.status === Component.Error) {
            // Error Handling
            console.log("Error loading component:", component.errorString());
        }
    }

    ListModel {
        id: dialogueLog
    }

    Component.onCompleted: {
        next = true;
    }


/*-------------------------- Title Bar & Drawer Menu --------------------------------------*/

    //header: gameTB

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
        /*
        ListElement {
            title: "Toggle log";
            callback: "toggleLog";
        }
        */
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
            storyAdvancementArea.enabled = !storyLogLayout.visible;
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

    /*!
      This function checks what kind of action the next part represents and forwards it to the corresponding function to handle it.

      These functions are one of:
      \list
        \li \l handleText,
        \li \l handleBgColor,
        \li \l handleScene,
        \li \l handleEx,
        \li \l handleBgImage,
        \li \l handleDialogue,
        \li \l handleFeedback
      \endlist
    */
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

    /*!
      Toggles the visibility of the DialogueBox

      It is used to hide the DialogueBox during exercises and to show it again afterwards.
    */
    function toggleDialogueBox(truefalse) {
        dialogueBox.visible = truefalse;
    }

    /*!
      This function is used to close an exercise popup and continue to the next action.
    */
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

    /*!
      This function closes a DifficultyFeedback popup and ensures that the story advances next.
    */
    function closeFeedbackWindow() {
        exercisePopup.close();
        storyAdvancementArea.enabled = true;
        toggleDialogueBox(true);
        next = true;
    }

    /*!
      This function is used to append data to the log.

      It can be used to track what parts of a story or exercise have already been shown to the user.
    */
    function handleText(text) {
        textOutput.append({"output": text});
    }

    /*!
      This function sets the DialogueBox properties \c speakerName and \c dialogue.

      The new texts are immefiately shown to the player.
    */
    function handleDialogue(speaker, text) {
        dialogueBox.speakerName = speaker;
        dialogueBox.dialogue = text;

        dialogueLog.insert(0, {"speaker" : speaker, "conversation" : text});
    }

    /*!
      This function sets the background color of \l GameInterface.

      This function was mostly used for early testing. As there is usually a background image, the background color is not visible under normal circumstances.
    */
    function handleBgColor(color) {
        //bgrd.color = color;
    }

    /*!
      This function is used to set the background image. Simple animations can also be defined when changing the background.
    */
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
            backgroundImage.x = (scene.sizeX - gameWindow.width + scene.x < 0 ) ? - scene.sizeX + gameWindow.width : scene.x;
        } else {
            backgroundImage.x = scene.x;
        }
    }

    /*!
      This function is used to display story content that is dependent on the outcome of the previous exercise.
    */
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

    /*!
      This function is used to display story content when a few actions should be taken simultaneously.

      For example, the background and dialogue could change at the same time or the new dialogue should additionally be logged.
    */
    function handleScene(scene) {
        for(var i = 0; i < scene.length; i++) {
            storyPartAction(scene[i]);
        }
    }

    /*!
      This function handles the loading of exercises.

      Depending on the type of exercise, different parameters are passed to the corresponding exercise components.
    */
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
