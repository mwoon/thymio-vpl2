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
                                    "text": "pre ex 5.02 1"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay... So what does this program do?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E05.01",
                            "answerList": [
                                qsTr("Thymio stops."),
                                qsTr("Thymio stops if all his sensors in front detect nothing."),
                                qsTr("Thymio stops if any of his sensors in front detect something."),
                                qsTr("Thymio stops if all his sensors in front detect something."),
                                qsTr("Thymio stops if any of his sensors in front detect nothing."),
                                qsTr("Thymio stops if one of his sensors in front detect something.")
                            ],
                            "scoreList": [0, 0, 0, 1, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E05.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's what I thought too!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No, I don't think so.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Doesn't it make Thymio stop when all his sensors detect something?")
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
                                    "text": "post ex 5.01 2"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But that's not exactly what we need right?")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "post ex 5.01 3"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("We need a program that'll make him stop if there's something in front, not just when it's all around him.")
                                }
                            ]
                        }
                    ]
        }
    }
}
