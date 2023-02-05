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
    flags: Qt.FramelessWindowHint

    ToolBar {
        id: toolBar
        width: root.width
        z: 1
        
        MouseArea {
            anchors.fill: parent
            property variant clickPos: "1,1"

            onPressed: {
                clickPos = Qt.point(mouse.x, mouse.y);
            }

            onPositionChanged: {
                var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y);
                root.x += delta.x; root.y += delta.y;

                if (root.y <= 0) root.visibility = Window.Maximized;
                else {
                    if (root.visibility === Window.Maximized && root.y > 0) {
                        root.visibility = Window.Windowed;
                        root.width = root.minimumWidth;
                        root.height = root.minimumHeight;
                    }
                }
            }
        }
        

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
        width: Math.max(150, root.width / 5)
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
