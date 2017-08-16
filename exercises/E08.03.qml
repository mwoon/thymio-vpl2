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
                                    "text": "Pre E08.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hmm... These two programs are very confusing...")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E08.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("What do you think the difference is?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E08.03",
                            "answerList": [
                                qsTr("The colors are different."),
                                qsTr("In both programs Thymio's LEDs will be yellow when the right button is pressed."),
                                qsTr("In the program on top, Thymio's LEDs will be yellow if the right button is pressed and in the program below they will be blue."),
                                qsTr("In both programs Thymio's LEDs will be blue when the right button is pressed."),
                                qsTr("In both programs, when the right button is pressed, sometimes the LEDs will be blue and sometimes they will be yellow."),
                                qsTr("In the program on top, Thymio's LEDs will be blue if the right button is pressed and in the program below they will be yellow.")
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,32,4]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,32,4]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E08.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh that makes sense!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, that's not wrong.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("If both of the events are the same, then the one that is further up will happen.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("So that's how it is...")
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
                                    "text": "post ex 8.03 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's use the bottom one. I like yellow more.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby flies a bit closer when he sees Thymio's LEDs change to yellow, but he quickly flies away again.")
                                }
                            ]
                        }
                    ]
        }
    }
}
