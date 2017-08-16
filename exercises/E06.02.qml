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
                                    "text": "Pre E06.02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Here are some programs I found!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E06.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,1]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,3]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,0,1]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[8,0,32]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,1]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[8,0,32]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "description": qsTr("How can Thymio change his top LEDs to red when the button pointing right is pressed?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E06.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("This one should be perfect!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hmm, I don't think that's the one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("It should be another one...")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "",
                                             "text": qsTr("Ada picks a different program.")
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
                                    "text": "post ex 6.02 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads up the program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.02 3"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Thymio's top LEDs change to red as Ada presses the right button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.02 4"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby looks at them curiously.")
                                }
                            ]
                        }
                    ]
        }
    }
}
