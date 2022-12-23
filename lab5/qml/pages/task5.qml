import QtQuick 2.0
import Sailfish.Silica 1.0

//task5
Page {
    objectName: "task5"
    allowedOrientations: Orientation.All

    Column{
        width: parent.width
        spacing: 10
        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Задание 5")
        }
        Button {
            text: "Выбрать время"
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog",
                    {hour: 13, minute: 42});
                dialog.accepted.connect(function() {
                    console.log(dialog.time);
                    label.text = dialog.time

                });


            }
        }

        Label{
            id: label
            text: "текст"
        }
    }
}
