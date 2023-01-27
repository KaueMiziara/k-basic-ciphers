import QtQuick 2.15
import QtQuick.Controls 2.15

import kaue.cipher.caesar 1.0

ApplicationWindow {
    title: qsTr("Caesar Shift")
    width: 320
    height: 260
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
                loadScene.source = "CaesarShift.qml"
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
