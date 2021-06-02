import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: page
    width: 540
    height: 960

    signal backClicked()

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

            onClick: { backClicked(); settings.scanPreview = switch1.checked }
        }

        Border {
            id: border1
            anchors.left: buttonMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            titleText: "Настройки"
        }
    }

    Column {
        id: columnProperties
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowBorder.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Switch {
            id: switch1
            height: 60
            text: qsTr("Предпросмотр перед отправкой")
            anchors.left: parent.left
            anchors.right: parent.right
            scale: 1
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            checked: settings.scanPreview
        }
    }


}
