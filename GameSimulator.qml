import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

    ColumnLayout {
        spacing: 16

        Button {
            text: "< return"
            onClicked: {
                startupWindow.showHome();
            }
        }

        Button {
            text: "Perfect Student"
            onClicked: {
                perfectSim();
            }
        }
    }

    Popup {
        id: popup
        leftMargin: (parent.width - width) / 2;
        topMargin: (parent.height - height) / 2;
        //width: parent.width / 4
        //height: parent.height / 2
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        ColumnLayout {
            spacing: 16
            anchors.fill: parent

            Label {
                text: "Choose a file name for the log"
                font.pixelSize: 20
                font.weight: Font.Medium
            }

            TextField {
                id: fileName
                anchors.left: parent.left
                anchors.right: parent.right
                focus: true
            }

            RowLayout {
                spacing: 16
                Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

                Button {
                    text: qsTr("Cancel")
                    onClicked: {
                        popup.close();
                        stote.resetScript();
                    }
                }

                Button {
                    id: okButton2
                    text: "Save"
                    enabled: fileName.text !== ""
                    onClicked: {
                        stote.writeLogToFile(fileName.text);
                        popup.close();
                        stote.resetScript();
                    }
                }
            }
        }
    }

    function perfectSim() {
        var response = "";
        while(response !== "the_end") {
            var rawResp = stote.advanceScript();
            while (rawResp === "") {}
            var parsed = JSON.parse(rawResp);

            if(parsed.activity) {
                stote.completeExercise(1.0);
                response = parsed.activity[0];
            } else if (parsed.story0) {
               response = parsed.story0[0];
            }
            rawResp = "";
        }

        popup.open();
    }

/*-------------------------- Title Bar & Drawer Menu --------------------------------------*/


    header: simTB

    SimulatorTitleBar {
        id: simTB
        visible: true
        onOpenDrawer: {
            drawer.open()
        }
    }

    MenuDrawer {
        id: drawer
        drawerModel: simMenu
    }


    ListModel {
        id: simMenu
        ListElement {
            title: "Return to Home";
            callback: "showHome";
        }

        function showHome() {
            startupWindow.showHome();
        }
    }
}
