import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E17.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E17.01",
                            "answerList": [
                                "When the button pointing left is pressed, Thymio moves forwards.",
                                "When the button pointing behind is pressed, Thymio moves backwards.",
                                "When the button pointing in front is pressed, Thymio moves forwards.",
                                "When the button pointing behind is pressed, Thymio moves forwards When the button pointing forwards is pressed Thymio stop.",
                                "When the right button is pressed, Thymio moves forwards. When the left button is pressed Thymio stops.",
                                "When the left button is pressed, Thymio moves forwards. When the right button is pressed Thymio stops."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E17.01"
                        }
                    ]
        }
    }
}
