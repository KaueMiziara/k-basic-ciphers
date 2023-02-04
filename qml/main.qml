import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 2.15

ApplicationWindow {
    id: root
    title: qsTr("Ciphers")
    minimumWidth: 320
    minimumHeight: 300
    visible: true

    // TODO remove default toolbar
    ToolBar {
        id: toolBar
        width: root.width
        height: 2 * toolBarLabel.contentHeight
        z: 1
        
        // TODO fix items alignment
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("Menu")
                onClicked: menu.open()
            }

            Label {
                id: toolBarLabel
                anchors.centerIn: parent

                text: "Ciphers"
            }

            ToolButton {
                anchors.right: parent.right
                text: qsTr("X")
                onClicked: Qt.quit()
            }
        }
    }


    // TODO: side menu
    // Drawer {
    //     id: sideBar
    //     width: Math.max(150 , root.width / 4)
    //     height: root.height

    //     Label {
    //         text: "Caesar Shift"
    //     }

    //     Label {
    //         text: "Vigenère Cipher"
    //     }
    // }


    Menu {
        id: menu
        y: toolBar.height + 5

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
        anchors.top: toolBar.bottom
        x: root.width / 2
    }
}
