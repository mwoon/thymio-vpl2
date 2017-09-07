import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

/*!
  SimulatorTitleBar defines the layout of the menu icon in the student simulator.

  As it was not essential to the main functionality of the game, its look was left in an early stage.
*/
ToolBar {

    /*!
      This signal notifies listeners that the icon has been clicked on.
    */
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
            text: "Student Simulator"
        }

        Item {
            width: 16
        }
    }

}
