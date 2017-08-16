import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Rectangle {

    width: 50
    height: 50
    radius: 25

    signal openDrawer()

    color: "#40ffffff"

    ToolButton {
        focusPolicy: Qt.NoFocus
        Image {
            anchors.centerIn: parent
            source: Material.theme === Material.Dark ? "qrc:/thymio-vpl2/icons/ic_menu_white_24px.svg" : "qrc:/thymio-vpl2/icons/ic_menu_black_24px.svg"
        }
        onClicked: openDrawer()
    }

}



/*
ToolBar {

    signal openDrawer()

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        spacing: 1



        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                anchors.centerIn: parent
                source: Material.theme === Material.Dark ? "qrc:/thymio-vpl2/icons/ic_menu_white_24px.svg" : "qrc:/thymio-vpl2/icons/ic_menu_black_24px.svg"
            }
            onClicked: openDrawer()
        }

        Text {
            text: "Game"
        }

        Item {
            width: 16
        }
    }

}
*/
