import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Weather")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    RowLayout {
        anchors.fill: parent
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignCenter
        spacing: 6
        ColumnLayout {
            Layout.alignment: Qt.AlignCenter

            Label {
                id: iconSun
                font.family: fontWeather
                font.pointSize: 90
                color: yellowIcon
                Layout.alignment: Qt.AlignCenter
                text: "\uf06e"
            }

            Label {
                id: text
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Mostly Sunny")
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter

            Label {
                id: top
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Irvine")
            }

            Label {
                id: temp
                font.pointSize: 50
                text: qsTr("68°")
            }

            Label {
                id: cood
                text: qsTr("H 76° L 52°")
            }
        }
    }
}
