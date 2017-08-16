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
                                    "text": "Pre E13.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("It looks like we should pick one of these programs on the screen.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("The instructions seem to say that we need a program that will change Thymio's bottom LEDs to pick when only the two sensors behind Thymio detect something...")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E13.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","FAR","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","CLOSE","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["FAR","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","FAR","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["CLOSE","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,25]}]]]}

                            ],
                            "scoreList": [0, 1, 0, 0, 0, 0],
                            "description": qsTr("Which program will change Thymio's bottom LEDs to pink when only the two sensors behind Thymio detect something?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E13.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yeah, that has to be the right one!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("I think that isn't the right one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Huh really? I was sure it was right too.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": "Hmm..."
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh. I see. It should be this other one.")
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
                                    "text": "post ex 13.02 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There's no time like now to try, right?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.02 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada chooses the program on the screen.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.02 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("After a moment there's a green light from the device.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.02 05"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Great! I think it worked.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.02 06"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The screen flashes and Ada quickly looks at it.")
                                }
                            ]
                        }
                    ]
        }
    }
}
