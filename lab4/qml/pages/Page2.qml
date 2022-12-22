import QtQuick 2.0
import Sailfish.Silica 1.0

Page{
    objectName: "Page2"
    allowedOrientations: Orientation.All
    Column {
        id: layout
        objectName: "layout"
        width: parent.width
        //task5
        DatePicker {
            date: new Date(2012, 10, 23, 12, 0, 0)
            daysVisible: true
            weeksVisible: true
            onDateChanged: console.log(date)
        }

        //task6
        Item{
            height: timePicker.height
            width: parent.width
            TimePicker {
                id: timePicker
                hour: 15
                minute: 26
                onTimeChanged: console.log(timePicker.timeText)

            }
            Label {
                anchors.centerIn: timePicker
                text: timePicker.timeText
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }
}
