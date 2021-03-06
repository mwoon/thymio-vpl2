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
                                    "text": "Pre E11.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay, I've got a bunch of programs with green and orange top color actions here.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hmmm... What should we do?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.02 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay how about this: A program that will let Thymio change his top LEDs to orange when the two leftmost sensors detect something and green when only the second sensor from the left detects something")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E11.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","FAR","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]],[[{"definition":"ProxEventBlock","params":["FAR","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "description": qsTr("Which program will let Thymio change his top LEDs to orange when the two leftmost sensors detect something and green when only the second sensor from the left detects something?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's a perfect fit!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thanks for finding it!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada switches the top LEDs from green to orange.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada tries out the program.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hmm... This doesn't seem to be the right one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's look for a different program.")
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
                                    "text": "Pre E11.02 00"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("So... the screen wants something with green and orange colors.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I've got a bunch of programs with green and orange top color actions here.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("What does it want exactly...?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.02 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think it should be like this: A program that will let Thymio change his top LEDs to orange when the two leftmost sensors detect something and green when only the second sensor from the left detects something.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E11.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,1]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","FAR","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]],[[{"definition":"ProxEventBlock","params":["FAR","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "description": qsTr("Which program will let Thymio change his top LEDs to orange when the two leftmost sensors detect something and green when only the second sensor from the left detects something?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's a perfect fit!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thanks for finding it!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada loads the program into Thymio and presses the button.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada tries out the program on Thymio.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("This doesn't do what it says on the screen.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I think it should be this other one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada tries out a different program and presses the button.")
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
                                    "text": "post ex 11.03 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Everything seems to be okay and the screen changes.")
                                }
                            ]
                        }
                    ]
        }

    }
}
