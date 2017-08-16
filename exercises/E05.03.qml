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
                                    "text": "pre ex 5.03 1"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Hey, take a look at this. What's the difference between these two?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E05.03",
                            "answerList": [
                                qsTr("In the program on top, Thymio stops when all of his sensors detect something. In the program below, Thymio stops when any of his sensors detect something."),
                                qsTr("In the program on top, Thymio stops when any of his sensors detect something. In the program below, Thymio stops when all of his sensors detect something."),
                                qsTr("They are the same."),
                                qsTr("In the program on top, Thymio stops when none of his sensors detect anything. In the program below, Thymio stops when any of his sensors detect nothing."),
                                qsTr("In the program on top, Thymio stops when any of his sensors detect nothing. In the program below, Thymio stops when none of his sensors detect anything."),
                                qsTr("The program on top will not work. Only the one below works.")
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E05.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh! That makes sense.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Thank you for helping me understand.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Huh?! Really?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, that isn't right.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("The top one only activates when all of my front sensors detect something.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("That means if only one of them detects something, I'll still crash.")
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
                                    "text": "post ex 5.03 2"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("The bottom one seems safer. Let's use that one.")
                                }
                            ]
                        }
                    ]
        }
    }
}
