import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: page
    width: 540
    height: 960
    color: "#80000000"

    signal clickedOK()

    property var title: "Error!"
    property var message: "Message"

    Rectangle {
        id: messageBox
        anchors.fill: parent
        anchors.rightMargin: parent.width/3
        anchors.leftMargin: anchors.rightMargin
        anchors.bottomMargin: parent.height/2.5
        anchors.topMargin: anchors.bottomMargin
        Rectangle {
            id: borderTitle
            height: 40
            color: "#494848"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Text {
                id: titleText
                text: title
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.leftMargin: 10
            }
        }

        Rectangle {
            id: textBox
            color: "#d6cdca"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: borderTitle.bottom
            anchors.bottom: buttonOK.top
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Text {
                id: messageText
                text: message
                anchors.fill: parent
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }
        }

        Button {
            id: buttonOK
            text: "OK"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            onClicked: clickedOK()
        }
    }
}
