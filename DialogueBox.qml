import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Rectangle {
    //Box for displaying text and dialogue

    property alias speakerName: speakerName.text
    property alias dialogue: dialoguetext.text


    //visible: false
    anchors.horizontalCenter: parent.horizontalCenter

    height: parent.height / 9 * 2
    width: parent.width - 80
    z: 1
    radius: 20

    color: "#80ffffff"
    border.color: "#f0ffffff"
    border.width: 3

    ColumnLayout {
        anchors.fill: parent

        Text {
            id: speakerName

            Layout.leftMargin: 25
            Layout.rightMargin: 25
            Layout.topMargin: parent.height / 16
            height: parent.height / 4

            text: "Placeholder Name"
            font.pointSize: 16
            onTextChanged: {
                if(text === "Ada") {
                    speakerImage.source = "assets/ada.png";
                } else if (text === "Thymio" || text === "10LKFPS-UWLTHYMIO" || text === "Robot") {
                    speakerImage.source = "assets/thymio.png";
                } else if (text === "Ruby") {
                    speakerImage.source = "assets/ruby.png";
                } else {
                    speakerImage.source = "";
                }
            }
        }
        Text {
            id: dialoguetext

            Layout.leftMargin: 25
            Layout.rightMargin: parent.height
            Layout.topMargin: parent.height / 16
            Layout.fillHeight: true
            Layout.fillWidth: true //Need this to ensure that the width of the text box does not spill over parent width

            text: "Placeholder Speech"
            font.pointSize: 16
            wrapMode: Text.WordWrap

        }
    }

    Image {
        id: speakerImage
        anchors.right: parent.right
        height: parent.height
        width: parent.height
        source: "assets/ada.png"
    }
}
