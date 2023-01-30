import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import kaue.cipher.caesar 1.0

Rectangle {
    id: caesarScreen
    anchors.centerIn: parent

    CaesarObject {
        id: caesar
        textInput: input.displayText
        textOutput: ""
        shift: Math.abs(shift.displayText)
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

            text: "<b>Caesar Shift</b>"
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
                id: shift
                placeholderText: qsTr("Shift")
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "Cipher"

                onClicked: caesar.textOutput = caesar.cipherC()
            }
            
            Button {
                text: "Decipher"
                
                onClicked: caesar.textOutput = caesar.decipherC()
            }
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Output: " + caesar.textOutput
        }
    }
}