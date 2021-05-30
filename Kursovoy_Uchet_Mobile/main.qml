import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: applicationWindow
    width: 240
    height: 320
    visible: true
    color: "#d6cdca"
    title: qsTr("Hello World")

    Border {
        id: border1
        anchors.left: buttonMenu.right
        anchors.right: parent.right
        anchors.top: parent.top
        titleText: "Камера"
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
    }

    ButtonMenu {
        id: buttonMenu
        anchors.left: parent.left
        anchors.top: parent.top
        drag.filterChildren: true
        sourceImage: "rec/icons/shewronLeft.png"
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangle
        color: "#000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: border1.bottom
        anchors.bottom: button.top
        anchors.bottomMargin: 5
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("Camera initialization error!")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Button {
        id: button
        text: qsTr("Снимок")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.leftMargin: 60
        anchors.rightMargin: 60
    }



}
