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
                                    "text": "Pre E13.04 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I'm not sure which sensors have to be activated for the program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.04 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think when all of Thymio's sensors on the left detect something, his bottom LEDs should turn orange.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.04 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Help me set the sensors so that all of those on the left should detect something!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E13.04",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("I think when all of Thymio's sensors on the left detect something, his bottom LEDs should turn orange.")
                                        }
                                    ]
                                }
                            ],
                            "method": "sim",
                            "scene": [
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "botcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1, "color": "orange"}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "darklight.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 26.1], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 25], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "notbotcolor", "time" : 1}],
                                    "duration": 2,
                                    "worldSize": [100, 40],
                                    "walls": [
                                        {"position":[50, 25], "angle":0, "size": [2, 2, 10]},
                                        {"position":[35, 23.5], "angle":0, "size": [2, 2, 10]}
                                    ],
                                    "ground_img": "lightdark.png",
                                    "thymio" : { "position": [40, 20], "angle": 0 }
                                }],
                            "solution":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED"]},{"definition":"ProxGroundEventBlock","params":["CLOSE","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,19,0]}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxGroundEventBlock","params":["DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,19,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E13.04 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": "Alright! That's it!"
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hmm... It's just missing a little bit. Let me fix that up.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, no, I think that's not all the sensors on the left.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let me change it a bit.")
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
                                    "text": "post ex 13.04 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They upload the program to Thymio and Ada presses the button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.04 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The machine shows that it accepts the program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.04 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada takes another look at the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
