import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

ApplicationWindow {
    id: startupWindow
    title: qsTr("Thymio ITS game wip")
    visible: true

    //height and width not relevant for application window (at least on Android?). it fills out the whole screen
    width: Screen.width
    height: Screen.height

    StackView {
        id: stack
        initialItem: mainMenu
        anchors.fill: parent
    }

    Page {
        id: mainMenu

        Row {
            spacing: 10
            anchors.centerIn: parent
            Button {
                text: "VPL"
                onClicked: stack.push(vplWindow)
            }
            Button {
                text: "Game"
                onClicked: {
                    stack.push(gameWindow)
                    stote.advanceScript();
                }

            }
            Text {
                text: stack.depth
            }
        }

    }

    Component {
        id: vplWindow
        VplInterface {
            view: stack
        }
    }

    Component {
        id: gameWindow
        GameInterface {
            view: stack
        }
    }
}
