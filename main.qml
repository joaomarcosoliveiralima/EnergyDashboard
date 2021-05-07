import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

import "./Pages"
import "./Components"
import "FontAwesome"
import "FontWeather"

ApplicationWindow {
    /**
        Definindo todas as property como fontes e cores do sistema.
    **/

    property alias fontWeather: fontAwesomeLoadder.name
    property alias fontAwesome: fontAwesome.name
    property color yellowIcon: "#F1C40F"
    property color backGroundColor: "#000015"
    property color drawerBackgroudColor: "#181745"
    property color footerColor: "#131428"
    property color textColor: "#FFFFFF"
    property color textColorSecudary: "#e6526d"
    property color recentActivityBackground: "#0c1534"
    property color footerSelectedItemColor: "#1ABC9C"
    property color colorGradient_1: "#216e93"
    property color colorGradient_2: "#21648a"
    property color colorGradient_3: "#1f5881"
    property color colorGradient_4: "#191c51"

    property int minHeightDashboardItem: 300
    property int minHeightToolbar: 68
    property int maxWidthDrawerItem: 350
    property int spaceCell: 5
    property int appWidth: 1300//Screen.width
    property int appHeight: 800//Screen.height
    property real toolBarHeight: 68//Screen.height
    property int dividerHeight: 2//Screen.height
    property int toolBarOnDrawerHeight: 120//Screen.height

    id: window
    width: appWidth
    height: appHeight
    visible: true
    title: qsTr("Tabs")

    /**
        Alteração nas cores do tema padrão do qml
    **/
    Material.accent: footerSelectedItemColor
    Material.background: backGroundColor
    Material.theme: Material.Dark


    FontLoader {
        id: fontAwesome;
        source: "qrc:/FontAwesome/fontawesome-webfont.ttf"
    }

    FontLoader {
        id: fontAwesomeLoadder
        source: "qrc:/FontWeather/weathericons-regular-webfont.ttf"
    }


    ToolBar {
        id: overlayHeader
        z: 1
        visible: !(parent.width > 500)
        background: Rectangle {
            color: drawerBackgroudColor
        }

        width: parent.width
        height: toolBarHeight

        RowLayout {
            anchors.fill: parent
            ToolButton {
                id: menuButton
                text: qsTr("‹")
                onClicked: drawer.toggle()
            }

            Label {
                text: "FUSiON SMART"
                id: title
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                color: textColor
                font.pixelSize: 24
            }

            Label {
                text: "BETA"
                elide: Label.ElideRight
                color: textColorSecudary
                font.pixelSize: 15
            }
        }
    }

    NavigationDrawer {
        id: drawer
        width: parent.width > 500 ? maxWidthDrawerItem : parent.width * 0.75
        height: window.height
        open: true
        //        background: Rectangle {
        //            color: drawerBackgroudColor
        //        }

        ToolBar {
            id: toolBarOnDrawer
            width: parent.width
            height: toolBarOnDrawerHeight
            background: Rectangle {
                color: drawerBackgroudColor
            }

            GridLayout {
                anchors.fill: parent
                columns: (drawer.width < minHeightDashboardItem)? 1 : 2

                Label {
                    text: "FUSiON SMART"
                    elide: Label.ElideRight
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    //verticalAlignment: Qt.AlignVCenter
                    //Layout.fillWidth: true
                    color: textColor
                    font.pixelSize: 24
                }

                Label {
                    text: "BETA"
                    elide: Label.ElideRight
                    color: textColorSecudary
                    font.pixelSize: 15
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                }
            }
        }

        Rectangle {
            width: parent.width
            height: dividerHeight
            anchors.top: toolBarOnDrawer.bottom
            color: footerSelectedItemColor
        }

        color: drawerBackgroudColor
        position: Qt.LeftEdge
    }

    Rectangle {
        anchors.left: drawer.right
        height: parent.height
        width: parent.width
        layer.enabled: true
        layer.effect: LinearGradient {
            start: Qt.point(0, 0)
            end: Qt.point(window.width - 100, window.height - 100)
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: colorGradient_1
                }
                GradientStop {
                    position: 0.33
                    color: colorGradient_2
                }
                GradientStop {
                    position: 0.66
                    color: colorGradient_3
                }
                GradientStop {
                    position: 1
                    color: colorGradient_4
                }
            }
        }

        MouseArea{
            anchors.fill: parent

            onClicked: {

            }
        }
    }

    //    footer: TabBar {
    //        id: tabBar
    //        currentIndex: swipeView.currentIndex

    //        TabButton {
    //            text: qsTr("DASHBOARD")
    //        }
    //        TabButton {
    //            text: qsTr("WEATHER")
    //        }
    //        TabButton {
    //            text: qsTr("CLIMATE")
    //        }
    //        TabButton {
    //            text: qsTr("LIGHTS")
    //        }

    //        background: Rectangle {
    //            color: footerColor
    //        }
    //    }
}
