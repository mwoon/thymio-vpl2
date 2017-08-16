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
                                    "text": "Pre E09.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think we can do something with this program here.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There are only some LED actions on it, so let's add some sensor events to activate them. I'll leave it to you to finish it.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.04 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("How about this: When the second sensor from the left does not detect anything, Thymio's top LEDs turn light blue. When the second sensor from the right detects something, Thymio's top LEDs turn green!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E09.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Do this: When the second sensor from the left does not detect anything, Thymio's top LEDs turn light blue. When the second sensor from the right detects something, Thymio's top LEDs turn green!")
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
                            "scene": [{
                                    "checkfor": [{"type": "topcolor", "time" : 18, "color": "green"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[72, 16.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "topcolor", "time" : 3, "color": "light blue"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[52, 22.4], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                }],
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,27,31]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[],[{"definition":"PaletteTopColorActionBlock","params":[0,27,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E09.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's great! Exactly how I thought it should be!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Uhm, that's not quite what I wanted. But Maybe we can still use this?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada checks the program and fixes it up a little bit.")
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
                                    "text": "post ex 9.04 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ruby",
                                    "text": qsTr("Hey, what're you doing down there now?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.04 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Come and see for yourself!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.04 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby shakes his head and stays in the air.")
                                }
                            ]
                        }
                    ]
        }
    }
}
