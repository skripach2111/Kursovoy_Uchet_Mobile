import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property string titleText: "Border"

    width: 400
    height: 50
    color: "#494848"


    Text {
        id: title
        color: "#000000"
        text: titleText
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        minimumPointSize: 14
        minimumPixelSize: 14
        font.pointSize: 20
        textFormat: Text.AutoText
        anchors.leftMargin: 10
    }

}
