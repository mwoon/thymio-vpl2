import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I think the screen is asking for this program.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But what does it do?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E14.01",
                            "answerList": [
                                qsTr("When all three sensors in the middle in front detect something, Thymio's top LEDs become blue. When the second sensor from the left in front does not detect anything but the right sensor behind Thymio does, his bottom LEDs become blue."),
                                qsTr("When any of the three sensors in the middle in front detect something, Thymio's bottom LEDs become blue. When the second sensor from the left in front does not detect anything or the right sensor behind Thymio does, his top LEDs become blue."),
                                qsTr("When all three sensors in the middle in front detect something, Thymio's bottom LEDs become blue. When the second sensor from the left in front detects something but the right sensor behind Thymio does not, his top LEDs become blue."),
                                qsTr("When all three sensors in the middle in front detect nothing, Thymio's bottom LEDs become blue. When the second sensor from the left in front detects something but the right sensor behind Thymio does not, his top LEDs become blue."),
                                qsTr("When all three sensors in the middle in front detect something, Thymio's bottom LEDs become blue. When the second sensor from the left in front does not detect anything but the right sensor behind Thymio does, his top LEDs become blue."),
                                qsTr("When any of the three sensors in the middle in front detect nothing, Thymio's bottom LEDs become blue. When the second sensor from the left in front detects something or the right sensor behind Thymio does not, his top LEDs become blue.")
                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","CLOSE","CLOSE","CLOSE","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[1,0,31]}]],[[{"definition":"ProxEventBlock","params":["DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[3,0,31]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E14.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh I understand now.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("No wait... Shouldn't it be like this instead?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("When all three sensors in the middle in front detect something, Thymio's bottom LEDs become blue. When the second sensor from the left in front does not detect anything but the right sensor behind Thymio does, his top LEDs become blue.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("That's right Ada, you figured it out.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Yippee!")
                                         }]
                                    ]
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.01 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada pushes the button on the screen and waits for what happens next.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.01 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("When the screen blinks, she looks at it.")
                                }
                            ]
                        }
                    ]
        }
    }
}
