import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E21.04",
                            "description": ""
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E21.04",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]},
                            "code": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E21.04"
                        }
                    ]
        }
    }
}
