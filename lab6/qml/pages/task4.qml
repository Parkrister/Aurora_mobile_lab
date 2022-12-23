
import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    XmlListModel {
        id: xmlListModel
        source: "https://lenta.ru/rss/news"
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()"; }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: "News" }
        model: xmlListModel
        delegate: Column {
            x: 10; width: parent.width - 2 * x
            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                text: title
            }
        }
    }
}


/*
//task1
Page {
    allowedOrientations: Orientation.All
    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Value/number()"; }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: "Курс валют" }
        model: xmlListModel
        delegate: Column {
            x: 10; width: parent.width - 2 * x
            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                text: title
            }
        }
    }

}
*/
