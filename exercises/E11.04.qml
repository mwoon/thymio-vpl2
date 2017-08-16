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
                                    "text": "Pre E11.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Could you help me finish up this program?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the two front left sensors detect something, the top LEDs should change to red. When the right sensor behind detects something, the top LEDs should change to yellow. When the front middle sensor detects something, the top LEDs should change to blue.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E11.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the two front left sensors detect something, the top LEDs should change to red. When the right sensor behind detects something, the top LEDs should change to yellow. When the front middle sensor detects something, the top LEDs should change to blue.")
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
                                        "params": ["DISABLED", "DISABLED", "FAR", "DISABLED", "DISABLED", "DISABLED", "DISABLED"]
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
                                    "checkfor": [{"type": "topcolor", "time" : 11, "color": "red"}, {"type": "nottopcolor", "time" : 15}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 26], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 11, "color": "blue"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 20], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },{
                                    "checkfor": [{"type": "topcolor", "time" : 6, "color": "yellow"}],
                                    "duration": 1,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[35, 22], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 },
                                    "special": {
                                        "cmd": "insertCode",
                                        "events": [
                                            {
                                                "definition": "ProxEventBlock",
                                                "params": ["DISABLED", "DISABLED", "FAR", "DISABLED", "DISABLED", "DISABLED", "DISABLED"]
                                            }
                                        ],
                                        "actions": [
                                            {
                                                "definition": "MotorSimpleActionBlock",
                                                "params": "right"
                                            }
                                        ]
                                    }
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,3]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,2]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,30]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[],[{"definition":"PaletteTopColorActionBlock","params":[30,32,2]}]],[[],[{"definition":"PaletteTopColorActionBlock","params":[1,0,30]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thanks! Now we can show this to Ruby.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hey Ruby, look at this!")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ruby watches Ada change Thymio first to blue, then red and then yellow.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ruby watches Ada trying to test out the program.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I don't think it's doing what I want it to.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("We can try something else.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ],

                    "story4list": [
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let me give it a go!")
                                }
                            ]
                        },{
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada tries to make the program using the tablet.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Could you help me finish up this program?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I'm stuck and I'm not sure what to do now.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the two front left sensors detect something, the top LEDs should change to red. When the right sensor behind detects something, the top LEDs should change to yellow. When the front middle sensor detects something, the top LEDs should change to blue.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E11.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the two front left sensors detect something, the top LEDs should change to red. When the right sensor behind detects something, the top LEDs should change to yellow. When the front middle sensor detects something, the top LEDs should change to blue.")
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
                                        "params": ["DISABLED", "DISABLED", "FAR", "DISABLED", "DISABLED", "DISABLED", "DISABLED"]
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
                                    "checkfor": [{"type": "topcolor", "time" : 11, "color": "red"}, {"type": "nottopcolor", "time" : 15}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 26], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 11, "color": "blue"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[60, 20], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },{
                                    "checkfor": [{"type": "topcolor", "time" : 6, "color": "yellow"}],
                                    "duration": 1,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[35, 22], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 },
                                    "special": {
                                        "cmd": "insertCode",
                                        "events": [
                                            {
                                                "definition": "ProxEventBlock",
                                                "params": ["DISABLED", "DISABLED", "FAR", "DISABLED", "DISABLED", "DISABLED", "DISABLED"]
                                            }
                                        ],
                                        "actions": [
                                            {
                                                "definition": "MotorSimpleActionBlock",
                                                "params": "right"
                                            }
                                        ]
                                    }
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,3]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,2]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,30]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[],[{"definition":"PaletteTopColorActionBlock","params":[30,32,2]}]],[[],[{"definition":"PaletteTopColorActionBlock","params":[1,0,30]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thanks! That should do the trick.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let me see...")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I think it's not right yet.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("But I think I have an idea now how I can fix it.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thank you!")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("She goes about fixing the program.")
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
                                    "text": "post ex 11.04 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada then loads the program into Thymio and presses the button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.04 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Looks like it worked out!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.04 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("What's next?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.04 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada looks over at the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
