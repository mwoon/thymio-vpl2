import QtQuick 2.7
import Aseba 1.0
import Simulator 1.0

Item {
	property var variables: ({})
	property var events: ({})
	property string source: ""
	property string error: ""

	property var node: {
		for (var i = 0; i < aseba.nodes.length; ++i) {
			var node = aseba.nodes[i];
			if (node.name === "thymio-II") {
				return node;
			}
		}
	}

    /*
	Simulator {
		id: simulator
        onSimulationCompleted: {console.log(JSON.stringify(log))}
		onNotify: console.log("Thymio said: " + level + " " + description + " " + arguments)
    }*/

	onNodeChanged: {
		setVariables();
		setProgram();
	}
	onVariablesChanged: setVariables()
	onEventsChanged: setProgram()
	onSourceChanged: setProgram()

	function setVariables() {
		if (node) {
			Object.keys(variables).forEach(function(name) {
				var value = variables[name];
				if (typeof value === "number") {
					value = [value];
				}
				node.setVariable(name, value);
			})
		}
	}

	function setVariable(name, value) {
		if (node) {
			if (typeof value === "number") {
				value = [value];
			}
			node.setVariable(name, value);
		}
	}

	function setProgram() {

/*
        console.log("setprogram simulation");
        console.log("source " + source);
        console.log("events " + JSON.stringify(events));

		// uncomment this section for simulating the execution at each run
		// TODO: put simulation in a thread
		// TODO: only trigger this when play is pressed, not when stop is
		var scenario = {
            duration: 1,
			worldSize: Qt.vector2d(100, 100),
			thymio : { position: Qt.vector2d(20, 50), angle: 0 },
			walls: [ { position: Qt.vector2d(80, 50), angle: Math.pi / 2, size: Qt.vector3d(20, 2, 10), color: "Blue" } ],
			groundTexture: "/tmp/test.png"
		}
		var simError = simulator.runProgram(scenario, events, source, function() {
			if (this.currentTime === 0) {
				this.simulatedThymio.tap();
                console.log("Simulation tapped Thymio");
			}
			console.log(this.currentTime + ": " + this.simulatedThymio.position.x + " : " + this.simulatedThymio.horizontalSensors[2]);
		});
		if (simError)
			console.log("Simulation error: " + simError)
		*/
		if (node) {
			error = node.setProgram(events, source);
		}
	}

    function runSimulationDefault() {
        console.log("runSimulation simulation");
        console.log("source " + source);
        console.log("events " + JSON.stringify(events));

        var scenario = {
            duration: 2,
            worldSize: Qt.vector2d(100, 100),
            thymio : { position: Qt.vector2d(20, 50), angle: 0 },
            walls: [ { position: Qt.vector2d(80, 50), angle: Math.pi / 2, size: Qt.vector3d(20, 2, 10), color: "Blue" } ]
        }
        var simError = simulator.runProgram(scenario, events, source, function() {
            if (this.currentTime === 0) {
                this.simulatedThymio.tap();
                console.log("Simulation tapped Thymio");
            }
            console.log("sim logged: " + this.currentTime + ": " + this.simulatedThymio.position.x + " : " + this.simulatedThymio.horizontalSensors[2]);
        });

        if (simError) {
            console.log("simulation error: " + simError)
        } else {
            console.log("simulation complete");
        }

    }

    function runSimulationWithFunction(scenario, testFunction) {
        var simError = simulator.runProgram(scenario, events, source, testFunction);
        if (simError) {
            console.log("simulation error: " + simError)
        } else {
            console.log("simulation complete");
        }
    }

    function runSimulation(scenario) {
        var simError = simulator.runProgram(scenario, events, source);
        if (simError) {
            console.log("simulation error: " + simError)
        } else {
            console.log("simulation complete");
        }
    }
}
