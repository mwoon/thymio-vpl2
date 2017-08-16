import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E22.03"
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E22.03",
                            "answerList": [
                                "They are the same.",
                                "The program on top uses Thymio's bottom LEDs.",
                                "The program on top will change Thymio's LEDs the first time his middle front sensor detects nothing and on the second time Thymio will move.",
                                "The program on top will make Thymio move the first time his middle front sensor detects nothing and on the second time Thymio's LEDs will turn green.",
                                "In the program on top Thymio only moves forwards. In the program on below only Thymio's top LEDs turn green.",
                                "In the program on top only Thymio's top LEDs turn green. In the program on below Thymio only moves forwards."
                            ],
                            "scoreList": [1, 0, 0, 0, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"},{"definition":"PaletteTopColorActionBlock","params":[0,31,3]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,3]},{"definition":"MotorSimpleActionBlock","params":"front"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E22.03"
                        }
                    ]
        }
    }
}
