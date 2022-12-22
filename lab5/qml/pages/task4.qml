import QtQuick 2.0
import Sailfish.Silica 1.0

//task4
Page {
    objectName: "task4"
    allowedOrientations: Orientation.All

    Column{
        width: parent.width
        spacing: 10
        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Задание 4")
        }
        Button {
            text: "Выбрать дату"
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog",
                    {date: new Date(2017, 0, 1)});
                dialog.accepted.connect(function() {
                    console.log(dialog.date);
                    label.text = dialog.date
                });

            }
        }

        Label{
            id: label
            text: "текст"
        }
    }
}
