import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../Style"

Page {
    id: page
    property int iNumberOfElemenetsH: 3
    property int iNumberOfElemenetsV: 2

    header: Label {
        text: qsTr("DASHBOARD")
        font.pixelSize: Qt.application.font.pixelSize * 2
        font.family: fontNunitoLight
        padding: 24
        color: Style.color.textColor
    }

    background: Rectangle {
        color: Style.color.backGroundColor
    }

    ListModel {
        id: listCharts

        ListElement {
            label: "COST PREDICTED"
            source: ""
        }

        ListElement {
            label: "CHANGE IN COST"
            source: ""
        }

        ListElement {
            label: "USAGE ESTIMATE"
            source: ""
        }

        ListElement {
            label: "ACTIVE APPLIANCES"
            source: ""
        }

        ListElement {
            label: "ENERGY INTENSITY"
            source: ""
        }

        ListElement {
            label: "CARBON FOOTPRINT"
            source: ""
        }
    }

    Component {
        id: containerCharts
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                anchors.fill: parent
                id: backgroundContainer
                color: Style.color.containerColor
                opacity: .6
                radius: 4
            }

            Text {
                id: title
                text: label
                padding: 7
                color: Style.color.textColor
                opacity: 1
                font.pixelSize: 15
                font.family: fontNunitoLight
                anchors.top: parent.top
            }

            Rectangle {
                id: line
                width: parent.width
                height: 2
                color: Style.color.drawerBackgroudColor
                anchors.top: title.bottom
            }
            Rectangle {
                id: contantItem
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.top: line.bottom
                opacity: 0
            }

        }
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 20
        implicitHeight: 800
        rowSpacing: 5
        columnSpacing: 5
        columns: iNumberOfElemenetsH
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom

        Repeater {
            model: listCharts
            delegate: containerCharts
        }
    }

    MouseArea{
        anchors.fill: parent

    }
}
