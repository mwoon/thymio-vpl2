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
                                    "text": "Pre E06.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let's try to change Thymio's top LEDs to blue when the left button is pressed.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada pokes around on the tablet.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E06.03 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I found two programs... But what is the difference between them?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E06.03",
                            "answerList": [
                                qsTr("The program on top is slightly brighter."),
                                qsTr("The program below is slightly brighter."),
                                qsTr("They are the same."),
                                qsTr("In the program on top, the right button has to be pressed. In the program below, the left button has to be pressed."),
                                qsTr("In the program on top, the left button has to be pressed. In the program below, the right button has to be pressed."),
                                qsTr("The program below will not work. Only the one on top works.")
                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,1,32]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"TopColorActionBlock","params":[0,1,32]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E06.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I see, so there are two different ways to do the same thing.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, there's no difference at all. They are just two different ways to choose colors.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh so that's what it was.")
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
                                    "text": "post ex 6.03 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The program starts and Ada presses the button on Thymio.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.03 2"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ruby flies around in a circle, coming closer and moving away again.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 6.03 3"
                                },{

                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("He looks very interested in Thymio now.")
                                }
                            ]
                        }
                    ]
        }
    }
}
