import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import kaue.cipher.vigenere 1.0

Rectangle {
    id: vigenereScreen
    anchors.centerIn: parent
    color: "light yellow"

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

        Button {
            id: openMenu
            text: "Cipher select"

            onClicked: {
                menu.open()
            }
        }

        Text {
            x: parent.width/2 - this.contentWidth/2

            text: "<b>Vigenère Cipher</b>"
            font.pixelSize: 20
        }

        Row {
            anchors.margins: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15
            y: 10

            TextField {
                id: input
                placeholderText: qsTr("Text to encode")
            }

            TextField {
                id: key
                placeholderText: qsTr("Password")
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "Cipher"

                onClicked: vigenere.textOutput = vigenere.cipherV()
            }
            
            Button {
                text: "Decipher"
                
                onClicked: vigenere.textOutput = vigenere.decipherV()
            }
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Output: " + vigenere.textOutput
        }
    }
}