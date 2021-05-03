import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Lighting")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent

        Label {
            id: text
            font.family: "fontAwesome"
            font.pointSize: 100
            color: yellowIcon
            Layout.alignment: Qt.AlignCenter
            text: "\uF0EB"
            //text: qsTr("Bedroom 1")
        }

        Slider {
            Layout.alignment: Qt.AlignCenter

        }

        Label {
            id: bed
            font.family: "fontAwesome"
            Layout.alignment: Qt.AlignCenter
            text: "\uf007"
            //text: qsTr("Bedroom 1")
        }
    }
}
