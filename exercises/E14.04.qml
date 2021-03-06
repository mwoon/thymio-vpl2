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
                                    "text": "Pre E14.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("On the screen it says we have to finish this program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Oh it's quite complicated... Let me try to explain it.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.04 03"
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
                                    "text": "Pre E14.04 04"
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
                                    "text": "Pre E14.04 05"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the rightmost sensor in front detects something and the right sensor behind doesn't Thymio's bottom LEDs change to red. ")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.04 06"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("And finally, when the rightmost sensor in front does not detect anything and the right sensor behind detects something, Thymio's top LEDs change to red.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.04 07"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Whew, I think I got all of it.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.04 08"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("If you forget I can always tell you again!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E14.04",
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
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,3]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,0,3]}]],[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[1,31,0]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[],[{"definition":"PaletteTopColorActionBlock","params":[31,0,3]}]],[[],[{"definition":"PaletteBottomColorActionBlock","params":[32,0,3]}]],[[],[{"definition":"PaletteBottomColorActionBlock","params":[1,31,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E14.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I think we managed.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Wait that doesn't look right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada changes a few things.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("There, that looks better.")
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
                                    "text": "post ex 14.04 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's test it and see what happens.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.04 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("The screen seems to accept their program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.04 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("What's next, screen?")
                                }
                            ]
                        }
                    ]
        }
    }
}
