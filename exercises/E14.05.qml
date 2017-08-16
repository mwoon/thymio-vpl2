import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Oh great. The instructions are really complicated.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Are you ready for them? Here goes.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the leftmost sensor in front detects something and the left sensor behind doesn't, Thymio's top LEDs change to green.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the leftmost sensor in front does not detect anything and the left sensor behind detects something, Thymio's bottom LEDs change to green.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 05"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the rightmost sensor in front detects something and the right sensor behind doesn't Thymio's bottom LEDs change to red.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.05 05"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("And finally, when the rightmost sensor in front does not detect anything and the right sensor behind detects something, Thymio's top LEDs change to red.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E14.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the leftmost sensor in front detects something and the left sensor behind doesn't, Thymio's top LEDs change to green.")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the leftmost sensor in front does not detect anything and the left sensor behind detects something, Thymio's bottom LEDs change to green.")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the rightmost sensor in front detects something and the right sensor behind doesn't Thymio's bottom LEDs change to red.")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("And finally, when the rightmost sensor in front does not detect anything and the right sensor behind detects something, Thymio's top LEDs change to red.")
                                        }
                                    ]
                                }
                            ],
                            "method": "sim",
                            "scene": [
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26.1], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 13.9], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 16.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "red"}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[48, 13.9], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "green"}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "green"}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26.1], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 1, "color": "red"}],
                                    "duration": 0.5,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[35, 16.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                }
                            ],
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,3]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,0,3]}]],[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[1,31,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E14.05 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's try it out!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I want to change a few things in the program.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Why?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("It doesn't look right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Okay, but are you sure you're making it better?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yes, leave it to me!")
                                         }]
                                    ]
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.05 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads the program and presses the button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.05 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars move up and down a few times around Thymio and then they vanish back in the ground.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.05 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Looks like it was okay!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.05 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada bounces back to the screen to see what's next.")
                                }
                            ]
                        }
                    ]
        }
    }
}
