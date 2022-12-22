import QtQuick 2.0
import Sailfish.Silica 1.0

//task2
Page {
    objectName: "Page1"
    allowedOrientations: Orientation.All

    Column{
        width: parent.width
        spacing: 10

        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Первая странница")
        }
        Column{
            spacing: 10
            Button{
                id: button1
                text: "Прикрепить странницу"
                onClicked: {
                    pageStack.pushAttached(Qt.resolvedUrl("Page2.qml"))
                }
            }

            Button{
                id: button2
                text: "Открепить странницу"
                onClicked: {
                    pageStack.pop()
                }
            }
        }
    }
}
