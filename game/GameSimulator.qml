import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

/*!
  \brief GameSimulator provides an interface to create automatic logs of game playthroughs with a number of AI.

  One button is associated with each AI and corresponding description. When clicked on, the game is played through 1000 times. The logs are stored in "/home/[user]/.local/share/simulations" on linux and under "[user]/simulations" in android.
*/
Page {

    background: Rectangle {
        color: "#C4C4C4"
    }

    ColumnLayout {
        spacing: 10

        anchors.fill: parent
        anchors.leftMargin: 50

        ListView {
            id: options

            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 12


            model: optionsList
            delegate: RowLayout {
                id: row
                spacing: 8
                Layout.fillWidth: true
                Layout.fillHeight: true

                Button {
                    id: control
                    implicitWidth: Screen.width / 2
                    text: name
                    background: Rectangle {
                        color: "#30efff16"
                        border.color: "#a0efff16"
                        radius: 5
                    }
                    contentItem: Text {
                        text: control.text
                        //font: control.font
                        font.pointSize: 14
                        color: "#efff16"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        wrapMode: Text.WordWrap
                    }
                    onClicked:  {
                        options.currentIndex = index;
                        options.model[callback]();
                    }
                    highlighted: row.ListView.isCurrentItem
                }

                Text {
                    text: description
                }
            }

        }
        ListModel {
            id: optionsList

            ListElement {
                name: "Perfect Student"
                callback: "perfectSim"
                description: "returns 1 success for every exercise"
            }

            ListElement {
                name: "Total Failure Student"
                callback: "totalFailSim"
                description: "returns 0 success for every exercise"
            }

            ListElement {
                name: "Always Low Score"
                callback: "alwaysLowScoreSim"
                description: "returns 0.2 success for every exercise"
            }

            ListElement {
                name: "30% Failure Student"
                callback: "failPercent30Sim"
                description: "Student who fails 30% of exercises"
            }

            ListElement {
                name: "Fixed Rate Per Type 30%, 40%, 50%, 60%, 80%"
                callback: "fixed3040506080"
                description: "Student who fails type 1 exercise with 30%, type 2 with 40%, type 3 with 50%, type 4 with 60% and type 5 with 80%"
            }

            ListElement {
                name: "increase per trial"
                callback: "increasePerTrial"
                description: "start success rate 0, increase success by 0.1 for each success and 0.05 for each failure. per type"
            }

            ListElement {
                name: "increase per trial scaled by complexity"
                callback: "iptSc"
                description: "same as increase per trial but additionally scales the chance of success by the complexity level"
            }


            //functions
            function perfectSim() {
                for(var i = 0; i < 1000; i++) {
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

                    stote.writeLogToFile("perfect_" + i);
                    stote.resetScript();
                }
            }

            function totalFailSim() {
                for(var i = 0; i < 1000; i++) {
                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.completeExercise(0.0);
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }

                    stote.writeLogToFile("totalFail_" + i);
                    stote.resetScript();
                }
            }

            function alwaysLowScoreSim() {
                for(var i = 0; i < 1000; i++) {
                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.completeExercise(0.2);
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }

                    stote.writeLogToFile("lowScore20_" + i);
                    stote.resetScript();
                }
            }

            function failPercent30Sim() {
                for(var i = 0; i < 1000; i++) {

                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.simulateWithFailPercent(0.3);
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }

                    stote.writeLogToFile("failRate30_" + i);
                    stote.resetScript();
                }
            }

            function fixed3040506080() {
                for(var i = 0; i < 1000; i++) {

                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.simulateFixedSuccessByTypeOfExercise(0.3, 0.4, 0.5, 0.6, 0.8)
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }

                    stote.writeLogToFile("fixed3040506080_" + i);
                    stote.resetScript();
                }
            }

            function increasePerTrial() {

                for(var i = 0; i < 1000; i++) {

                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.simulateIncreasePerTrial();
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }
                    stote.writeLogToFile("ipt_" + i);
                    stote.resetScript();
                }

            }

            function iptSc() {

                for(var i = 0; i < 1000; i++) {

                    var response = "";
                    while(response !== "the_end") {
                        var rawResp = stote.advanceScript();
                        while (rawResp === "") {}
                        var parsed = JSON.parse(rawResp);

                        if(parsed.activity) {
                            stote.simulateIptSc();
                            response = parsed.activity[0];
                        } else if (parsed.story0) {
                            response = parsed.story0[0];
                        }
                        rawResp = "";
                    }
                    stote.writeLogToFile("iptSc_" + i);
                    stote.resetScript();
                }

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
                    text: qsTr("Save")
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
