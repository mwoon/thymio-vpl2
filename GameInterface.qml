import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

    property StackView view
    property var storyStack: new Array()
    property bool next: false //signals when a new segment is ready to be read
    onNextChanged: updateStory();


    id: gameWindow
    title: qsTr("Thymio game WIP")
    visible: true

    Rectangle {
        id: bgrd
        color: "steelblue"
        anchors.fill: parent
    }

    ColumnLayout {

        anchors.fill: parent
        spacing: 10

        RowLayout {

            Button {
                id: returnButton
                text: qsTr("‹ return")
                onClicked: {
                    startupWindow.showHome();
                    stote.resetScript();
                }
            }

            Button {
                id: graphButton
                text: qsTr("ZPD")
                onClicked: gView.visible = !gView.visible
            }

            Button {
                id: logsButton
                text: qsTr("logs")
                onClicked: view.pop()
            }

        }

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

            ListView {
                id:gView
                clip: true
                model: graphLog
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
                }
            }

            Button {
                id: answer1
                visible: false
                text: qsTr("0.9")
                onClicked: {
                    stote.completeExercise(0.9);
                }
            }

            Button {
                id: answer2
                visible: false
                text: qsTr("0.8")
                onClicked: {
                    stote.completeExercise(0.8);
                }
            }

            Button {
                id: answer3
                visible: false
                text: qsTr("0.7")
                onClicked: {
                    stote.completeExercise(0.7);
                }
            }

            Button {
                id: answer4
                visible: false
                text: qsTr("0.6")
                onClicked: {
                    stote.completeExercise(0.6);
                }
            }

            Button {
                id: answer5
                visible: false
                text: qsTr("0.5")
                onClicked: {
                    stote.completeExercise(0.5);
                }
            }

            Button {
                id: answer6
                visible: false
                text: qsTr("0.4")
                onClicked: {
                    stote.completeExercise(0.4);
                }
            }

            Button {
                id: answer7
                visible: false
                text: qsTr("0.3")
                onClicked: {
                    stote.completeExercise(0.3);
                }
            }

            Button {
                id: answer8
                visible: false
                text: qsTr("0.2")
                onClicked: {
                    stote.completeExercise(0.2);
                }
            }

            Button {
                id: answer9
                visible: false
                text: qsTr("0.1")
                onClicked: {
                    stote.completeExercise(0.1);
                }
            }

            Button {
                id: answer10
                visible: false
                text: qsTr("0.0")
                onClicked: {
                    stote.completeExercise(0.0);
                }
            }

            Button {
                id: nextButton
                text: qsTr("Next")
                onClicked: {
                    next = true;
                    updateStory();
                }
            }
        }
    }

    function updateStory() {
        if(!next) { return; }
        next = false;

        if(storyStack.length > 0) {
            next = false;
            var part = storyStack.shift();
            if(part.type === "story") {
                if(part.content.cmd === "text") {
                    textOutput.append({"output": part.content.text});
                } else if (part.content.cmd === "bg") {
                    bgrd.color = part.content.color;
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
            //updateStory();
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

    Connections {
        target: zpdes
        onRewarded: {
            graphLog.append({"output": newText})
            lView.positionViewAtEnd()
        }
    }



    ListModel {
        id: textOutput
    }

    ListModel {
        id: graphLog
    }

    Component.onCompleted: {
        next = true;
        updateStory();
    }

}
