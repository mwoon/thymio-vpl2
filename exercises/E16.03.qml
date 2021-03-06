import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E16.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E16.03",
                            "answerList": [
                                "The program on top does not work.",
                                "Thymio moves forwards in the program below and backwards in the program on top.",
                                "Thymio moves backwards in the program below and forwards in the program on top.",
                                "Thymio has the same speed in both programs.",
                                "Thymio is faster in the program below.",
                                "Thymio is faster in the program on top."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,500]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E16.03"
                        }
                    ]
        }
    }
}
