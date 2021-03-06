import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E20.02"
                        },
                        {
                            "cmd": "ex",
                            "type": "type2",
                            "text": "E20.02",
                            "answerList": [
                                {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["FAR","FAR"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxGroundEventBlock","params":["DISABLED","CLOSE"]},{"definition":"ProxGroundEventBlock","params":["CLOSE","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,500]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[500,500]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorActionBlock","params":[0,0]}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},

                                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}

                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "description": "Okay, we need a program that will make Thymio stop if he senses anything in front of him and move forwards only if he's sure there's nothing in front of him."
                        },
                        {
                            "cmd": "text",
                            "text": "post E20.02"
                        }
                    ]
        }
    }
}
