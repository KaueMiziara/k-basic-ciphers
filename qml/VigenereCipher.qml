import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import kaue.cipher.vigenere 1.0

Rectangle {
    id: vigenereScreen
    anchors.centerIn: parent

    VigenereObject {
        id: vigenere
        textInput: input.displayText
        textOutput: ""
        key: key.displayText
    }

    Column {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        Text {
            x: parent.width/2 - this.contentWidth/2
            width: root.width / 3
            height: root.height / 4
            
            text: "<b>Vigenère Cipher</b>"
            font.pixelSize: this.height / 3
        }

        Row {
            anchors.margins: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15
            y: 10

            TextField {
                id: input
                width: root.width / 2
                placeholderText: qsTr("Text to encode")
            }

            TextField {
                id: key
                width: root.width / 10
                placeholderText: qsTr("Password")
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "Cipher"
                width: input.width / 2

                onClicked: vigenere.textOutput = vigenere.cipherV()
            }
            
            Button {
                text: "Decipher"
                width: input.width / 2

                onClicked: vigenere.textOutput = vigenere.decipherV()
            }
        }

        TextEdit {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Output: " + vigenere.textOutput
            readOnly: true
            selectByMouse: true
        }
    }
}
