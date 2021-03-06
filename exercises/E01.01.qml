import QtQuick 2.0

QtObject {
    property var scenario: {
        {
            "list": [
                        {
                            "cmd": "ex",
                            "type": "type4",
                            "text": "E01.01",
                            "description": [
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Remove that blue circle in the center and then use click 'Upload to Remote' in the top right!")
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
                                            "text": "E01.01 01"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("Hmm... I don't really understand what all of this is. But something seems wrong.")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "text",
                                            "text": "E01.01 02"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("You should try grabbing this circle in the middle and get rid of it.")
                                        }
                                    ]
                                },
                                {
                                    "cmd": "multi",
                                    "scene":
                                        [
                                        {
                                            "cmd": "text",
                                            "text": "E01.01 03"
                                        },
                                        {
                                            "cmd": "dialogue",
                                            "speaker": "Ada",
                                            "text": qsTr("It looks like that button 'Upload to Remote' in the rop right will let you send your work back to me. Press it when you're done!")
                                        }
                                    ]
                                }
                            ],

                            "method": "fixed",
                            "solution":
                            {"mode":"simple","scene":[]}
                            ,
                            "code":
                            {"mode":"simple","scene":[[[],[{"definition":"MotorActionBlock","params":[0,0]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E01.01 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Awesome!")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Uhm... I don't think you cleared it properly.")
                                         }]
                                    ]
                                }
                            ]
                        }
                    ]
        }
    }
}
