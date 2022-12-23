import QtQuick 2.0
import Sailfish.Silica 1.0

//task9
Page {
    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: "Элемент 1"
                onClicked: label.text = "Выбрант элемент 1"
            }
            MenuItem {
                text: "Элемент 2"
                onClicked: label.text = "Выбран элемент 2"
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        PushUpMenu {
            MenuItem {
                text: "Элемент 3"
                onClicked: label.text = "Выбрант элемент 3"
            }
            MenuItem {
                text: "Элемент 4"
                onClicked: label.text = "Выбран элемент 4"
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        anchors.fill: parent
        header: PageHeader { title: "Simple List" }
        Label{
            id: label
            text: "Выберите пункт меню"
        }
    }
}
