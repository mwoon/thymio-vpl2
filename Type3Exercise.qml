import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "qrc:/thymio-vpl2"

//Format: show 2 programs, player has to choose the correct answer for describing what the difference is

Page {

    id: type3Ex
    anchors.fill: parent

    background : Rectangle {
        radius: 20
        color: "#30ffffff"
        border.color: "#50ffffff"
        border.width: 3
    }

    //has to be an entry in scoreList for every entry in answerlist
    property var answerList;
    property var scoreList;

    //the program to display
    property var code1;
    property var code2;


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

    RowLayout {
        anchors.fill: parent
        spacing: 25

        ColumnLayout {
            anchors.fill: parent
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Editor {
                id: vplEditorTop
                //property alias fillHeight: Layout.fillHeight
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: parent.width  / 5
                enabled: false
                actionsVisible: false
                eventsVisible: false
                function fillHeight() {
                    vplEditorTop.Layout.fillHeight = true;
                }
                Rectangle {
                    z:-1
                    anchors.fill: parent
                    color: "#30ffffff"
                    border.color: "#50ffffff"
                    radius: 5
                }
            }

            Editor {
                id: vplEditorBot
                //property alias fillHeight: Layout.fillHeight
                Layout.preferredWidth: parent.width * 2 / 5
                Layout.preferredHeight: parent.width  / 5
                enabled: false
                actionsVisible: false
                eventsVisible: false

                function fillHeight() {
                    vplEditorBot.Layout.fillHeight = true;
                }

                Rectangle {
                    z:-1
                    anchors.fill: parent
                    color: "#30ffffff"
                    border.color: "#50ffffff"
                    radius: 5
                }
            }
        }


        ColumnLayout {
            spacing: 12
            Layout.alignment: Qt.AlignCenter

            Text {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("What is the difference between these two?")
                font.pointSize: 24
            }

            ListView {
                id: options

                //Layout.fillHeight: true
                Layout.preferredWidth: Screen.width / 2
                Layout.preferredHeight: optionsList.count * 100
                spacing: 12


                model: optionsList
                delegate: Row {
                    id: row
                    spacing: 8

                    Button {
                        id: control
                        implicitWidth: Screen.width / 2
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
                            color:  "#efff16"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            wrapMode: Text.WordWrap
                        }
                        onClicked:  {
                            options.currentIndex = index;
                            options.model[callback]();
                        }
                        highlighted: row.ListView.isCurrentItem
                    }
                }

            }
            ListModel {
                id: optionsList

                function completeExercise() {

                    var score = scoreList[options.currentIndex];

                    stote.completeExercise(score);
                    gameWindow.next = true;

                    gameWindow.toggleDialogueBox(true);
                    gameWindow.closeExerciseWindow();
                }

            }

        }

    }

    Popup {

        id: vplPopup
        modal: true
        closePolicy: Popup.NoAutoClose

        width: parent.width
        height:parent.height

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
                                    "callback": "closeVplPopup3",
                                    "whiteIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg",
                                    "blackIcon": "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg"
                                });
            }
        }
    }

    function closePopup() {
        vplPopup.close();
    }

    Component.onCompleted: {
        for(var i = 0; i < answerList.length; i++) {
            optionsList.append({"name": answerList[i], "callback": "completeExercise"})
        }
        var parsed1 = JSON.parse(code1);
        var parsed2 = JSON.parse(code2);
        if(parsed1.scene.length > parsed2.scene.length) {
            vplEditorTop.fillHeight();
        } else if (parsed2.scene.length > parsed1.scene.length) {
            vplEditorBot.fillHeight();
        } else {
            vplEditorBot.fillHeight();
            vplEditorTop.fillHeight();
        }

        vplEditorTop.loadCode(code1);
        vplEditorBot.loadCode(code2);
    }


}
