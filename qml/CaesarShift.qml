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

        Text {
            x: parent.width/2 - this.contentWidth/2
            width: root.width / 3
            height: root.height / 4

            text: "<b>Caesar Shift</b>"
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
                id: shift
                width: root.width / 10
                placeholderText: qsTr("Shift")
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "Encipher"
                width: input.width / 2

                onClicked: caesar.textOutput = caesar.encipherC()
            }
            
            Button {
                text: "Decipher"
                width: input.width / 2

                onClicked: caesar.textOutput = caesar.decipherC()
            }
        }

        TextEdit {
            id: caesarOutput
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Output: " + caesar.textOutput
            readOnly: true
            selectByMouse: true
        }
    }
}
