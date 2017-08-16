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
                                    "text": "Pre E10.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hey, guess what this program does that I just found!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E10.01",
                            "answerList": [
                                qsTr("When the middle button in front of Thymio is pressed, Thymio's top LEDs become yellow and when the right sensor on top of Thymio is covered, Thymio's top LEDs become red."),
                                qsTr("When the middle sensor below Thymio is covered, Thymio's top LEDs become yellow and when the right button is pressed, Thymio's top LEDs become red."),
                                qsTr("When the middle sensor below Thymio is covered, Thymio's top LEDs become yellow and when the front button is pressed, Thymio's top LEDs become red."),
                                qsTr("When the middle sensor in front is covered, Thymio's top LEDs become yellow and when the front button is pressed, Thymio's top LEDs become red."),
                                qsTr("When the middle sensor in front is covered, Thymio's top LEDs become yellow and when the right button is pressed, Thymio's top LEDs become red."),
                                qsTr("When the middle sensor in front is not covered, Thymio's top LEDs become yellow and when the right button is pressed, Thymio's top LEDs become red.")
                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,2]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,5]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E10.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yes!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's use it right away!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, that's not right.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("When the middle sensor in front is covered, Thymio's top LEDs become yellow and when the right button is pressed, Thymio's top LEDs become red!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I think I'm getting better at this stuff!")
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
                                    "text": "post ex 10.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("They try out the program and watch the color change between yellow and red.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 10.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby looks like he wants to try too, but he stays away.")
                                }
                            ]
                        }
                    ]
        }
    }
}
