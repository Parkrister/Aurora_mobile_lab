/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    SilicaListView{
        anchors.fill: parent
        PullDownMenu{
            MenuItem{
                text: "task 1"
                onClicked: if(task1.visible){
                               task1.visible = false
                           }
                            else{
                               task1.visible = true
                           }
            }
            MenuItem{
                text: "task 2"
                onClicked: if(task2.visible){
                               task2.visible = false
                           }
                            else{
                               task2.visible = true
                           }
            }
            MenuItem{
                text: "task 3"
                onClicked: if(task3.visible){
                               task3.visible = false
                           }
                            else{
                               task3.visible = true
                           }
            }
            MenuItem{
                text: "task 4"
                onClicked: if(task4.visible){
                               task4.visible = false
                           }
                            else{
                               task4.visible = true
                           }
            }
            MenuItem{
                text: "task 5"
                onClicked: if(task5.visible){
                               task5.visible = false
                           }
                            else{
                               task5.visible = true
                           }
            }
            MenuItem{
                text: "task 6"
                onClicked: if(task6.visible){
                               task6.visible = false
                           }
                            else{
                               task6.visible = true
                           }
            }
        }
    }

    Item{
        id: task1
        visible: false
        x:10
        y:10
        Rectangle{
            id: red
            width: 100
            height: 100
            color: "red"
            border.color: "black"
            border.width: 5
            radius: 10
        }
        Rectangle{
            id: green
            width: 100
            height: 100
            color: "green"
            border.color: "black"
            border.width: 5
            radius: 10
            anchors.left: red.right
            anchors.top: red.verticalCenter
        }
        Rectangle{
            id: blue
            width: 100
            height: 100
            color: "blue"
            border.color: "black"
            border.width: 5
            radius: 10
            anchors.left: green.horizontalCenter
        }
        Text{
            text: "Квадрат"
            font.family: "Helvetica"
            font.pointSize: 18
            color: "white"
            anchors.left: blue.left
            anchors.top: blue.Center
        }
    }

    Item{
        id:task2
        x:10
        y:10
        visible: false
        Column{
            width: 300
            spacing: 5
            Row{
                id: row1
                spacing: 5
                Rectangle{width: 100; height: 100; radius: 20.0; color: "red"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "green"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "blue"}
            }
            Row{
                anchors.top: row1.bottom
                spacing: 5
                Rectangle{width: 100; height: 100; radius: 20.0; color: "pink"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "white"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "black"}
            }
        }

    }

    Item{
        id: task3
        x:10
        y:10
        visible: false
        Rectangle{
            width: 310; height: 210
            color: "#303030"

            Grid{
                columns:3
                rows:2
                spacing: 6
                Rectangle{width: 100; height: 100; radius: 20.0; color: "red"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "green"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "blue"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "pink"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "white"}
                Rectangle{width: 100; height: 100; radius: 20.0; color: "black"}
            }
        }
    }

    Item{
        id: task4
        x:10
        y:10
        visible: false
        Rectangle{
            id: rec1
            color: "blue"
            width: 100
            height: 100
        }
        Rectangle{
            id:rec2
            width: 100
            height: 100
            color: "red"
            transform: [
                Translate{y: 100; x: 300},
                Scale{xScale: 1.5; yScale: 0.5},
                Rotation{angle: 54}
            ]
        }


    }

    Item{
        id:task5
        x:10
        y:10
        visible: true
        Rectangle{
            id:blueRec
            color: "blue"
            width: 100; height: 100; x: 50; y: 50
            ParallelAnimation{
                id: animation
                NumberAnimation{
                    target: blueRec
                    properties: "scale"
                    from: 1.0; to: 1.5; duration: 1000
                }

                NumberAnimation{
                    target: blueRec
                    properties: "y"
                    from: 50; to: 500
                    duration: 1000
                }
                running: true
            }
            Button{
                onClicked: animation.restart()
            }

        }
    }

    Item{
        id: task6
        visible: false
        Button{
            color: "black"
            width: parent.width
            text: "open dialog"
            onClicked: dialog.open()
        }
        Dialog{
            id: dialog
            Column{
                spacing: 5
                Row{
                    spacing: 5
                    TextField{
                        id: textField1
                        width: parent.width
                    }
                    TextField{
                        id: textField2
                        width: parent.width
                    }

                }
                Button{
                    text: "Сложить"
                    onClicked: console.log(parseInt(textField1.text)+ parseInt(textField2.text))
                }
            }
        onAccepted: console.log("dialog open")
        }

    }
}
