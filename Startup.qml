import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: startupWindow
    title: qsTr("Thymio Game Prototype")
    visible: true


    Material.primary: Material.theme === Material.Dark ? "#200032" : Material.background // "#a3d9db"
    Material.accent: Material.theme === Material.Dark ? "#9478aa" : "#B290CC" // "#59cbc8"


    //height and width not relevant for application window (at least on Android?). it fills out the whole screen
    //width: Screen.width
    //height: Screen.height

    width: 960
    height: 600


/*-------------------------- Loader --------------------------------------*/

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

    function showSim() {
        screenLoader.source = "GameSimulator.qml"
    }

    function showVPL() {
        screenLoader.source = "VplInterface.qml"
    }





}
