import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E22.04",
                            "description": ""
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E22.04",
                            "method": "sim",
                            "scene": [{
                                    "checkfor": [{"type": "xsmaller", "endpos" : 85}, {"type": "xgreater", "endpos" : 75}, {"type": "topcolor", "time" : 1, "color": "red"}],
                                    "duration": 5,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [84, 50], "angle": 0 }
                                },
                                {
                                    "checkfor": [{"type": "xgreater", "endpos" : 55}, {"type": "topcolor", "time" : 1, "color": "green"}],
                                    "duration": 1,
                                    "worldSize": [100, 100],
                                    "thymio" : { "position": [50, 50], "angle": 0 }
                                }],
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,31,3]},{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[32,3,6]},{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},
                            "code": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,0,0]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,0,0]}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E22.04"
                        }
                    ]
        }
    }
}
