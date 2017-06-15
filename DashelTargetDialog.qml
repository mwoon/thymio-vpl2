import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Popup {
	id: dialog
	x: (window.width - width) / 2
	y: window.height / 6
	modal: true
	focus: true
	closePolicy: Popup.OnEscape | Popup.OnPressOutside

	property Aseba aseba

	onVisibleChanged: {
		if (visible) {
			textInput.text = aseba.target;
		}
	}

	ColumnLayout {
		spacing: 20

		Label {
			text: qsTr("Set Dashel target")
			font.pixelSize: 20
			font.weight: Font.Medium
		}

		TextField {
			id: textInput
			implicitWidth: 280
		}

		RowLayout {
			spacing: 16
			Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

			Button {
				id: cancelButton
				text: qsTr("Cancel")
				onClicked: {
					dialog.close();
				}
			}

			Button {
				id: okButton
				text: qsTr("Ok")
				onClicked: {
					aseba.target = textInput.text;
					dialog.close();
				}
			}
		}
	}
}
