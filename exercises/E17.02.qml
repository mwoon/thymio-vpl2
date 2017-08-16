import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E17.02"
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E17.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[-199.99999999999994,-199.99999999999994]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,500]}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[500,-500]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"back"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[0,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorActionBlock","params":[0,0]}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "description": "Let's see... Thymio should be able to move forwards and stop."
                        },
                        {
                            "cmd": "text",
                            "text": "post E17.02"
                        }
                    ]
        }
    }
}
