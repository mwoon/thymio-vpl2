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
                                    "text": "Pre E13.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Let me take a look and see if I can find something matching on the tablet.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada clicks around on the tablet.")
                                }
                            ]
                        },

                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.03 03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Ok, one of these two could work.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.03 04"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But what's the difference between them?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E13.03",
                            "answerList": [
                                qsTr("The program on top is wrong and won't work because there are two of the same orange blocks."),
                                qsTr("In the program below, Thymio's bottom LEDs change color only whenever the two bottom sensors detect nothing at exactly the same time."),
                                qsTr("In the program on top, Thymio's bottom LEDs change color whenever first the right sensor detects nothing and then the left sensor detects nothing."),
                                qsTr("In the program on top, Thymio's bottom LEDs change color whenever first the left sensor detects nothing and then the right sensor detects nothing."),
                                qsTr("They are the same."),
                                qsTr("In the program on top, Thymio's bottom LEDs change color whenever any of the two sensor detect nothing.")
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["DISABLED","FAR"]},{"definition":"ProxGroundEventBlock","params":["FAR","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[27,2,0]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["FAR","FAR"]}],[{"definition":"PaletteBottomColorActionBlock","params":[27,2,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E13.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh yeah, that makes sense.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("The one on top doesn't work.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Really? Why?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("A program with two same blocks won't work because it might be impossible to make both events happen at the same time.")
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
                                    "text": "post ex 13.03 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("So we should use the bottom one.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.03 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada loads the bottom program into Thymio.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.03 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The floor underneath Thymio's bottom sensors drops down but then quickly comes back up.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.03 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("That is kind of scary, you know...")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.03 05"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Let's see what we have to do next.")
                                }
                            ]
                        }
                    ]
        }
    }
}
