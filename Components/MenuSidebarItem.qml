import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

import "../Style"

ListView {
    id: listViewMenu
    property int hoverIndex: 0

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

    Component {
        id: delegateListElement

        Item {
            width: listViewMenu.width
            height: Style.window.heightItemMenu

            RowLayout {
                width: parent.width
                height: Style.window.heightContentItemMenu
                spacing: 20

                Image {
                    id: iconMenuItem
                    Layout.preferredHeight: Style.window.sizeMenuIcon
                    Layout.preferredWidth: Style.window.sizeMenuIcon
                    Layout.leftMargin: Style.margin.leftMarginOnMenu
                    source: icon

                    ColorOverlay {
                        anchors.fill: parent
                        source: iconMenuItem
                        color: ( listViewMenu.currentIndex === index ) ||
                               ( hoverIndex === index ) ? Style.color.textColor :
                                                        Style.color.textColorSecundary
                    }
                }

                Text {
                    id: labelMenuItem
                    color: ( listViewMenu.currentIndex === index ) ||
                           ( hoverIndex === index ) ? Style.color.textColor :
                                                    Style.color.textColorSecundary
                    text: name
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillWidth: true

                    //                    anchors.left: iconMenuItem.right
                    font.pointSize: 15
                    font.family: fontNunitoLight
                }

                Rectangle {
                    id: rec
                    visible: (listViewMenu.currentIndex === index)
                    Layout.preferredHeight: parent.height
                    Layout.alignment: Qt.AlignRight
                    Layout.preferredWidth: 3
                    color: Style.color.footerSelectedItemColor
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    listViewMenu.currentIndex = index
                }
                onHoveredChanged: {
                    hoverIndex = index
                }
            }
        }
    }

    model: menuModel
    delegate: delegateListElement
}
