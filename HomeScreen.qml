import QtQuick 2.6
import QtQuick.Controls 2.0

Item {

    Row {
        spacing: 10
        anchors.centerIn: parent
        Button {
            text: "VPL"
            onClicked: {
                startupWindow.showVPL();
            }
        }
        Button {
            text: "Game"
            onClicked: {
                startupWindow.showGame();
            }

        }
        Button {
            text: "Sim"
            onClicked: {
                startupWindow.showSim();
            }

        }
    }
}
