import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E22.02"
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E22.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,32,5]},{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"},{"definition":"PaletteTopColorActionBlock","params":[32,0,1]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,4]},{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"},{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,4]},{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"},{"definition":"PaletteTopColorActionBlock","params":[0,31,5]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,32,8]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,3]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,32,8]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,0,3]}]]]}

                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "description": "A program that will make Thymio move forwards and light the way green. But he should also stop in case there is a dead end... Which one is it?"
                        },
                        {
                            "cmd": "text",
                            "text": "post E22.02"
                        }
                    ]
        }
    }
}
