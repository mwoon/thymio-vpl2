import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E22.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E22.01",
                            "answerList": [
                                "When Thymio's middle front sensor detects nothing, his top LEDs turn green and he moves forwards. When his middle front sensor detects something, he stops and his color changes to red.",
                                "When Thymio's middle front nothing in front of him, he stops and his top LEDs turn red. When his middle front sensor detects something, he moves forwards and his top LEDs turn green.",
                                "When Thymio's middle front sensor detects nothing, only his top LEDs turn green. When his middle front sensor detects something, Thymio only stops.",
                                "When Thymio's middle front sensor detects nothing, Thymio only moves forwards. When Thymio's middle front sensor detects something, only Thymio's top LEDs turn red.",
                                "When Thymio's middle front sensor detects nothing, Thymio only stops. When Thymio's middle front sensor detects something, only Thymio's top LEDs turn green.",
                                "When Thymio's middle front sensor detects nothing, only Thymio's top LEDs turn red. When Thymio's middle front sensor detects something, Thymio only moves forwards."
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[2,32,5]},{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"},{"definition":"PaletteTopColorActionBlock","params":[32,0,1]}]]]}

                        },
                        {
                            "cmd": "text",
                            "text": "post E22.01"
                        }
                    ]
        }
    }
}
