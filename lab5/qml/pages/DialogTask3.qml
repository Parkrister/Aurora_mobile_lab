import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
   property string textFieldValue
   Column {
       width: parent.width
       spacing: Theme.paddingMedium
       DialogHeader { }
       TextField {
           id: myTextField
           width: parent.width
           placeholderText: "Введите текст"
       }
   }

   onDone: {
           if (result == DialogResult.Accepted) {
               textFieldValue = myTextField.text
           }
       }

}
