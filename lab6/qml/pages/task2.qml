
import QtQuick 2.0
import Sailfish.Silica 1.0

//task1
Page {
    allowedOrientations: Orientation.All
    ListModel { id: dataModel }
    Column {
        anchors.fill: parent
        PageHeader { title: "Simple List" }
        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add item"
            onClicked: dataModel.append({ text: "Item " })
        }
        SilicaListView {
            width: parent.width; height: parent.height - addButton.height;
            model: dataModel
            delegate: Rectangle {
                width: parent.width; height: 70; color: "skyblue";
                Button {
                    anchors.centerIn: parent
                    property string i: model.index
                    text: model.text + i
                    onClicked: dataModel.remove(model.index)
                }
            }
        }
    }

}
