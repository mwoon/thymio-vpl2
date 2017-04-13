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
                text: qsTr("1.0")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(1.0);
                }
            }

            Button {
                text: qsTr("0.9")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.9);
                }
            }

            Button {
                text: qsTr("0.8")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.8);
                }
            }

            Button {
                text: qsTr("0.7")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.7);
                }
            }

            Button {
                text: qsTr("0.6")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.6);
                }
            }

            Button {
                text: qsTr("0.5")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.5);
                }
            }

            Button {
                text: qsTr("0.4")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.4);
                }
            }

            Button {
                text: qsTr("0.3")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.3);
                }
            }

            Button {
                text: qsTr("0.2")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.2);
                }
            }

            Button {
                text: qsTr("0.1")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.1);
                }
            }

            Button {
                text: qsTr("0.0")
                onClicked: {
                    zpdes.updateZpd(0.0);
                }
            }

            Button {
                text: qsTr("Next")
                onClicked: {
                    if(storyStack.length > 0) {
                        textOutput.append({"output": storyStack.shift()})
                        lView.positionViewAtEnd()
                    }
                }
            }
        }
    }

    Connections {
        target: zpdes
        onActivityGenerated: {
            var newStorySequence = JSON.parse(newText);
            for(var i = 0; i < newStorySequence.story0.length; i++) {
                storyStack.push(newStorySequence.story0[i]);
            }

            storyStack.push(newStorySequence.activity);

            for(var i = 0; i < newStorySequence.story1.length; i++) {
                storyStack.push(newStorySequence.story1[i]);
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
