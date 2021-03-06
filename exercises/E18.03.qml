import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E18.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E18.03",
                            "answerList": [
                                "In the program above Thymio turns backwards.",
                                "In the program below, Thymio turns backwards.",
                                "In the program below, Thymio turns to the left.",
                                "They are the same.",
                                "In the program below, Thymio turns in a bigger circle.",
                                "In the program on top, Thymio turns in a bigger circle."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,350.0000000000001]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,100.00000000000011]}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E18.03"
                        }
                    ]
        }
    }
}
