import QtQuick 2.12
import QtQuick.Controls 2.5
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
    property color recentActivityBackground: "#0c1534"
    property color footerSelectedItemColor: "#1ABC9C"
    property color colorGradient_1: "#216e93"
    property color colorGradient_2: "#21648a"
    property color colorGradient_3: "#1f5881"
    property color colorGradient_4: "#191c51"

    property int minHeightDashboardItem: 400
    property int spaceCell: 5
    property int appWidth: Screen.width
    property int appHeight: Screen.height

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


    NavigationDrawer {
        id: drawer
        width: parent.width > 1200 ? (parent.width * 0.15) : (parent.width * 0.25)
        height: window.height
        open: true
        color: drawerBackgroudColor
        position: Qt.LeftEdge

    }


    //    Drawer {
    //        id: sideBar
    //        width: 800//parent.width > 1200 ? (parent.width * 0.15) : (parent.width * 0.25)
    //        height: 400
    //        background: Rectangle{
    //            color: "white"
    //        }
    //    }

    //    Rectangle{
    //        id: sideBar
    //        width: parent.width > 1200 ? (parent.width * 0.15) : (parent.width * 0.25)
    //        height: parent.height
    //        color: backGroundColor
    //    }

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

    //    SwipeView {
    //        id: swipeView
    //        anchors.fill: parent
    //        currentIndex: tabBar.currentIndex

    //        Dashboard {
    //        }
    //        Weather{
    //        }
    //        Climate {
    //        }
    //        Lighting {
    //        }
    //    }

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
