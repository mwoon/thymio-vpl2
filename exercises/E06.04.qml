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
                                    "text": "Pre E06.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Ruby likes the color red, so let's make a program that can turn Thymio's top LEDs red.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There's a half finished program here with a button pointing down. We can use this!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.04 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Our program should change Thymio's top LEDs to red when the back button is pressed!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E06.04",
                            "method": "sim",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Our program should change Thymio's top LEDs to red when the back button is pressed!")
                                        }
                                    ]
                                }
                            ],
                            "scene": [{
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "red"}],
                                    "duration": 2,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 },
                                    "testFunction": "buttonBack"
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[28,0,2]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E06.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Ruby should really like this!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Wait, that's not quite right...")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada pokes around on the tablet to fix the program.")
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
                                    "text": "post ex 6.04 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They run the program and Thymio's color changes to red.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.04 3"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby laughs, but stays away.")
                                }
                            ]
                        }
                    ]
        }
    }
}
