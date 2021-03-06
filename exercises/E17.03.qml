import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E17.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E17.03",
                            "answerList": [
                                "The program on top is wrong.",
                                "The program below is wrong.",
                                "The program on top will turn Thymio off if the middle button is pressed.",
                                "In the program on top Thymio will not stop.",
                                "In the program below Thymio will not stop.",
                                "They are the same."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[0,0]}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E17.03"
                        }
                    ]
        }
    }
}
