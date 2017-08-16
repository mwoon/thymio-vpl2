import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E20.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E20.03",
                            "answerList": [
                                "In the program on top, Thymio would not stop if all his front sensors detected something. But in the program below he would.",
                                "In the program below, Thymio would stop if all of his front sensors detected something. But in the program on top he would not.",
                                "In the program below, Thymio would not stop if all of his front sensors detected something at the same time.",
                                "In the program on top, Thymio stops if any of the sensors detect something.",
                                "They are the same.",
                                "In the program below, Thymio stops if any of the sensors detect something. But not in the program on top."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E20.03"
                        }
                    ]
        }
    }
}
