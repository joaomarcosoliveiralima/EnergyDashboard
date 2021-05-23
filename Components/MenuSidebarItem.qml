import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ListView {
    id: listViewMenu

    ListModel {
        id: menuModel

        ListElement {
            name: "Dashboard"
            icon: "qrc:/assets/images/Dashboard.svg"
        }
        ListElement {
            name: "Cost"
            icon: "qrc:/assets/images/Cost.svg"
        }
        ListElement {
            name: "Appliances"
            icon: "qrc:/assets/images/Appliances.svg"
        }
        ListElement {
            name: "Usage-by-rooms"
            icon: "qrc:/assets/images/Usage_by_rooms.svg"
        }
        ListElement {
            name: "Emissions"
            icon: "qrc:/assets/images/Emissions.svg"
        }
    }

    model: menuModel

    Component {
        id: delegateListElement

        Item {
            width: listViewMenu.width
            height: 70

            RowLayout {
                width: parent.width
                height: 40
                spacing: 20

                Image {
                    id: iconMenuItem
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 30
                    Layout.leftMargin: 25
//                    height: parent.height
//                    width: 30
                    source: icon
                }
                Text {
                    id: labelMenuItem
                    color: "white"
                    text: name
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillWidth: true

//                    anchors.left: iconMenuItem.right
                    font.pointSize: 15
                    font.family: fontNunitoLight
                }
                Rectangle {
                    id: rec
                    Layout.preferredHeight: parent.height
                    Layout.alignment: Qt.AlignRight
                    Layout.preferredWidth: 3
                    color: footerSelectedItemColor
                }
            }
        }
    }


    delegate: delegateListElement
}
