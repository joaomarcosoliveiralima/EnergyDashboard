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
        padding: 20
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
            width: grid.cellWidth - Style.window.spaceInGrid
            height: grid.cellHeight - Style.window.spaceInGrid
            Layout.minimumHeight: Style.window.heightContentChart

            Rectangle {
                id: backgroundContainer
                width: grid.cellWidth - Style.window.spaceInGrid
                height: grid.cellHeight - Style.window.spaceInGrid
                x: Style.window.spaceCell
                color: Style.color.containerColor
                opacity: .6
                radius: 4
            }

            Text {
                id: title
                x: Style.window.spaceCell
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
                x: Style.window.spaceCell
                width: parent.width
                height: 2
                color: Style.color.drawerBackgroudColor
                anchors.top: title.bottom
            }
            Rectangle {
                id: contantItem
                x: Style.window.spaceCell
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.top: line.bottom
                opacity: 0
            }

        }
    }


    ScrollView {
        anchors.fill: parent
        GridView {
            id: grid
            anchors.fill: parent
            cellWidth: getCellWidth()
            cellHeight: Style.window.heightContentChart
            model: listCharts
            delegate: containerCharts
            focus: true

            //        ScrollBar.vertical: ScrollBar { }
        }
    }

    MouseArea{
        anchors.fill: parent

        onClicked: {

        }
    }

    function getCellWidth(){
        if ((grid.width) < Style.window.heightContentChart * 2){
            return grid.width;
        }else if ((grid.width / 3) < Style.window.heightContentChart){
            return (grid.width / 2)
        }else{
            return (grid.width / 3);
        }
    }
}
