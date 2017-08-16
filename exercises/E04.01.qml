import QtQuick 2.0

QtObject {
 property var scenario: {
        "list": [
            {
                "cmd": "multi",
                "scene":
                    [
                    {
                        "cmd": "text",
                        "text": "Pre E04.01"
                    },
                    {
                        "cmd": "dialogue",
                        "speaker": "Ada",
                        "text": qsTr("This is a program, right? What do you think it does?")
                    }
                ]
            },
            {
                "cmd": "ex",
                "type": "type1",
                "text": "E04.01",
                "list": [
                    {
                        "cmd": "multi",
                        "scene":
                            [
                            {
                                "cmd": "text",
                                "text": "E04.01 01"
                            },
                            {
                                "cmd": "dialogue",
                                "speaker": "Thymio",
                                "text": qsTr("If you're not sure about what the program does, you can always try it out on the Thymio you have with you on Earth.")
                            }
                        ]
                    },
                    {
                        "cmd": "multi",
                        "scene":
                            [
                            {
                                "cmd": "text",
                                "text": "E04.01 02"
                            },
                            {
                                "cmd": "dialogue",
                                "speaker": "Thymio",
                                "text": qsTr("Press that yellow button on the top right of the tablet screen. It should take you to a VPL screen.")
                            }
                        ]
                    },
                    {
                        "cmd": "multi",
                        "scene":
                            [
                            {
                                "cmd": "text",
                                "text": "E04.01 03"
                            },
                            {
                                "cmd": "dialogue",
                                "speaker": "Thymio",
                                "text": qsTr("To test out programs on Earth, click on the play button in the bottom right of the VPL.")
                            }
                        ]
                    }
                ],
                "answerList": [
                    qsTr("Thymio moves forwards."),
                    qsTr("Thymio moves backwards."),
                    qsTr("Thymio turns left on the spot."),
                    qsTr("Thymio turns right on the spot."),
                    qsTr("Thymio turns right."),
                    qsTr("Thymio turns left.")],
                "scoreList": [1, 0, 0, 0, 0, 0],
                "code":
                {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","FAR","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"front"}]]]}
            },
            {
                "cmd": "multi",
                "scene":
                    [
                    {
                        "cmd": "text",
                        "text": "Post E04.01 01"
                    },
                    {
                        "cmd": "feedback",
                        "options": [
                            [{
                                 "cmd": "dialogue",
                                 "speaker": "Ada",
                                 "text": qsTr("I think so too!")
                             }],
                            [{
                                 "cmd": "dialogue",
                                 "speaker": "Ada",
                                 "text": qsTr("I'm not so sure about that...")
                             },{
                                 "cmd": "dialogue",
                                 "speaker": "Ada",
                                 "text": qsTr("Doesn't Thymio move forwards in that program?")
                             },,{
                                 "cmd": "dialogue",
                                 "speaker": "Thymio",
                                 "text": qsTr("Yes, that's right.")
                             }]
                        ]
                    }
                ]
            }
        ]
    }

}
