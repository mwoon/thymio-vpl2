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
                                    "text": "Pre E14.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Oh no, there are a lot of programs on the screen.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Please help me figure out which one we need!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E14.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[0,28,32]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,2]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[0,28,32]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,2]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","FAR","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,29,31]}]],[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","FAR","CLOSE","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,0,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","DISABLED","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,29,32]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","FAR","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,2]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,29,32]}]],[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","FAR","CLOSE","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[31,0,2]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[0,28,32]}]],[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","FAR","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,2]}]]]}

                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "description": qsTr("We're looking for a program where: 1. Thymio's bottom LEDs will change to red when the outer two sensors in front detect nothing and the two sensors behind detect something. 2. Thymio's top LEDs will change to light blue when all the sensors in front but the middle one detect something.")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E14.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Aha! So that was the one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("It must have been easy for you, right?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Of course! people on Earth are all very smart!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada loads the code into Thymio and waits for more instructions on the screen.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada loads the code into Thymio and presses the button.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Suddenly, a red light flashes from the screen.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada hides behind Thymio, but the light soon stops and the screen blinks a few times.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I guess that was the wrong one...?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Looks like we'll have to see what it wants now.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
