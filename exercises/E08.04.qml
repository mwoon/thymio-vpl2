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
                                    "text": "Pre E08.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There's a half finished program here.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E08.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's make it so that the button pointing back will make Thymio's top LEDs blue and Thymio's color should change to pink when the button pointing in front is pressed!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E08.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Let's make it so that the button pointing back will make Thymio's top LEDs blue and Thymio's color should change to pink when the button pointing in front is pressed!")
                                        }
                                    ]
                                }
                            ],
                            "method": "sim",
                            "scene": [{
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "blue"}],
                                    "duration": 2,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 },
                                    "testFunction": "buttonBack"
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "pink"}],
                                    "duration": 2,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 },
                                    "testFunction": "buttonFront"
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]],[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,2,27]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[]],[[],[{"definition":"PaletteTopColorActionBlock","params":[32,2,27]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E08.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yes! Exactly like that.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, not like that.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada changes the program again.")
                                         }]
                                    ]
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.04 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Come and see this Ruby!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.04 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby comes closer and watches Ada change Thymio's color to blue and then to pink.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.04 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("He looks like he wants to play too.")
                                }
                            ]
                        }
                    ]
        }
    }
}
