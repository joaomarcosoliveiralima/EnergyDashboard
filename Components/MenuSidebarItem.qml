import QtQuick 2.12

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
            height: 40

            Row {
                anchors.fill: parent

                Image {
                    height: parent.height
                    width: 40
                    source: icon
                }
                Text {
                    font.pointSize: 15
                    color: "white"
                    text: name
                }
            }
        }
    }

    delegate: delegateListElement
}
