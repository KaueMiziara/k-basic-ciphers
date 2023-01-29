import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import kaue.cipher.caesar 1.0

ApplicationWindow {
    id: root
    title: qsTr("Ciphers")
    minimumWidth: 320
    minimumHeight: 260
    visible: true
    color: "light yellow"

    Button {
        id: openMenu
        text: "Cipher select"
        x: 15; y: 15

        onClicked: {
            menu.open()
        }
    }

    Menu {
        id: menu
        y: openMenu.height + 15

        MenuItem {
            text: "Caesar Shift"
            onClicked: {
                loadScene.source = "CaesarShift.qml";
                root.title = qsTr("Caesar Shift");
            }
        }

        MenuItem {
            text: "Vigenère Cipher"
            onClicked: {
                loadScene.source = "VigenereCipher.qml";
                root.title = qsTr("Vigenère Cipher");
            }
        }

        MenuItem {
            text: "Quit"
            onClicked: Qt.quit()
        }
    }

    Loader {
        id: loadScene
        anchors.fill: parent
    }
}
