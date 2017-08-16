import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E16.05"
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E16.05",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","ON","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E16.05"
                        }
                    ]
        }
    }
}
