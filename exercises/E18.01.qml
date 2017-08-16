import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E18.01"
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E18.01",
                            "answerList": [
                                "Thymio turns to the left in a circles and then stops.",
                                "Thymio turns to the right in a circle and then stops.",
                                "Thymio turns to the left on the spot.",
                                "Thymio turns to the left in a circle.",
                                "Thymio turns to the right in a circle.",
                                "Thymio turns to the right on the spot."
                            ],
                            "scoreList": [0, 0, 0, 0, 0, 1],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","ON"]}],[{"definition":"MotorSimpleActionBlock","params":"right"}]]]}
                        },
                        {
                            "cmd": "text",
                            "text": "post E18.01"
                        }
                    ]
        }
    }
}
