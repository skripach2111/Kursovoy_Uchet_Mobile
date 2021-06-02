import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: page
    width: 540
    height: 960

    signal backClicked()

    Connections {
        target: connection
        onConnected: {
            busyIndicator.visible = false
        }
    }

    Row {
        id: rowBorder
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        ButtonMenu {
            id: buttonMenu
            width: 50
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            sourceImage: "qrc:/rec/icons/shewronLeft.png"
        }

        Border {
            id: border1
            anchors.left: buttonMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            titleText: "Подключение"
        }
    }

    Column {
        id: columnConnection
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowBorder.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Button {
            id: buttonConnect
            height: 40
            text: qsTr("Подключиться")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.leftMargin: 75
            anchors.rightMargin: 75

            onClicked: {
                busyIndicator.visible = true;
                connection.connect(textFieldIp.text, textField1Port.text)
            }
        }

        TextField {
            id: textFieldIp
            height: 40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: textField1Port.top
            anchors.bottomMargin: 50
            anchors.rightMargin: 75
            anchors.leftMargin: 75
            placeholderText: qsTr("Адрес")
        }

        TextField {
            id: textField1Port
            height: 40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: buttonConnect.top
            anchors.rightMargin: 75
            anchors.leftMargin: 75
            anchors.bottomMargin: 50
            placeholderText: qsTr("Порт")
        }

        BusyIndicator {
            id: busyIndicator
            width: 150
            height: 150
            anchors.left: parent.left
            anchors.bottom: textFieldIp.top
            anchors.leftMargin: parent.width/2-width/2
            anchors.bottomMargin: 50
            visible: false
        }
    }

    Connections {
        target: messageBox
        onClickedOK: busyIndicator.visible = false
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:8}
}
##^##*/
