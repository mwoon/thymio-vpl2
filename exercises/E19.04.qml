import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E19.04",
                            "description": ""
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E19.04",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]]]},
                            "code": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E19.04"
                        }
                    ]
        }
    }
}
