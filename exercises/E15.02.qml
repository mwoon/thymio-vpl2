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
                                    "text": "Pre E15.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("We need to choose one of these.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Do you know which one it should be?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E15.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,32,32]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]},{"definition":"PaletteBottomColorActionBlock","params":[32,30,29]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]},{"definition":"PaletteBottomColorActionBlock","params":[32,31,31]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,32,32]},{"definition":"PaletteTopColorActionBlock","params":[32,32,32]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","CLOSE","CLOSE","DISABLED","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","DISABLED","CLOSE","DISABLED","CLOSE"]}],[{"definition":"PaletteBottomColorActionBlock","params":[32,32,32]},{"definition":"PaletteTopColorActionBlock","params":[32,32,32]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","CLOSE"]},{"definition":"ProxEventBlock","params":["CLOSE","FAR","CLOSE","FAR","FAR","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]},{"definition":"PaletteBottomColorActionBlock","params":[32,30,29]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","CLOSE","CLOSE","DISABLED","CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,31,31]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,32,32]}]]]}

                            ],
                            "scoreList": [0, 1, 0, 0, 0, 0],
                            "description": qsTr("Which program will make Thymio's bottom and top LEDs white when all of Thymio's front and back sensors detect something?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E15.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That should be the right one!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That can't be right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Why don't you pick one then, Ada?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay, I will.")
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
                                    "text": "post ex 15.02 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada gives the screen the answer.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.02 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("After a moment, the screen indicates that it was the right answer.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.02 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada looks happy, but she turns back to the screen to see what it says now.")
                                }
                            ]
                        }
                    ]
        }
    }
}
