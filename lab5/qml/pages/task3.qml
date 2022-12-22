import QtQuick 2.0
import Sailfish.Silica 1.0

//task3
Page {
    objectName: "task3"
    allowedOrientations: Orientation.All

    Column{
        width: parent.width
        spacing: 10
        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Задание 3")
        }
        Button {
            text: "Открыть диалог"
            onClicked: {
            var dialog = pageStack.push(Qt.resolvedUrl("DialogTask3.qml"));
            dialog.accepted.connect(function() {
                console.log(dialog.textFieldValue)
                label.text = dialog.textFieldValue;
            });
            }
        }

        Label{
            id: label
            text: "текст"
        }
    }
}
