import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E20.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E20.01",
                            "answerList": [
                                "Thymio moves if all of his front sensors detect nothing. Thymio stops if any of his front sensors detect something.",
                                "Thymio stops if all of his front sensors detect nothing. Thymio moves if all of his front sensors detect something.",
                                "Thymio stops if any of his front sensors detect nothing. Thymio moves if all of his front sensors detect something.",
                                "Thymio moves if any of his front sensors detect nothing. Thymio stops if any of his front sensors detect something.",
                                "Thymio moves if any of his front sensors detect nothing. Thymio stops if all of his front sensors detect something.",
                                "Thymio moves if all of his front sensors detect nothing. Thymio stops if all of his front sensors detect something."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E20.01"
                        }
                    ]
        }
    }
}
