import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E19.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E19.01",
                            "answerList": [
                                "Thymio turns forwards when the left button is pressed. Thymio turns backwards when the front button it pressed.",
                                "Thymio turns backwards when the left button is pressed. Thymio turns forwards when the front button is pressed.",
                                "Thymio turns left when the front button is pressed. Thymio turns right when the right button is pressed.",
                                "Thymio turns left when the right button is pressed. Thymio turns right when the left button is pressed.",
                                "Thymio turns left when the left button is pressed. Thymio turns right when the right button is pressed.",
                                "Thymio turns left when the left button is pressed. Thymio turns right when the front button is pressed."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]],[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E19.01"
                        }
                    ]
        }
    }
}
