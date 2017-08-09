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
        console.log(source);
		if (node) {
			error = node.setProgram(events, source);
		}
	}

    function runSimulationDefault() {

        var scenario = {
            duration: 1,
            worldSize: Qt.vector2d(100, 40),
            thymio : { position: Qt.vector2d(60, 20), angle: 0 },
            walls: [ //{ position: Qt.vector2d(80, 50), angle: Math.pi / 2, size: Qt.vector3d(20, 2, 10), color: "Blue" },
            {"position":Qt.vector2d(48, 23.5), "angle":0, "size": Qt.vector3d(2,2, 10)}, //behind left
            //{ position: Qt.vector2d(69, 27), angle: 0, size: Qt.vector3d(2, 2, 10)}, //outer most left sensor
            //{ position: Qt.vector2d(69, 24.8), angle: 0, size: Qt.vector3d(2, 2, 10)}, //both outer most sensors
            //{ position: Qt.vector2d(72, 22.4), angle: 0, size: Qt.vector3d(2, 2, 10)}, //inner left sensor
            { position: Qt.vector2d(72, 20), angle: 0, size: Qt.vector3d(2,2, 10)} //middle sensor
            //{ position: Qt.vector2d(72, 17.6), angle: 0, size: Qt.vector3d(2, 2, 10)}//, //inner right sensor
            //{ position: Qt.vector2d(69, 13), angle: 0, size: Qt.vector3d(2, 2, 10)} //outer most right sensor
            ]
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
        var func;
        switch(testFunction) {
        case "buttonFront":
            func = buttonFront;
            break;
        case "buttonBack":
            func = buttonBack;
            break;
        case "buttonLeft":
            func = buttonLeft;
            break;
        case "buttonRight":
            func = buttonRight;
            break;
        case "buttonCenter":
            func = buttonCenter;
            break;
        case "clap":
            func = clap;
            break;
        case "tap":
            func = tap;
            break;
        default:
            func = tap;
            break;
        }

        var simError = simulator.runProgram(scenario, events, source, func);
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

    Connections {
        target: simulator
        onSimulationCompleted: {

            console.log(JSON.stringify(log))
        }

    }

    // ------------------------- simulation functions --------------------------

    function tap() {
        if (this.currentTime === 0) {
            this.simulatedThymio.tap();
            console.log("Simulation tap");
        }
    }

    function clap() {
        if (this.currentTime === 0) {
            this.simulatedThymio.clap();
            console.log("Simulation clap");
        }
    }

    function buttonBack() {
        if (this.currentTime === 0) {
            this.simulatedThymio.pressBackwardButton();
            console.log("Simulation pressBackwardButton");
        }
    }

    function buttonFront() {
        if (this.currentTime === 0) {
            this.simulatedThymio.pressForwardButton();
            console.log("Simulation pressForwardButton");
        }
    }

    function buttonLeft() {
        if (this.currentTime === 0) {
            this.simulatedThymio.pressLeftButton();
            console.log("Simulation pressLeftButton");
        }
    }

    function buttonRight() {
        if (this.currentTime === 0) {
            this.simulatedThymio.pressRightButton();
            console.log("Simulation pressRightButton");
        }
    }

    function buttonCenter() {
        if (this.currentTime === 0) {
            this.simulatedThymio.pressCenterButton();
            console.log("Simulation pressCenterButton");
        }
    }
}
