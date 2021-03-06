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
                                    "text": "Pre E09.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada searches the tablet and then sighs.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.05 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There aren't any useful programs on the tablet at the moment.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.05 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("In that case, let's make our own!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.05 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("The program should make Thymio's top LEDs turn green when the second sensor from the right detects something and they should turn light blue when the second sensor from the left detects something.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E09.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("The program should make Thymio's top LEDs turn green when the second sensor from the right detects something and they should turn light blue when the second sensor from the left detects something.")
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
                            "solution":{"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,27,31]}]]]}
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
                                             "text": qsTr("Good job!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's try it out right now.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ruby laughs as Thymio's color changes when Ada runs past Thymio.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada shakes her head.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("That's not what I thought it should do.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh well, maybe there'll be something useful on the tablet now.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ruby watches her from afar.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
