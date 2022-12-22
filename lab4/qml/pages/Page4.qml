import QtQuick 2.0
import Sailfish.Silica 1.0

Page{
    objectName: "Page2"
    allowedOrientations: Orientation.All
    Column{
        width: parent.width
        //task8
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Switch {
                id: mute
                icon.source: "image://theme/icon-m-speaker-mute?"
                + (checked ? Theme.highlightColor
                   : Theme.primaryColor)
            }
            Label {
                text: "The sound is " + (mute.checked ? "off" : "on")
            }
        }

        //task9
        Slider {
            width: parent.width
            label: "Ползунок"
            maximumValue: 42
            minimumValue: 0
            value: 10
            stepSize: 1
            valueText: value
            onValueChanged: console.log(value)
        }

    }
}
