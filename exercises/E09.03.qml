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
                                    "text": "Pre E09.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I keep getting confused about the sensors.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Thymio",
                                    "text": qsTr("What don't you understand?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.03 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Take a look at these two. Can you tell me what the difference is?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E09.03",
                            "answerList": [
                                qsTr("In the program on top, Thymio's LEDs change color when the sensors become uncovered and in the program below Thymio's LEDS change color when the sensors become covered."),
                                qsTr("In the program below, Thymio's LEDs change color when the sensors become uncovered and in the program on top Thymio's LEDS change color when the sensors become covered."),
                                qsTr("In the program below, Thymio's LEDs will only become green."),
                                qsTr("In the program below, Thymio's LEDs will stay green as long as the rightmost sensor is uncovered."),
                                qsTr("In the program below, Thmymio's LEDs will stay blue as long as the middle sensor is uncovered."),
                                qsTr("In the program below, Thymio's top LEDs can't change their color.")
                            ],
                            "scoreList": [0, 1, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,0,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E09.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh, okay. Thank you. I think I understand it better now.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, that's not the difference.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("In the program below, the LEDs change color when the sensors become uncovered and in the program on top the LEDS change color when the sensors become covered.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("It's like I told you. If it's black, you can't see anything so I can't detect anything.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Ok, I'll try to remember.")
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
                                    "text": "post ex 9.03 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's try out the program on top.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ruby",
                                    "text": qsTr("I want to try too!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.03 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby swoops down and covers Thymio's middle sensor with his toe. The color of Thymio's LEDs change to blue and the bird flies away again.")
                                }
                            ]
                        }
                    ]
        }
    }
}
