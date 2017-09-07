import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.0

/*!
  \brief Startup controls the pages that are shown. Its switches between the four main screens.

  Startup uses a Loader to switch between the four main screens: HomeScreen, GameInterface, VPLInterface and GameSimulator.
*/

ApplicationWindow {
    id: startupWindow
    title: qsTr("Thymio Game Prototype")
    visible: true


    Material.primary: Material.theme === Material.Dark ? "#200032" : Material.background // "#a3d9db"
    Material.accent: Material.theme === Material.Dark ? "#9478aa" : "#B290CC" // "#59cbc8"


    //height and width not relevant for application window on Android as it fills out the whole screen
    width: 960
    height: 600


/*-------------------------- Loader --------------------------------------*/

    Loader{
        id: screenLoader
        source: "HomeScreen.qml"
        anchors.fill: parent

    }

    /*!
      Changes screenLoader's source to \l HomeScreen.
    */
    function showHome() {
        screenLoader.source = "HomeScreen.qml"
    }

    /*!
      Changes screenLoader's source to \l GameInterface.
    */
    function showGame() {
        screenLoader.source = "GameInterface.qml"
    }

    /*!
      Changes screenLoader's source to \l GameSimulator.
    */
    function showSim() {
        screenLoader.source = "GameSimulator.qml"
    }

    /*!
      Changes screenLoader's source to \l VplInterface.
    */
    function showVPL() {
        screenLoader.source = "VplInterface.qml"
    }





}
