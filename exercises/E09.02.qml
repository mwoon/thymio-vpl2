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
                                    "text": "Pre E09.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("How about green and blue?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("A program that makes Thymio's top LEDs turn blue when his middle front sensor detects something and turn green when the rightmost sensor detects something...")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.02 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada clicks around on the tablet.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.02 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I found a whole lot of programs. One of these has to do what I want, right?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E09.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,4]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[5,0,31]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,4]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[5,0,31]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[3,0,31]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "description": qsTr("Which program will let Thymio's top LEDs become blue when the middle sensor is covered and green when the rightmost sensor is covered?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E09.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yay, you found one!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("I don't think it's that one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Try the other one...")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada looks for the one Thymio is pointing at.")
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
                                    "text": "post ex 9.02 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay, I'll try it out now.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.02 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The program works. Thymio's color changes to green and then too blue.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.02 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby flaps his wings in excitement.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.02 5"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ruby",
                                    "text": qsTr("Do it again! Do it again!")
                                }
                            ]
                        }
                    ]
        }
    }
}
