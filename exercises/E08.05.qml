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
                                    "text": "Pre E08.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay, we can make a program ourselves.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E08.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There are so many things we could do!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E08.05 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Try doing this: Thymio's top LEDs change to blue when the button pointing behind is pressed and Thymio's top LEDS change to pink when the button pointing in front is pressed!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E08.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Try doing this: Thymio's top LEDs change to blue when the button pointing behind is pressed and Thymio's top LEDS change to pink when the button pointing in front is pressed!")
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
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,3]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,32,4]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E08.05 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That looks good!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, not like that.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada changes the program to make it do what she wanted.")
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
                                    "text": "post ex 8.05 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("When Ada changes Thymio's LEDs to pink, Ruby flies closer and when she changes Thymio's color to blue, Ruby moves away again.")
                                }
                            ]
                        }
                    ]
        }
    }
}
