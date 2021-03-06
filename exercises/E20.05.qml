import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E20.05"
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E20.05",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["FAR","FAR","FAR","FAR","FAR","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]],[[{"definition":"ProxEventBlock","params":["CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E20.05"
                        }
                    ]
        }
    }
}
