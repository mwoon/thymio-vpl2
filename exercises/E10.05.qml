import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E10.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's use sensors and buttons!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E10.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Make Thymio's top LEDs change to pink when his left sensor behind detects nothing and change to green when his center button is pressed.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E10.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Make Thymio's top LEDs change to pink when his left sensor behind detects nothing and change to green when his center button is pressed.")
                                        }
                                    ]
                                }
                            ],
                            "method": "sim",
                            "special": {
                                "cmd": "insertCode",
                                "events": [
                                    {
                                        "definition": "ProxEventBlock",
                                        "params": ["DISABLED", "DISABLED", "CLOSE", "DISABLED", "DISABLED", "DISABLED", "DISABLED"]
                                    }
                                ],
                                "actions": [
                                    {
                                        "definition": "MotorSimpleActionBlock",
                                        "params": "front"
                                    }
                                ]
                            },
                            "scene": [
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "green"}],
                                    "duration": 2,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 },
                                    "testFunction": "buttonCenter"
                                },{
                                    "checkfor": [{"type": "topcolor", "time" : 2, "color": "pink"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "special": {"cmd": "removeCodeOfType", "type": "Button"},
                                    "walls": [
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]},
                                        {"position":[50, 20], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,1,25]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E10.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yay, you did it!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada has fun changing Thymio's colors from pink to green.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Huh, that's not quite right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh well, nevermind.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
