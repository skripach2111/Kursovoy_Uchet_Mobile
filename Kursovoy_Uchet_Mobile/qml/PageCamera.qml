import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.12
import com.scythestudio.scodes 1.0

Page {
    id: page
    width: 540
    height: 960

    signal backClicked()

    property bool scanActive: false

    Camera {
        id: camera
        focus {
            focusMode: CameraFocus.FocusContinuous
            focusPointMode: CameraFocus.FocusPointAuto
        }
    }

    VideoOutput {
        id: videoOutput
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowBorder.bottom
        anchors.bottom: parent.bottom
        source: camera
        anchors.topMargin: 0
        autoOrientation: true
        fillMode: VideoOutput.PreserveAspectCrop
        // add barcodeFilter to videoOutput's filters to enable catching barcodes
        filters: [barcodeFilter]

        onSourceRectChanged: {
            barcodeFilter.captureRect = videoOutput.mapRectToSource(
                        videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25, 0.5, 0.5)))
        }

        ScannerOverlay {
            id: scannerOverlay
            anchors.fill: parent

            captureRect: videoOutput.mapRectToItem(barcodeFilter.captureRect)
        }

        // used to get camera focus on touched point
        MouseArea {
            onClicked: {

                //                camera.focus.customFocusPoint = Qt.point(mouse.x / width,
                //                                                         mouse.y / height)
                //                camera.focus.focusMode = CameraFocus.FocusMacro
                //                camera.focus.focusPointMode = CameraFocus.FocusPointCustom

                camera.focus.customFocusPoint = Qt.point(width/2, height/2)
            }
        }
    }

    SBarcodeFilter {
        id: barcodeFilter
        active: scanActive

        // you can adjust capture rect (scan area) ne changing these Qt.rect() parameters
        captureRect: videoOutput.mapRectToSource(
                         videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25,
                                                                     0.5, 0.5)))

        onCapturedChanged: {
            if(settings.scanPreview)
            {
                scanActive = false
                console.log("captured: " + captured)
            }
            else
            {

            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.topMargin: 0
        visible: !barcodeFilter.active
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowBorder.bottom
        anchors.bottom: parent.bottom

        Label {
            id: label
            text: qsTr("Предпросмотр:")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.underline: true
            font.pointSize: 14
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 10
        }

        Label {
            id: labelInfo
            text: barcodeFilter.captured
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: label.bottom
            verticalAlignment: Text.AlignVCenter
            font.underline: false
            font.pointSize: 12
            anchors.topMargin: 5
            anchors.rightMargin: 0
            anchors.leftMargin: 20
        }

        Button {
            id: buttonSend
            text: qsTr("Отправить")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
        }
    }

    Row {
        id: rowBorder
        width: 200
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        ButtonMenu {
            id: buttonMenu
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            sourceImage: "qrc:/rec/icons/shewronLeft.png"

            onClick:
            {
                if(scanActive)
                    backClicked()
                else
                {
                    scanActive = true
                }
            }
        }

        Border {
            id: border1
            anchors.left: buttonMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            titleText: "Сканер"
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
