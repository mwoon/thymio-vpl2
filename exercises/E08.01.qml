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
                                    "text": "Pre E08.01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's use two buttons!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E08.01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hmm... This program here has two buttons. What does it do?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E08.01",
                            "answerList": [
                                qsTr("When the button pointing left is pressed, Thymio's top LEDs become yellow and when the button pointing in front is pressed, Thymio's top LEDs become light blue."),
                                qsTr("When the button pointing behind is pressed, Thymio's top LEDs become light blue and when the button pointing right is pressed, Thymio's top LEDs become yellow."),
                                qsTr("When the button pointing right is pressed, Thymio's top LEDs become light blue and when the button pointing in front is pressed, Thymio's top LEDs become yellow."),
                                qsTr("When the button pointing left is pressed, Thymio's top LEDs become light blue and when the button pointing in front is pressed, Thymio's top LEDs become yellow."),
                                qsTr("When the button pointing behind is pressed, Thymio's top LED's become yellow and when the button pointing right is pressed, Thymio's top LEDs become light blue."),
                                qsTr("When the button pointing behind is pressed, Thymio's top LED's become yellow and when the button pointing left is pressed, Thymio's top LEDs become light blue.")
                            ],
                            "scoreList": [0, 0, 0, 1, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,29,31]}]],[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[30,32,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E08.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That'll probably make Ruby happy.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Let's try it out.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Are you sure? That just doesn't seem right")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("We could just try it out.")
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
                                    "text": "post ex 8.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada tries out the program and presses the buttons.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.01 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Thymio's top color changes to light blue when the left button is pressed by Ada and it changes to yellow when the front button is pressed.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 8.01 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada keeps changing Thymio's color for a while. This makes Ruby watch them play.")
                                }
                            ]
                        }
                    ]
        }

    }
}
