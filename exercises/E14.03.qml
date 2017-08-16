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
                                    "text": "Pre E14.03 01"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("We have to choose between one of these two programs.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "Pre E14.03 02"
                                },
                                {
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("But I don't really understand what's different between them.")
                                }
                            ]
                        },
                        {
                            "cmd": "ex",
                            "type": "type3",
                            "text": "E14.03",
                            "answerList": [
                                qsTr("Both programs are broken because the two sensors events are almost the same."),
                                qsTr("In the program on top, Thymio's top LEDs will never become blue."),
                                qsTr("In the program below, Thymio's top LEDs will never become blue."),
                                qsTr("In the program below, Thymio's top LEDs will only become green if Thymio's middle sensor first detects something and then doesn't and the other sensors all detect something the whole time."),
                                qsTr("In the program below, Thymio's top LEDs will never become green."),
                                qsTr("In the program on top, Thymio's top LEDs will never become green.")
                            ],
                            "scoreList": [0, 0, 0, 1, 0, 0],
                            "code1":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","FAR","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,31]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[6,32,4]}]]]}
                            ,
                            "code2":
                            {"mode":"simple","scene":[[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","DISABLED","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[1,0,31]}]],[[{"definition":"ProxEventBlock","params":["CLOSE","CLOSE","FAR","CLOSE","CLOSE","DISABLED","DISABLED"]}],[{"definition":"PaletteTopColorActionBlock","params":[6,32,4]}]]]}
                        },
                        {
                            "cmd": "multi",
                            "scene":
                                [
                                {
                                    "cmd": "text",
                                    "text": "Post E14.03 01"
                                },
                                {
                                    "cmd": "feedback",
                                    "options": [
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Oh I understand now. It's because in the program below the event on top doesn't care about the middle sensor, so the event below can only get its turn if something happens that doesn't matter to the event on top.")
                                         }],
                                        [{
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("The answer is that in the program below, the color will only become green if something happens that doesn't concern the first event.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("Huh? But why?")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("Because I can only check one line at a time. It's very fast but only one at a time.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Thymio",
                                             "text": qsTr("So if the first one already activates, the others won't also activate.")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("That's too confusing!")
                                         }, {
                                             "cmd": "dialogue",
                                             "speaker": "Ada",
                                             "text": qsTr("But let's just move on.")
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
                                    "text": "post ex 14.03 03"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "Ada",
                                    "text": qsTr("So we need the bottom one.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.03 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("Ada pushes the button and the screen accepts their choice.")
                                }
                            ]
                        },
                        {
                            "cmd": "multi",
                            "scene":[
                                {
                                    "cmd": "text",
                                    "text": "post ex 14.03 02"
                                },{
                                    "cmd": "dialogue",
                                    "speaker": "",
                                    "text": qsTr("More things appear on the screen.")
                                }
                            ]
                        }
                    ]
        }
    }
}
