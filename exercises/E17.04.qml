import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E17.04",
                            "description": ""
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E17.04",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"stop"}]]]},
                            "code": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E17.04"
                        }
                    ]
        }
    }
}
