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
                                    "text": "Pre E04.03"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I found two programs here. They're definitely different but I can't tell what's different.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E04.03",
                            "answerList": [
                                qsTr("In the program on top, Thymio moves backwards. In the program below, Thymio moves forwards."),
                                qsTr("Thymio moves forwards more quickly in the program below than in the program on top."),
                                qsTr("In the program on top, Thymio moves forwards. In the program below, Thymio moves backwards."),
                                qsTr("Thymio moves forwards more quickly in the program on top than in the program below."),
                                qsTr("Thymio moves backwards more quickly in the program on top than in the program below."),
                                qsTr("Thymio moves forwards more quickly in the program below than in the program on top."),
                                qsTr("There is no difference.")
                            ],
                            "scoreList": [0, 0, 1, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]},
                            "code2": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E04.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Oh that sounds about right!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Are you sure? it doesn't look like that to me...")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
