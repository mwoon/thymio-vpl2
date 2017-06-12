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

    Loader{
        id: screenLoader
        source: "HomeScreen.qml"
        anchors.fill: parent

    }


    function showHome() {
        screenLoader.source = "HomeScreen.qml"
    }

    function showGame() {
        screenLoader.source = "GameInterface.qml"
    }

    function showVPL() {
        screenLoader.source = "VplInterface.qml"
    }
}
