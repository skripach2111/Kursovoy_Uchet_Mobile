import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: page
    width: 540
    height: 960

    signal clickedButtonConnect()
    signal clickedButtonProperties()
    signal clickedButtonExit()

    Border {
        id: border1
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        titleText: "Меню"
    }

    Column {
        id: column
        y: 486
        height: 400
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 75
        anchors.leftMargin: 75
        anchors.bottomMargin: 75

        Button {
            id: buttonConnection
            height: 40
            text: qsTr("Подключение")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: buttonProperty.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 25

            onClicked: { console.log("Click connect 1"); clickedButtonConnect() }
        }

        Button {
            id: buttonProperty
            height: 40
            text: qsTr("Настройки")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: buttonExit.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 25

            onClicked: { clickedButtonProperties() }
        }

        Button {
            id: buttonExit
            height: 40
            text: qsTr("Выход")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            scale: 1
            anchors.bottomMargin: 25
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            onClicked: { clickedButtonExit() }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
