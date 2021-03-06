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
                                    "text": "Pre E04.02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("There are a bunch of programs here! One of them has to move Thymio forwards, right?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E04.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"backLeft"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"frontRight"}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "description": qsTr("Which program will help Thymio move forwards?")
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E04.02 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Looks like you got the right one!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I don't think so...")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
