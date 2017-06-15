import QtQuick 2.7
import Aseba 1.0
import Qt.labs.settings 1.0

Item {
	id: aseba

	property string target: Qt.platform.os === "android" ? "android:" : "ser:name=Thymio-II"
	property alias nodes: client.nodes
	signal userMessage(int type, var data)

	Settings {
		property alias target: aseba.target
	}

	AsebaClient {
		id: client
		onConnectionError: {
			timer.start();
		}
	}

	function startClient() {
		client.start(target);
	}

	// FIXME: this does not work if the connection is already active
	onTargetChanged: {
		console.log("connecting to new target", target);
		startClient();
	}

	Component.onCompleted: {
		client.userMessage.connect(userMessage);
		startClient();
	}

	function emit(eventId, params) {
		client.sendUserMessage(eventId, params);
	}

	Timer {
		id: timer
		interval: 1000
		onTriggered: startClient()
	}
}
