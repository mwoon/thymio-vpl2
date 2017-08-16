import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.01 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("I can follow the instruction on screen but I'm not sure if this is actually correct.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Pre E13.01 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Can you take a look and tell me what you think this program does?")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type1",
                            "text": "E13.01",
                            "answerList": [
                                qsTr("When the two left sensors in front detect nothing, Thymio's top LEDs become light blue."),
                                qsTr("When the two left sensors in front detect something, Thymio's top LEDs become light blue."),
                                qsTr("When the two left sensors in front detect nothing, Thymio's bottom LEDs become light blue."),
                                qsTr("When any one of the two left sensor in front detect something, Thymio's top LEDs become light blue."),
                                qsTr("When the two left sensors in front detect something, Thymio's bottom LEDs become light blue."),
                                qsTr("When any one of the two left sensor in front detect nothing, Thymio's top LEDs become light blue.")
                            ],
                            "scoreList": [0, 0, 0, 0, 1, 0],
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"PaletteBottomColorActionBlock","params":[5,29,32]}]]]}

                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E13.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Okay, thanks!")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("It seems to do the right thing.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Hmm... I'm pretty sure this program would change my bottom LEDs to light blue when the two left sensors in front detect something.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I see.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Well, that should be the right thing.")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Should we try it out?")
                                         },{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("There's no way around it if we want to activate the portal, so I guess we should.")
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
                                    "text": "post ex 13.01 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada presses the button and waits.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.01 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Two pillars at Thymio's front on the left shoot out and his bottom color changes to light blue.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.01 04"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("Phew, we should be able to move on.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 13.01 05"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("She turns her attention back to the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
