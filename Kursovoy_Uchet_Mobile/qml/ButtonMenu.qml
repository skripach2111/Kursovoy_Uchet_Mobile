import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea {
    id: mouseArea
    width: 50
    height: 50

    signal click()

    Connections {
        target: mouseArea
        onClicked: {
            click()
        }
    }

    property string sourceImage: "rec/icons/menu1.png"

    Rectangle {
        color: "#494848"
        anchors.fill: parent

        Image {
            id: image
            anchors.fill: parent
            source: sourceImage
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            fillMode: Image.PreserveAspectFit
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
