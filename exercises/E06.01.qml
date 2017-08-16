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
                                    "text": "Pre E06.01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Alright, here's a program I just made!")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E06.01",
                            "answerList": [
                                qsTr("When the button pointing behind is pressed, Thymio's top LEDs become green."),
                                qsTr("When the button pointing left is pressed, Thymio's top LEDs become green."),
                                qsTr("When the button pointing behind is pressed, Thymio's top LEDs become blue."),
                                qsTr("When the button pointing right is pressed, Thymio's bottom LEDs become green."),
                                qsTr("When the button pointing in front is pressed, Thymio's bottom LEDs become green."),
                                qsTr("When the button pointing in front is pressed, Thymio's top LEDs become green.")
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,32,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E06.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's what I was going for!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, that wasn't what I wanted it to do.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("The top LEDs should turn green when the front button is pressed!")
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
                                    "text": "post ex 6.01 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada presses the button pointing in front on Thymio and his top LEDs change to green.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.01 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby looks at the color closely.")
                                }
                            ]
                        }
                    ]
        }
    }
}
