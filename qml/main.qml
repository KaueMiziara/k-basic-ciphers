import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

import kaue.cipher.caesar 1.0

Window {
    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    CaesarObject {
        id: caesar
        textInput: "ABC"
        textOutput: ""
        shift: 1
    }

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Label {
            text: "Input: " + caesar.textInput
        }

        Label {
            text: "Output: " + caesar.textOutput
        }

        Button {
            text: "Shift"

            onClicked: caesar.textOutput = caesar.cipher()
        }
    }
}
