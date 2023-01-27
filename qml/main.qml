import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

import kaue.cipher.caesar 1.0

Window {
    title: qsTr("Hello World")
    width: 320
    height: 240
    visible: true
    color: "light yellow"

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

        Row {
            anchors.margins: 5
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
            spacing: 15

            Button {
                text: "Cipher"

                onClicked: caesar.textOutput = caesar.cipher()
            }
            
            Button {
                text: "Decipher"
                
                onClicked: caesar.textOutput = caesar.decipher()
            }
        }

        Label {
            text: "Output: " + caesar.textOutput
        }
    }
}
