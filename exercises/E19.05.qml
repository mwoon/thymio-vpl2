import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E19.05"
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E19.05",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]],[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E19.05"
                        }
                    ]
        }
    }
}
