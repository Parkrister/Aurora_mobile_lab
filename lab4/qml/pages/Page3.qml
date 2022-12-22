import QtQuick 2.0
import Sailfish.Silica 1.0

Page{
    objectName: "Page2"
    allowedOrientations: Orientation.All
    ComboBox {
        label: "Выпадающий список"
        description: "Описание выпадающего списка"
        menu: ContextMenu {
            id: choice
            MenuItem { text: "первый" }
            MenuItem { text: "второй" }
            MenuItem { text: "третий" }
        }
        onCurrentIndexChanged: console.log(currentIndex + 1)
    }
}
