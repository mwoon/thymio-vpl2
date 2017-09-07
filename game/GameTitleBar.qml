import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

/*!
  GameTitleBar defines the symbol and logic of the menu in \l GameInterface. It displays a hamburger icon in a circle. When clicked on, it opens a drawer on the left with the menu options.
*/
Rectangle {

    width: 50
    height: 50
    radius: 25

    /*!
      This signal notifies listeners that the icon has been clicked on.
    */
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


