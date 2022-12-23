import QtQuick 2.0
import Sailfish.Silica 1.0

//task10
Page {
    SilicaListView {
        anchors.fill: parent
        model: 10
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "Элемент" + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel { text: "Context Menu" }
                MenuItem {
                    text: "Menu Item 1"
                    onClicked: console.log("Элемент " + index + " - Пункт 1")
                }
                MenuItem {
                    text: "Menu Item 2"
                    onClicked: console.log("Элемент " + index + " - Пункт 2")
                }
            }
        }
    }

}
