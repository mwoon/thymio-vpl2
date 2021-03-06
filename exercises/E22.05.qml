import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "text",
                            "text": "pre E22.05"
                        },
                        {
                            "cmd": "ex",
                            "type": "type5",
                            "text": "E22.05",
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
                            "solution": {}
                        },
                        {
                            "cmd": "text",
                            "text": "post E22.05"
                        }
                    ]
        }
    }
}
