import QtQuick 2.0
import Sailfish.Silica 1.0

//task7
Page {
    SilicaWebView {
        id: webView
        anchors {
            top: parent.top; bottom: urlField.top;
            left: parent.left; right: parent.right;
        }
        url: "http://sailfishos.org"
    }
    TextField {
        id: urlField
        anchors {
            left: parent.left; right: parent.right;
            bottom: parent.bottom
        }
        text: "http://sailfishos.org"
        label: webView.title
        EnterKey.onClicked: webView.url = text
    }

}
