import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Item {


    Image {
        anchors.fill: parent
        source: "/assets/clouds.png"
        z:1
    }


    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#0c0e57";
            }
            GradientStop {
                position: 0.66;
                color: "#17abbc";
            }
            GradientStop {
                position: 1.00;
                color: "#f7f8d1";
            }
        }
    }



    /*taken from thymio adventure main screen: https://github.com/aseba-community/thymio-adventure/blob/master/Map.qml 13.06.2017*/
    ListView {
            id: menu

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 130

            width: 180
            spacing: 12

            model: menuList
            delegate: Row {
                id: row
                spacing: 8
                padding: 0
                Button {
                    id: control
                    implicitWidth: 160
                    text: name
                    background: Rectangle {
                        color: control.highlighted ? "#30efff16" : "#30ffffff"
                        border.color: control.highlighted ? "#a0efff16" : "#50ffffff"
                        radius: 5
                    }
                    contentItem: Text {
                        text: control.text
                        font: control.font
                        color: control.highlighted ? "#efff16" : Material.primaryTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    onClicked:  {
                        menu.currentIndex = index;
                        menu.model[callback]();
                    }
                    highlighted: row.ListView.isCurrentItem
                }
            }
    }

    ListModel {
        id: menuList

        ListElement {
            name: "Game";
            callback: "showGame";
        }
        ListElement {
            name: "VPL";
            callback: "showVPL";
        }
        ListElement {
            name: "Simulator";
            callback: "showSim";
        }

        function showGame(){
            startupWindow.showGame();
        }
        function showVPL(){
            startupWindow.showVPL();
        }
        function showSim(){
            startupWindow.showSim();
        }
    }

}
