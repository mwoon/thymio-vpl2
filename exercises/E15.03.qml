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
                                    "text": "Pre E15.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("One of these two has to be what the screen wants.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But what's the difference between them?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E15.03",
                            "answerList": [
                                qsTr("In the program on top, Thymio's LEDs will never be red  if the back sensors stay uncovered."),
                                qsTr("They are the same."),
                                qsTr("In the program below, Thymio's LEDs will only be light blue once if the back sensors stay uncovered. They won't change back after changing to red."),
                                qsTr("In the program on top, Thymio's LEDs will only be light blue once  if the back sensors stay uncovered. They won't change back after changing to red."),
                                qsTr("In the program below, Thymio's LEDs will only be red once if the back sensors stay uncovered. They won't change back after changing to light blue."),
                                qsTr("In the program on top, Thymio's LEDs will only be red once if the back sensors stay uncovered. They won't change back after changing to light blue.")
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,1]},{"definition":"PaletteBottomColorActionBlock","params":[31,0,2]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[8,28,32]},{"definition":"PaletteBottomColorActionBlock","params":[0,28,30]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","FAR","DISABLED","FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,1]},{"definition":"PaletteBottomColorActionBlock","params":[31,0,2]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[8,28,32]},{"definition":"PaletteBottomColorActionBlock","params":[0,28,30]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E15.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh I see!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That can't be right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("You're right Ada.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay, but why?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("The answer is that in the program on top, the LEDs will only be red once if the back sensors stay uncovered. They won't change back after changing to light blue.")
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
                                    "text": "post ex 15.03 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("That's exactly what the screen wants.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.03 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I'll give it the answer now.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.03 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The screen lights up, accepting the answer.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.03 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They wait for more instructions from the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
