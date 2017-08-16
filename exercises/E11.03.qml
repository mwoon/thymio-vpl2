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
                                    "text": "Pre E11.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("These two programs are very similar.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But it would be weird if they are the same.")
                                }
                            ]
                        },{
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.03 03"
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
                            "text": "E11.03",
                            "answerList": [
                                qsTr("In the program on top, If the second sensor on the left stays covered, Thymio will not change his top LEDs to green if the left most sensor is uncovered."),
                                qsTr("They are the same."),
                                qsTr("In the program on top, Thymio will only change his top LEDs to green once."),
                                qsTr("In the program on top, Thymio will never change his top LEDs to green."),
                                qsTr("In the program below, Thymio will only change his LEDs to green if the second sensor from the left is uncovered and then covered again."),
                                qsTr("In the program on top, it is possible for Thymio to change his top LEDs to green even if the second sensor from the left stays covered.")
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Ah! That's how it is. Because in the first program, the green top color action only reacts to the second sensor from the left and doesn't care about the one all the way on the left.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Are you sure?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, the difference is that in the program on top, If the second sensor on the left stays covered, the top LEDs will not change to green if the left most sensor becomes uncovered.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Because in the first program, the green top color action only reacts to the second sensor from the left and doesn't care about the one all the way on the left.")
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
                                    "text": "post ex 11.03 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("While Thymio and Ada discuss the program, Ruby lands on the cliff to get a closer look.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("As soon as Ada notices him, he flies away again.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada looks at the program again, making sure she understands it.")
                                }
                            ]
                        }
                    ],

                    "story4list": [
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.03 00"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think one of these two programs will match what it says on the screen.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But they are very similar.")
                                }
                            ]
                        },{
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E11.03 03"
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
                            "text": "E11.03",
                            "answerList": [
                                qsTr("In the program on top, If the second sensor on the left stays covered, Thymio will not change his top LEDs to green if the left most sensor is uncovered."),
                                qsTr("They are the same."),
                                qsTr("In the program on top, Thymio will only change his top LEDs to green once."),
                                qsTr("In the program on top, Thymio will never change his top LEDs to green."),
                                qsTr("In the program below, Thymio will only change his LEDs to green if the second sensor from the left is uncovered and then covered again."),
                                qsTr("In the program on top, it is possible for Thymio to change his top LEDs to green even if the second sensor from the left stays covered.")
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[4,31,0]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[31,20,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E11.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Ah! That's how it is. Because in the first program, the green top color action only reacts to the second sensor from the left and doesn't care about the one all the way on the left.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Are you sure?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, the difference is that in the program on top, If the second sensor on the left stays covered, the top LEDs will not change to green if the left most sensor becomes uncovered.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Because in the first program, the green top color action only reacts to the second sensor from the left and doesn't care about the one all the way on the left.")
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
                                    "text": "post ex 11.03 2"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Ok, so from what we know now, we should take the program below to match what it says on the screen.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads the program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.03 3"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The pillars come out again and Thymio changes colors to match the sensors.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 11.03 4"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Once more, the screen changes.")
                                }
                            ]
                        }
                    ]

    }
}
