import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import com.scythestudio.scodes 1.0
import com.custom 1.0
import "qml"

ApplicationWindow {
    id: application
    width: 540
    height: 960
    visible: true

    Page {
        id: applicationPage
        anchors.fill: parent
        visible: true

        state: "OPEN_MENU"

        states: [
            State {
                name: "OPEN_MENU"
                PropertyChanges {
                    target: mainMenu; visible: true;
                }

                PropertyChanges {
                    target: pageConnection
                    visible: false;
                }

                PropertyChanges {
                    target: pageProperties
                    visible: false;
                }

                PropertyChanges {
                    target: pageCamera
                    visible: false
                    scanActive: false
                }
            },

            State {
                name: "OPEN_CONNECTION"
                PropertyChanges {
                    target: mainMenu
                    visible: false
                }

                PropertyChanges {
                    target: pageConnection
                    visible: true
                }

                PropertyChanges {
                    target: pageProperties
                    visible: false
                }

                PropertyChanges {
                    target: pageCamera
                    visible: false
                    scanActive: false
                }
            },

            State {
                name: "OPEN_PROPERTIES"
                PropertyChanges {
                    target: mainMenu
                    visible: false
                }

                PropertyChanges {
                    target: pageConnection
                    visible: false
                }

                PropertyChanges {
                    target: pageProperties
                    visible: true
                }

                PropertyChanges {
                    target: pageCamera
                    visible: false
                    scanActive: false
                }
            },

            State {
                name: "OPEN_CAMERA"
                PropertyChanges {
                    target: mainMenu; visible: false;
                }

                PropertyChanges {
                    target: pageConnection
                    visible: false
                }

                PropertyChanges {
                    target: pageProperties
                    visible: false
                }

                PropertyChanges {
                    target: pageCamera
                    visible: true
                    scanActive: true
                }
            }
        ]

        MainMenu {
            id: mainMenu
            anchors.fill: parent

            onClickedButtonConnect: { applicationPage.state = "OPEN_CONNECTION" }
            onClickedButtonProperties: applicationPage.state = "OPEN_PROPERTIES"
            //onClickedButtonExit: 0
        }

        PageConnection {
            id: pageConnection
            anchors.fill: parent

            onBackClicked: applicationPage.state = "OPEN_MENU"
        }

        PageProperties {
            id: pageProperties
            anchors.fill: parent

            onBackClicked: { applicationPage.state = "OPEN_MENU"; settings.save() }
        }

        PageCamera {
            id: pageCamera
            anchors.fill: parent

            onBackClicked: { applicationPage.state = "OPEN_MENU"; settings.save() }
        }

        MessageBox {
            id: messageBox
            visible: true
            anchors.fill: parent

            onClickedOK: visible = false
        }
    }

    Connections {
        target: connection
        onDisconnected: { applicationPage.state = "OPEN_MENU" }
        onConnected: applicationPage.state = "OPEN_CAMERA"
        onErrorConnection: {
            messageBox.title = "Error connection"
            messageBox.message = message
            messageBox.visible = false
        }
    }
}
