import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E18.04",
                            "description": ""
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E18.04",
                            "method": "fixed",
                            "solution": {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","ON","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]},
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E18.04"
                        }
                    ]
        }
    }
}
