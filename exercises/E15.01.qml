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
                                    "text": "Pre E15.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Alright, another program.")
                                }
                            ]
                        },{
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("We need to tell the machine what it does.")
                                }
                            ]
                        },{
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E15.01 03"
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
                            "text": "E15.01",
                            "answerList": [
                                qsTr("When both of Thymio's ground sensors detect nothing, Thymio's bottom and top LEDs will become green. When the ground sensors detect something, the LEDs will turn off."),
                                qsTr("When Thymio's ground sensors detect something, Thymio's bottom LEDs will become green. When the ground sensors detect nothing, the LEDs will turn off."),
                                qsTr("When Thymio's ground sensors detect something, Thymio's top LEDs will become green. When the ground sensors detect nothing, the LEDs will turn off."),
                                qsTr("When both of Thymio's ground sensors detect something, Thymio's bottom and top LEDs will become green. When the ground sensors detect nothing, the LEDs will turn off."),
                                qsTr("When both of Thymio's ground sensors detect something, Thymio's bottom and top LEDs will become green. When the ground sensors detect nothing, the bottom LEDs will turn off."),
                                qsTr("When both of Thymio's ground sensors detect something, Thymio's bottom and top LEDs will become green. When the ground sensors detect nothing, the top LEDs will turn off.")
                            ],
                            "scoreList": [0, 0, 0, 1, 0, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxGroundEventBlock","params":["CLOSE","CLOSE"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,32,0]},{"definition":"PaletteBottomColorActionBlock","params":[1,32,0]}]],[[{"definition":"ProxGroundEventBlock","params":["FAR","FAR"]}],[{"definition":"PaletteTopColorActionBlock","params":[0,0,0]},{"definition":"PaletteBottomColorActionBlock","params":[0,0,0]}]]]}

                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E15.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I would have said the same thing!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's not right... Is it?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("No, it isn't. What it does is turn both top and bottom LEDs to green when the bottom sensors detect something and turn the off when both sensors detect nothing.")
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
                                    "text": "post ex 15.01 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Okay, so let's give it the answer.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 15.01 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("The screen flashes green a few times and then flashes white.")
                                }
                            ]
                        }

                    ]
        }
    }
}
