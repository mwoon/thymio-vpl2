import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Form to ask user how difficult they found the exercise to be appended to the log
/*!
  \brief DifficultyFeedback represents an interface to ask a user for their subjective feeling about an exercise.

  This interface can be displayed after every exercise by toggling a variable in \l GameInterface. It poses the question "How difficult was the task for you?" to the user. The 5 point scale goes from 1 to 5 but internally uses the list index which goes from 0 to 4.
*/
Page {

    id: type1Ex
    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    padding: 50


    ColumnLayout {
        anchors.fill: parent
        spacing: 25

        Text {
            Layout.alignment: Qt.AlignCenter
            text: qsTr("How difficult was the task for you?")
            font.pointSize: 24
        }

        RowLayout {
            spacing: 12
            Layout.alignment: Qt.AlignCenter


            Text {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Too easy")
                font.pointSize: 24
            }

            ListView {
                id: options

                //Layout.fillWidth: true
                Layout.preferredWidth: optionsList.count * 62
                Layout.preferredHeight: 50
                spacing: 12
                interactive: false
                orientation: ListView.Horizontal

                model: optionsList
                delegate: Button {
                        id: control
                        implicitWidth: 50
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
                            color: "#efff16"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            wrapMode: Text.WordWrap
                        }
                        onClicked:  {
                            options.currentIndex = index;
                            options.model[callback]();
                        }
                        highlighted: control.ListView.isCurrentItem
                    }

            }
            ListModel {
                id: optionsList

                ListElement {
                    name: "1"
                    callback: "respond"
                }
                ListElement {
                    name: "2"
                    callback: "respond"
                }
                ListElement {
                    name: "3"
                    callback: "respond"
                }
                ListElement {
                    name: "4"
                    callback: "respond"
                }
                ListElement {
                    name: "5"
                    callback: "respond"
                }

                function respond() {

                    var answer= options.currentIndex;

                    stote.appendToLog("difficulty: " + answer);
                    gameWindow.closeFeedbackWindow();
                }

            }

            Text {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Too hard")
                font.pointSize: 24
            }
        }

    }

}

