import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

    property StackView view
    property var storyStack: new Array()

    id: gameWindow
    title: qsTr("Thymio game WIP")
    visible: true

    ColumnLayout {

        anchors.fill: parent
        spacing: 10

        Button {
            id: returnButton
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("‹ return")
            onClicked: view.pop()
        }

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
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(1.0);
                    updateStory();
                }
            }

            Button {
                id: answer1
                visible: false
                text: qsTr("0.9")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.9);
                    updateStory();
                }
            }

            Button {
                id: answer2
                visible: false
                text: qsTr("0.8")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.8);
                    updateStory();
                }
            }

            Button {
                id: answer3
                visible: false
                text: qsTr("0.7")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.7);
                    updateStory();
                }
            }

            Button {
                id: answer4
                visible: false
                text: qsTr("0.6")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.6);
                    updateStory();
                }
            }

            Button {
                id: answer5
                visible: false
                text: qsTr("0.5")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.5);
                    updateStory();
                }
            }

            Button {
                id: answer6
                visible: false
                text: qsTr("0.4")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.4);
                    updateStory();
                }
            }

            Button {
                id: answer7
                visible: false
                text: qsTr("0.3")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.3);
                    updateStory();
                }
            }

            Button {
                id: answer8
                visible: false
                text: qsTr("0.2")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.2);
                    updateStory();
                }
            }

            Button {
                id: answer9
                visible: false
                text: qsTr("0.1")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.1);
                    updateStory();
                }
            }

            Button {
                id: answer10
                visible: false
                text: qsTr("0.0")
                onClicked: {
                    zpdes.updateZpd(0.0);
                    updateStory();
                }
            }

            Button {
                id: nextButton
                text: qsTr("Next")
                onClicked: {
                    updateStory();
                }
            }
        }
    }

    function updateStory() {
        if(storyStack.length > 0) {
            var part = storyStack.shift();
            textOutput.append({"output": part.content});
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
        }
    }

    Connections {
        target: zpdes
        onActivityGenerated: {
            var newStorySequence = JSON.parse(newText);
            var part;
            for(var i = 0; i < newStorySequence.story0.length; i++) {
                part = {};
                part.type = "story";
                part.content = newStorySequence.story0[i];
                storyStack.push(part);
            }

            part = {};
            part.type = "activity";
            part.content = newStorySequence.activity;
            storyStack.push(part);

            for(var i = 0; i < newStorySequence.story1.length; i++) {
                part = {};
                part.type = "story";
                part.content = newStorySequence.story1[i]
                storyStack.push(part);
            }

            lView.positionViewAtEnd()
        }
    }

    Connections {
        target: zpdes
        onRewarded: {
            textOutput.append({"output": newText})
            lView.positionViewAtEnd()
        }
    }


    //example list, remove later
    ListModel {
        id: textOutput
    }

}
