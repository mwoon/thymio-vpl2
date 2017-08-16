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
                                    "text": "Pre E13.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I'm not sure I understand the instructions correctly.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.05 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("It seems to say that we should make Thymio's bottom LEDs turn orange when all the sensors on his left detect something.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E13.05",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("When all of Thymio's sensors on the left detect something, his bottom LEDs should turn orange.")
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
                                    "ground_img": "darklight.png",
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
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED"]},{"definition":"ProxGroundEventBlock","params":["CLOSE","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,19,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E13.05 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Looks good to me! Let's test it.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Wait, let me make some changes. It didn't look quite correct.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Wait, let me make some changes. It didn't look correct.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Are you sure your changes are going to make it better?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hey!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Just trust me on this one.")
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
                                    "text": "post ex 13.05 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars shoot out of the ground again and accept the result.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.05 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada happily hops back to the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
