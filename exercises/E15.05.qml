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
                                    "text": "Pre E15.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("This one looks difficult.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's see... We need to make a program that does all this stuff:")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.05 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("When the middle front sensor detects something and both sensors beside it don't detect anything, the top LEDs become red and the bottom LEDs become blue.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.05 03"
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
                            "type": "type5",
                            "text": "E15.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When the middle front sensor detects something and both sensors beside it don't detect anything, the top LEDs become red and the bottom LEDs become blue.")
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
                                            "text": qsTr("But when the leftmost and rightmost sensors in front detect something but all the sensors in between do not, the top LEDs should become green and the bottom LEDs light blue.")
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
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","CLOSE","FAR","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[3,0,31]},{"definition":"PaletteTopColorActionBlock","params":[32,1,4]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","FAR","FAR","FAR","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[4,28,32]},{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]]]}
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
                                             "text": qsTr("Awesome, let's try it out right away!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada pushes the button and waits for the screen to react.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("The screen shows that the program was ok so she and Thymio cheer.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's try it out.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Are you sure that's a good idea?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yes!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada pushes the button and the pillars come out of the ground.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("The lights flash red.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay, so maybe it wasn't such a good idea.")
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
                                    "text": "post ex 15.05 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("More things appear on the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
