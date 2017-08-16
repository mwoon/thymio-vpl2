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
                                    "text": "Pre E11.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("This program here is pretty weird.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Can you tell me what it does?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E11.01",
                            "answerList": [
                                qsTr("When the leftmost and rightmost sensors in front don't detect anything, Thymio's top LEDs become blue."),
                                qsTr("When all the sensors between the leftmost and rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When the leftmost and rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When the leftmost or rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When all the sensors between the leftmost and rightmost sensors in front don't detect anything, Thymio's top LED's become blue."),
                                qsTr("When any of the sensors between the leftmost and rightmost sensors in front detect anything, Thymio's top LEDs become blue.")
                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Aha! So it's nothing special.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thanks!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, that's not right.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("When the leftmost and rightmost sensors in front detect something, my top LEDs become blue.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh, so that's what it does.")
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
                                    "text": "post ex 11.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads the program into Thymio from the tablet and stands in front of him.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("She stretches her hands out so they both cover his outermost sensors.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hurray!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 5"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Thymio's color changes to blue and she jumps in joy.")
                                }
                            ]
                        }
                    ],


                    "story4list" : [
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think I can match what it says on the screen to Thymio's blocks!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada taps around on the tablet trying to make the right program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay, what do you think this program does?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E11.01",
                            "answerList": [
                                qsTr("When the leftmost and rightmost sensors in front don't detect anything, Thymio's top LEDs become blue."),
                                qsTr("When all the sensors between the leftmost and rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When the leftmost and rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When the leftmost or rightmost sensors in front detect something, Thymio's top LEDs become blue."),
                                qsTr("When all the sensors between the leftmost and rightmost sensors in front don't detect anything, Thymio's top LED's become blue."),
                                qsTr("When any of the sensors between the leftmost and rightmost sensors in front detect anything, Thymio's top LEDs become blue.")
                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Great! We thought the same thing.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I'll load it into Thymio and then we can press the button.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Hmm... But that's not what I thought.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("The program was supposed to make Thymio's top color turn blue when the leftmost and rightmost sensor in front detect something.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, I think Ada is right.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Let's try out the program.")
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
                                    "text": "post ex 11.01 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads the program into Thymio from the tablet and then presses the button.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars shoot out of the ground and check Thymio.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hurray!")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.01 5"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars drop back into the ground with a short green light. After that, the screen changes.")
                                }
                            ]
                        }
                    ]
        }

    }
}
