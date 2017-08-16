import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E19.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E19.03",
                            "answerList": [
                                "Only in the program below Thymio doesn't turn to the right.",
                                "Only in the program on top Thymio doesn't turn to the right.",
                                "Only in the program below Thymio doesn't turn to the left.",
                                "Only in the program on top Thymio doesn't turn to the left.",
                                "In the program below, Thymio doesn't turn to the right.",
                                "In both programs, Thymio doesn't turn to the left."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,-500]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[-500,500]}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E19.03"
                        }
                    ]
        }
    }
}
