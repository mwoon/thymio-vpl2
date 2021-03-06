import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E18.05"
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E18.05",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E18.05"
                        }
                    ]
        }
    }
}
