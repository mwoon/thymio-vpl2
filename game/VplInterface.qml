import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQml 2.2
import "qrc:/thymio-vpl2"
/*!
  \brief VplInterface represents the vpl screen.

  VplInterface is an adapted version of the VPL. The adaptations from the original vpl center around menu option changes. All functionality provided through components remains the same and should not break if the components were to be updated.
*/
Page {
    id: window
    title: qsTr("Thymio VPL Mobile Preview")
    visible: true
    width: 960
    height: 600

    Material.primary: Material.theme === Material.Dark ? "#200032" : Material.background // "#a3d9db"
    /*!
      Property used by the VPL. Is not used by the game.
    */
    property string linkRichTextStyle: Material.theme === Material.Dark ?
        "<style>a:link { text-decoration: none; color: \"#90CAF9\" }</style>" :
        "<style>a:link { text-decoration: none; color: \"#3F51B5\" }</style>"
    Material.accent: Material.theme === Material.Dark ? "#9478aa" : "#B290CC" // "#59cbc8"
    Material.background: Material.theme === Material.Dark ? "#ff44285a" : "white"

    header: vplEditor.blockEditorVisible ? blockEditorTitleBar : vplEditorTitleBar

    /*!
      Default save name for code created in VPL.

      Is the same in the original VPL and is not used in any special way by the game.
    */
    readonly property string autosaveName: qsTr("autosave");

    /*!
       Represents the model for the menu items in the top left corner.

       As certain exercise types require different options in the menu, VplInterface offers this property so the menu can be adapted easily from outside.
    */
    property alias menu: menuItems

    /*!
      Represents the vplEditor.

      The editor was made accessible from outside to accomodate exercises of type 1 2 and 3 which use the editor without the event and action block lists.

      It is also used to force the editor to save its code before an exercise is simulated if some code has to be injected before a sensible simulation can be conducted.

    */
    property alias editor: vplEditor

    /*!
      This property stores a VPL code in string format.

      It is used to remember the given code of an exercise of type 4. This allows the exercise to be reset from the menu.
    */
    property var code;

    /*!
      The Thymio object.

      It is made accessible from outside to allow exercises of type 4 and 5 to start simulations.
    */
    property var thymio: thymio

    EditorTitleBar {
        id: vplEditorTitleBar
        visible: !vplEditor.blockEditorVisible
        vplEditor: vplEditor
        isThymioConnected: !!thymio.node
        onOpenDrawer: drawer.open()
        onOpenDashelTargetSelector: dashelTargetSelector.open()

        Button {
            id:uploadButton


            anchors.right: parent.right
            anchors.top: parent.top
            width: 200
            height: 50
            z: 5;

            Row {
                anchors.centerIn: parent
                spacing: 24
                HDPIImage {
                    property var whiteIcon: "qrc:/thymio-vpl2/icons/ic_open_white_24px.svg";
                    property var blackIcon: "qrc:/thymio-vpl2/icons/ic_open_black_24px.svg";
                    source: Material.theme === Material.Dark ? whiteIcon : blackIcon
                    width: 24
                    height: 24
                    opacity: enabled ? 1.0 : 0.5
                }
                Text {
                    text: qsTr("Send to Ada");
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: Material.primaryTextColor
                    opacity: enabled ? 1.0 : 0.5
                }
            }
            onClicked: {
                action();
            }
            property var action
            visible: false
        }

        Button {
            id: questionButton


            anchors.right: uploadButton.left
            anchors.top: parent.top
            width: 200
            height: 50
            z: 5;

            Row {
                anchors.centerIn: parent
                spacing: 24
                HDPIImage {
                    property var whiteIcon: "qrc:/thymio-vpl2/icons/ic_info_white_24px.svg";
                    property var blackIcon: "qrc:/thymio-vpl2/icons/ic_info_black_24px.svg";
                    source: Material.theme === Material.Dark ? whiteIcon : blackIcon
                    width: 24
                    height: 24
                    opacity: enabled ? 1.0 : 0.5
                }
                Text {
                    text: qsTr("Ask Ada what to do");
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: Material.primaryTextColor
                    opacity: enabled ? 1.0 : 0.5
                }
            }
            onClicked: {
                action();
            }
            property var action
            visible: false
        }
    }

    BlockEditorTitleBar {
        id: blockEditorTitleBar
        visible: vplEditor.blockEditorVisible
        onCancel: vplEditor.blockEditor.close()
        onAccept: vplEditor.blockEditor.accept()
    }

    Editor {
        id: vplEditor
        anchors.fill: parent

//		Text {
//			text: "developer preview pre-alpha, no feature or design is final"
//			anchors.left: parent.left
//			anchors.leftMargin: 106
//			anchors.top: parent.top
//			anchors.topMargin: 10
//			color: Material.primaryTextColor
//		}
    }


    /*!
      This function makes the "Send to Ada" button active and visible in the editor.

      The button allows an exercise to be submitted for evaluation to the game. It is activated at the beginning of type 4 and 5 exercises.
    */
    function setUploadButton(func){
        uploadButton.action = func;
        uploadButton.visible = true;
    }

    /*!
      This function makes the "Ask Ada what to do" button active and visible in the editor.

      The button allows the player to make the game show the task for an exercise again. It is activated at the beginning of type 4 and 5 exercises.
    */
    function setQuestionButton(func){
        questionButton.action = func;
        questionButton.visible = true;
    }

    // improve using: https://appbus.wordpress.com/2016/05/20/one-page-sample-app/
    FloatingActionButton {
        property int distToBorders: isMini ? 16 : 24
        anchors.right: parent.right
        anchors.rightMargin: (isMini ? 64 : 96) + distToBorders
        anchors.bottom: parent.bottom
        anchors.bottomMargin: distToBorders
        isMini: window.width <= 460
        /*anchors.top: parent.top
        anchors.topMargin: -height/2
        z: 2*/
        imageSource: !thymio.playing ? "qrc:/thymio-vpl2/icons/ic_play_arrow_white_24px.svg" : "qrc:/thymio-vpl2/icons/ic_stop_white_24px.svg"
        visible: !vplEditor.blockEditorVisible
        onClicked: thymio.playing = !thymio.playing
        enabled: (vplEditor.compiler.output.error === undefined) && (thymio.node !== undefined)
        //opacity: enabled ? 1.0 : 0.38
    }

    Connections {
        target: vplEditor.compiler
        onOutputChanged: thymio.playing = false
    }

    ListModel {
        id: menuItems

        ListElement {
            title: QT_TR_NOOP("load program");
            callback: "load";
            whiteIcon: "qrc:/thymio-vpl2/icons/ic_open_white_24px.svg";
            blackIcon: "qrc:/thymio-vpl2/icons/ic_open_black_24px.svg";
        }
        function load() {
            saveProgramDialog.isSave = false;
            saveProgramDialog.visible = true;
        }

        ListElement {
            title: QT_TR_NOOP("save program");
            callback: "save";
            whiteIcon: "qrc:/thymio-vpl2/icons/ic_save_white_24px.svg";
            blackIcon: "qrc:/thymio-vpl2/icons/ic_save_black_24px.svg";
        }
        function save() {
            saveProgramDialog.isSave = true;
            saveProgramDialog.visible = true;
        }

        ListElement {
            title: QT_TR_NOOP("new program");
            callback: "newProgram";
            whiteIcon: "qrc:/thymio-vpl2/icons/ic_new_white_24px.svg";
            blackIcon: "qrc:/thymio-vpl2/icons/ic_new_black_24px.svg";
        }
        function newProgram() {
            vplEditor.clearProgram();
            saveProgramDialog.programName = "";
        }

        ListElement {
            title: QT_TR_NOOP("switch color theme");
            callback: "switchColorTheme";
            whiteIcon: "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg";
            blackIcon: "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg";
        }
        function switchColorTheme() {
            if (window.Material.theme === Material.Dark) {
                window.Material.theme = Material.Light;
            } else {
                window.Material.theme = Material.Dark;
            }
        }

        /*ListElement {
            title: QT_TR_NOOP("switch editor mode");
            callback: "switchEditorMode";
            whiteIcon: "";
            blackIcon: "";
        }
        function switchEditorMode() {
            vplEditor.switchMode();
        }*/

        ListElement {
            title: QT_TR_NOOP("about");
            callback: "showAboutBox";
            whiteIcon: "qrc:/thymio-vpl2/icons/ic_info_white_24px.svg";
            blackIcon: "qrc:/thymio-vpl2/icons/ic_info_black_24px.svg";
        }
        function showAboutBox() {
            aboutDialog.visible = true;
        }

        ListElement {
            title: "dev: show aesl";
            callback: "showAeslSource";
            whiteIcon: "";
            blackIcon: "";
            visible: false;
        }
        function showAeslSource() {
            aeslSourceDialog.visible = true;
        }

        ListElement {
                    title: QT_TR_NOOP("return to main menu");
                    callback: "returnToPreviousView";
                    whiteIcon: "qrc:/thymio-vpl2/icons/ic_invert_colors_white_24px.svg";
                    blackIcon: "qrc:/thymio-vpl2/icons/ic_invert_colors_black_24px.svg";
        }
        function returnToPreviousView() {
            startupWindow.showHome();
            stote.resetScript();
        }

        ListElement {
                    title: QT_TR_NOOP("simulate exercise");
                    callback: "simulateExercise";
                    whiteIcon: "";
                    blackIcon: "";
        }

        function simulateExercise() {
            vplEditor.saveProgram(autosaveName);
            thymio.playing = true;
            thymio.runSimulationDefault();

            thymio.playing = false;
        }

        function restartExercise() {
            vplEditor.loadCode(code);
        }

        function closeVplPopup1() {
            type1Ex.closePopup();
        }

        function closeVplPopup2() {
            type2Ex.closePopup();
        }

        function closeVplPopup3() {
            type3Ex.closePopup();
        }

    }

    Drawer {
        id: drawer
        edge: Qt.LeftEdge
        position: 0
        width: 300
        height: window.height

        contentItem: Pane {
            ListView {
                id: listView
                currentIndex: -1
                anchors.fill: parent

                model: menuItems

                delegate: ItemDelegate {
                    contentItem: Row {
                        spacing: 24
                        HDPIImage {
                            source: Material.theme === Material.Dark ? whiteIcon : blackIcon
                            width: 24
                            height: 24
                            opacity: enabled ? 1.0 : 0.5
                        }
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

    DashelTargetDialog {
        id: dashelTargetSelector
        aseba: aseba
    }

    LoadSaveDialog {
        id: saveProgramDialog
        vplEditor: vplEditor
    }

    Popup {
        id: aboutDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        modal: true
        padding: 24

        Column {
            spacing: 20
            padding: 0
            Label {
                text: qsTr("Thymio VPL Mobile Preview")
                font.pixelSize: 20
                font.weight: Font.Medium
            }
            Label {
                textFormat: Text.RichText;
                text:
                    linkRichTextStyle +
                    qsTr("<p><a href=\"http://stephane.magnenat.net\">Stéphane Magnenat</a>, <a href=\"http://sampla.ch\">Martin Voelkle</a>,<br/><a href=\"http://mariamari-a.com\">Maria Beltran</a> and contributors.</p>") +
                    qsTr("<p>© 2015–2017 EPFL, ETH Zürich and Mobsya</p>") +
                    qsTr("<p>This project is open source under <a href=\"https://github.com/aseba-community/thymio-vpl2/blob/master/LICENSE.txt\">LGPL</a>.<br/>") +
                    qsTr("See file <a href=\"https://github.com/aseba-community/thymio-vpl2/blob/master/AUTHORS.md\">AUTHORS.md</a> in the <a href=\"https://github.com/aseba-community/thymio-vpl2\">source code</a><br/>") +
                    qsTr("for a detailed list of contributions.")
                font.pixelSize: 14
                font.weight: Font.Normal
                lineHeight: 20
                lineHeightMode: Text.FixedHeight
                onLinkActivated: Qt.openUrlExternally(link)
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    width: 100
                    height: 50
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    HDPIImage {
                        width: 80
                        height: width * 0.5
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/thymio-vpl2/images/logoEPFL.svg"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: { Qt.openUrlExternally("http://mobots.epfl.ch"); }
                    }
                }
                Rectangle {
                    width: 100
                    height: 50
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    HDPIImage {
                        width: 80
                        height: width * 0.48 // 0.38753
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/thymio-vpl2/images/logoETHGTC.svg"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: { Qt.openUrlExternally("http://www.gtc.inf.ethz.ch"); }
                    }
                }
                Rectangle {
                    width: 100
                    height: 50
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    HDPIImage {
                        width: 80
                        height: width * 0.27348
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/thymio-vpl2/images/logoMobsya.svg"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: { Qt.openUrlExternally("http://www.mobsya.org"); }
                    }
                }
            }
        }
    }

    // developer options for debugging
    Popup {
        id: aeslSourceDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 0.8 * parent.width
        height: 0.8 * parent.height
        modal: true
        focus: true

        Flickable {
            anchors.fill: parent
            clip: true
            Text {
                text: prettyPrintGeneratedAesl(vplEditor.compiler.output.script)
                color: Material.primaryTextColor
                font.family: "Monospace"
                // TODO: move this somewhere
                function prettyPrintGeneratedAesl(source) {
                    var level = 0;
                    var output = "";
                    var splitted = source.split("\n");
                    for (var i = 0; i < splitted.length; i++) {
                        var line = splitted[i].trim();
                        if ((line.indexOf("sub ") === 0) || (line.indexOf("onevent ") === 0)) {
                            output += "\n" + line + "\n";
                            level = 1;
                        } else {
                            if (line.indexOf("end") === 0) {
                                level -= 1;
                            }
                            for (var j = 0; j < level; j++)
                                output += "    ";
                            output += line + "\n";
                            if (line.indexOf("if ") === 0) {
                                level += 1;
                            }
                        }
                    }
                    return output;
                }
            }
            contentWidth: contentItem.childrenRect.width;
            contentHeight: contentItem.childrenRect.height
            ScrollBar.vertical: ScrollBar { }
            ScrollBar.horizontal: ScrollBar { }
        }
    }

    Aseba {
        id: aseba
        onUserMessage: {
            if (type !== 0) {
                return;
            }
            if (vplEditor === undefined) {
                return;
            }
            vplEditor.compiler.execTransition(data[0]);
        }
    }

    Thymio {
        id: thymio
        property bool playing: false
        events: vplEditor ? vplEditor.compiler.output.events : {}
        source: playing ? vplEditor.compiler.output.script : ""
        onNodeChanged: playing = false
        onPlayingChanged: {
            vplEditor.compiler.execReset(playing);
            if (!playing) {
                setVariable("motor.left.target", 0);
                setVariable("motor.right.target", 0);
            } else {
                vplEditor.saveProgram(autosaveName);
            }
        }
        onErrorChanged: if (error !== "") { vplEditor.compiler.output.error = error; }
    }

    Component.onCompleted: {
        vplEditor.loadProgram(autosaveName);
    }
}

