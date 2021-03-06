import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E16.02"
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E16.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"frontLeft"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"frontRight"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "description": "Thymio should move forwards when the middle button is pressed."
                        },
                        {
                            "cmd": "text",
                            "text": "post E16.02"
                        }
                    ]
        }
    }
}
