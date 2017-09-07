import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

/*!
  DialogueBox This component represents a dialogue box to display the words that make up the story.
*/
Rectangle {
    //Box for displaying text and dialogue

    /*!
      This property sets the speaker's name for the dialogue box and always uses the upper portion of the DialogueBox. If a general description of the environment should be shown, it can be set to the empty string.

      If this property is set to one of "Ada", "Thymio", "10LKFPS-UWLTHYMIO", "Robot" and "Ruby" the corresponding character's image is shown alongside the dialogue.
    */
    property alias speakerName: speakerName.text

    /*!
      This property sets the dialogue that is spoken by characters. It can also be used to describe what is happening in general. It takes up the lower portion of the DialogueBox.
    */
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
                    speakerImage.source = "qrc:/its-game/assets/ada.png";
                } else if (text === "Thymio" || text === "10LKFPS-UWLTHYMIO" || text === "Robot") {
                    speakerImage.source = "qrc:/its-game/assets/thymio.png";
                } else if (text === "Ruby") {
                    speakerImage.source = "qrc:/its-game/assets/ruby.png";
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
        source: "qrc:/its-game/assets/ada.png"
    }
}
