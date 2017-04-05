import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

    property StackView view

    id: gameWindow
    title: qsTr("Thymio game WIP")
    visible: true

    signal advanced(string text)

    Column {

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
            clip: true //apparently this can affect performance
            model: textOutput
            height: parent.height - returnButton.height - 20 - answersList.height
            width: parent.width
            delegate: Row {
                Text {
                    font.pointSize: 24
                    text: "> " + output
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                }
            }
        }

        Row {

            id: answersList
            spacing: 20

            Button {
                text: qsTr("yes")
                onClicked: {
                    //gameWindow.advanced(text)
                    zpdes.updateZpd(0.5);
                }
            }

            Button {
                text: qsTr("no")
                onClicked: {
                    gameWindow.advanced(text)
                }
            }
        }
    }

    onAdvanced: {
        textOutput.append({"output": text})
    }

    Connections {
        target: zpdes
        onActivityGenerated: {
            textOutput.append({"output": newText})
        }
    }

    //example list, remove later
    ListModel {
        id: textOutput

        ListElement {
            output: "Hello World"
        }
    }

}
