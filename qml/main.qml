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
        z: 1
        
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("<b>Menu</b>")
                onClicked: {
                    if (sideBar.opened) {
                        sideBar.close();
                    } else {
                        sideBar.open();
                    }
                }
            }

            Label {
                id: toolBarLabel
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                text: "<b>Ciphers</b>"
            }

            ToolButton {
                Layout.alignment: Qt.AlignRight
                text: qsTr("<b>X</b>")
                onClicked: Qt.quit()
            }
        }
    }


    // TODO improve side menu
    Drawer {
        id: sideBar
        y: toolBar.height
        width: Math.max(150 , root.width / 4)
        height: root.height - toolBar.height

        ColumnLayout {
            width: parent.width

            Pane {
                id: caesarPane
                width: parent.width
    
                Label {
                    text: "Caesar Shift"
                
                    MouseArea {
                        anchors.fill: parent
                        
                        onClicked: {
                            loadScene.source = "CaesarShift.qml";
                            sideBar.close();
                        }
                    }
                }
            }

            Pane {
                id: vigenerePane
                width: parent.width

                Label {
                    text: "Vigenère Cipher"
                
                    MouseArea {
                        anchors.fill: parent
                        
                        onClicked: {
                            loadScene.source = "VigenereCipher.qml";
                            sideBar.close();
                        }
                    }
                }
            }
        }
    }

    Loader {
        id: loadScene
        anchors.top: toolBar.bottom
        x: root.width / 2
    }
}
