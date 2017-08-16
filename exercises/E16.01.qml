import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E16.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E16.01",
                            "answerList": [
                                "If the button pointing forwards is pressed, Thymio moves backwards.",
                                "If the button pointing behind is pressed, Thymio moves backwards.",
                                "If the button pointing left is pressed, Thymio moves backwards.",
                                "If the button pointing right is pressed, Thymio moves forwards.",
                                "If the button pointing behind is pressed, Thymio moves forwards.",
                                "If the button pointing forwards is pressed, Thymio moves forwards."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E16.01"
                        }
                    ]
        }
    }
}
