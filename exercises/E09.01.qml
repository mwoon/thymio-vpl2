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
                                    "text": "Pre E09.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("This program uses sensors to turn on Thymio's LEDs.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E09.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But what exactly does it do?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E09.01",
                            "answerList": [
                                qsTr("When all the sensors except the second from the left are not covered, Thymio's top LEDs become pink and when all the sensors except the rightmost are not covered, Thymio's top LEDs become red."),
                                qsTr("When all the sensors except the second from the left are covered, Thymio's top LEDs become pink and when all the sensors except the rightmost are covered, Thymio's top LEDs become red."),
                                qsTr("When the second sensor from the left is covered, Thymio's top LEDs become pink and when the rightmost sensor is covered, Thymio's top LEDs become red."),
                                qsTr("When the second sensor from the left is not covered, Thymio's top LEDs become pink and when the rightmost sensor is not covered, Thymio's top LEDs become red."),
                                qsTr("When the rightmost sensor is covered, Thymio's top LEDs become pink and when the second sensor from the left is covered, Thymio's top LEDs become red."),
                                qsTr("When the rightmost sensor is not covered, Thymio's top LEDs become pink and when the second sensor from the left is not covered, Thymio's top LEDs become red.")
                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,0,26]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,1,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E09.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("That's right. Good job!")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh I see!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, that's not what it does.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("My LEDs on top should  turn pink if the second sensor from the left is covered and they should turn red if the last sensor on the right is covered.")
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
                                    "text": "post ex 9.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Now that we know what it does, let's use it!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 9.01 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Thymio's color changes from pink to red and back.")
                                }
                            ]
                        }
                    ]
        }
    }
}
