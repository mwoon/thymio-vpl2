import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0


/*!
  MenuDrawer defines a standard menu's layout.

  It is taken directly from the menu in Thymio VPL 2.
*/
Drawer {
    id: drawer
    edge: Qt.LeftEdge
    position: 0
    width: 300
    height: startupWindow.height

    /*!
      This property encapsulates a listview model. It can be filled with the items to be displayed in the menu.

      Each ListElement should contain at a minimum \c title and \c callback to provide the menu item with a name and a function to be called when it is clicked on.
    */
    property alias drawerModel : listView.model

    contentItem: Pane {
        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent

            model: null

            delegate: ItemDelegate {
                width: parent.width - (parent.width / 8)
                contentItem: Row {
                    spacing: 24
                    Text {
                        text: qsTr(model.title);
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: Material.primaryTextColor
                        opacity: enabled ? 1.0 : 0.5
                        visible: ((model.title.substring(0, 4) !== "dev:") || (Qt.application.arguments.indexOf("--developer") !== -1))
                    }
                }
                onClicked: {
                    ListView.view.model[callback]();
                    drawer.close()
                }
            }
        }
    }
}
