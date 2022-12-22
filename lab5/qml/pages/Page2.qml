import QtQuick 2.0
import Sailfish.Silica 1.0

//task2
Page {
    objectName: "Page2"
    allowedOrientations: Orientation.All

    Column{
        width: parent.width
        spacing: 10
        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Вторая странница")
        }
        Button{
            id: button1
            text: "Назад"
            onClicked: {
                pageStack.navigateBack()
            }
        }
    }
}
