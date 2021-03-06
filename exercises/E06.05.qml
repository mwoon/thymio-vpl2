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
                                    "text": "Pre E06.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ruby",
                                    "text": qsTr("How about changing the color to red?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Yes! He doesn't look so afraid anymore.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.05 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's do as he asks. Maybe he'll come down soon.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.05 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Write a program to change Thymio's top LEDs to red when the back button is pressed!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E06.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Write a program to change Thymio's top LEDs to red when the back button is pressed!")
                                        }
                                    ]
                                }
                            ],
                            "method": "sim",
                            "scene": [{
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "red"}],
                                    "duration": 2,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 },
                                    "testFunction": "buttonBack"
                                }],
                            "checkfor": [{"type": "buttoncolor", "color": "red", "button": ["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[28,0,2]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E06.05 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Awesome!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Here you go Ruby!")
                                         }
                                        ],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Wait, I think that's not right.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada fixes the program.")
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
                                    "text": "post ex 6.05 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They run the program and Thymio's color changes to red when Ada taps the back button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.05 3"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby is very happy.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.05 3"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("He flaps his wings and claps them together with a smile.")
                                }
                            ]
                        }
                    ]
        }
    }
}
