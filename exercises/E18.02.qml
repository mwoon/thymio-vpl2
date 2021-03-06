import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E18.02"
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E18.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"frontRight"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"frontLeft"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]}],[{"definition":"MotorActionBlock","params":[-500,500]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[500,50]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[500,-500]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "description": "One of these programs has to let Thymio turn to the right on the spot... Which one is it?"
                        },
                        {
                            "cmd": "text",
                            "text": "post E18.02"
                        }
                    ]
        }
    }
}
