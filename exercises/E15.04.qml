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
                                    "text": "Pre E15.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Help me finish this program, please.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("We need to make it so that when the middle front sensor detects something and both sensors beside it don't detect anything, the top LEDs become red and the bottom LEDs become blue. ")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But when the leftmost and rightmost sensors in front detect something but all the sensors in between do not, the top LEDs should become green and the bottom LEDs light blue!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E15.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("We need to make it so that when the middle front sensor detects something and both sensors beside it don't detect anything, the top LEDs become red and the bottom LEDs become blue.")
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
                                            "text": qsTr("But when the leftmost and rightmost sensors in front detect something and all the sensors in between do not, the top LEDs should become green and the bottom LEDs light blue!")
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
                                        "params": ["DISABLED", "DISABLED", "DISABLED", "DISABLED", "DISABLED", "CLOSE", "DISABLED"]
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
                                    "checkfor": [{"type": "botcolor", "time" : 13, "color": "light blue"}, {"type": "topcolor", "time" : 13, "color": "green"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 26.1], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]},
                                        {"position":[60, 13.9], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 11, "color": "blue"}, {"type": "topcolor", "time" : 11, "color": "red"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 20], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                }
                            ],
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","CLOSE","FAR","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[3,0,31]},{"definition":"PaletteTopColorActionBlock","params":[32,1,4]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","FAR","FAR","FAR","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[4,28,32]},{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[],[{"definition":"PaletteBottomColorActionBlock","params":[3,0,31]}]],[[],[{"definition":"PaletteBottomColorActionBlock","params":[4,28,32]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E15.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's test it out right away!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("That's not quite right, is it?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I'll take another look at it.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada changes the program a little bit.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hopefully, this is better?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Are you sure?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("We can try it and see?")
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
                                    "text": "post ex 15.04 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars come out of the ground and Ada waits nervoursly.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.04 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They go back into the ground and the screen shows that it was okay.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.04 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada breathes a sigh of relief.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.04 05"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The screen lights up again.")
                                }
                            ]
                        }
                    ]
        }
    }
}
