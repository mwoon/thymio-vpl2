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
                                    "text": "Pre E02.01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("It looks like there's more of that. Let's take a look.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E02.01",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Clear out all the circles! You can use the 'Clear Program' button in the menu!")
                                        }
                                    ]
                                }
                            ],
                            "list": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "text",
                                            "text": "E02.01 01"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("What is all this stuff anyway?")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "text",
                                            "text": "E02.01 02"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Oh, there's a button in the menu you could try. It's called 'Clear Program'. If this is a program, maybe it'll get rid of all these things faster!")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "text",
                                            "text": "E02.01 03"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Try it out and send it back here!")
                                        }
                                    ]
                                }
                            ],
                            "method": "fixed",
                            "solution":
                            {"mode":"simple","scene":[]}
                            ,
                            "code":
                            {"mode":"simple","scene":[[[{"definition":"ButtonsEventBlock","params":["DISABLED","DISABLED","DISABLED","ON","DISABLED"]},{"definition":"ButtonsEventBlock","params":["ON","DISABLED","DISABLED","DISABLED","DISABLED"]}],[{"definition":"MotorSimpleActionBlock","params":"left"}]],[[{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","CLOSE"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]},{"definition":"ProxEventBlock","params":["DISABLED","DISABLED","DISABLED","DISABLED","CLOSE","DISABLED","DISABLED"]},{"definition":"ClapEventBlock","params":null}],[{"definition":"PaletteTopColorActionBlock","params":[8,23,32]}]],[[],[{"definition":"PaletteBottomColorActionBlock","params":[5,32,3]},{"definition":"PaletteTopColorActionBlock","params":[4,0,15]}]],[[],[{"definition":"PaletteBottomColorActionBlock","params":[32,13,4]},{"definition":"MotorSimpleActionBlock","params":"right"},{"definition":"MotorSimpleActionBlock","params":"left"},{"definition":"MotorSimpleActionBlock","params":"backRight"}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E02.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("I think it worked! Good job!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That doesn't seem quite right...")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("It doesn't look like you cleared it out properly.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
