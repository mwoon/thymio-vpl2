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
                                    "text": "Pre E10.02 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Here are some programs I found with the colors yellow and orange.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E10.02 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Which one of these do you think will let Thymio change his top LEDs' color to yellow when the right button is pressed and to orange when the right bottom sensor is covered?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E10.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["FAR","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["DISABLED","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,4]}]],[[{"definition":"ProxGroundEventBlock","params":["DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]}

                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "description": qsTr("Which program will let Thymio change his top LEDs' color to yellow when the right button is pressed and to orange when the right bottom sensor is covered?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E10.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I agree! that has to be the one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's test it.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Really? I would have picked a different one.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("I think Ada might be right.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay, let's use this other one then.")
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
                                    "text": "post ex 10.02 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada presses the right button on Thymio and watches his color change to yellow. Then she stands in front of him and his color changes to orange.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 10.02 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Suddenly, Ruby flies down and taps Thymio's right button again and the color changes back to yellow.")
                                }
                            ]
                        }
                    ]
        }
    }
}
