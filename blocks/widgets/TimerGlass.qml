import QtQuick 2.7
import "../.."

Image {
	property int majorValue: 0
	property real minorValue: 1

	source: majorValue === 0 ? "images/timerShortStroke.svg" : (majorValue === 1 ? "images/timerMiddleStroke.svg" : "images/timerLongStroke.svg")
	width: 256 // working around Qt bug with SVG and HiDPI
	height: 256 // working around Qt bug with SVG and HiDPI

	HDPIImage {
		anchors.horizontalCenter: parent.horizontalCenter
		y: 99
		source: majorValue === 0 ? "images/timerShortFill.svg" : (majorValue === 1 ? "images/timerMiddleFill.svg" : "images/timerLongFill.svg")
		width: majorValue === 0 ? 38 : (majorValue === 1 ? 60 : 80) // working around Qt bug with SVG and HiDPI
		height: 25.4 // working around Qt bug with SVG and HiDPI
		visible: minorValue > 0
	}

	Rectangle {
		anchors.horizontalCenter: parent.horizontalCenter
		width: majorValue === 0 ? 38 : (majorValue === 1 ? 60 : 80)
		height: 6.3 * (minorValue-1)
		y: 99 - height
		color: "#231f20"
		visible: minorValue > 1
	}
}
