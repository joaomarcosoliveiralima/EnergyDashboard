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
import "./Ionicons/ionicons.js" as Ionicons


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
    property int sizePerfilCircleIn: 65
    property int sizePerfilCircleOut: 75
    property int maxWidthDrawerItem: 350
    property int spaceCell: 5
    property int appWidth: 1300//Screen.width
    property int appHeight: 800//Screen.height
    property int toolBarHeight: 68//Screen.height
    property int dividerHeight: 2//Screen.height
    property int toolBarOnDrawerHeight: 100//Screen.height

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

    FontLoader {
        id: ioniconsFont;
        source: "qrc:/Ionicons/ionicons.ttf"
    }



    ToolBar {
        id: overlayHeader
        z: 1
        visible: (parent.width < 500)
        width: parent.width
        height: toolBarHeight
        background: Rectangle {
            color: drawerBackgroudColor
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width

            ToolButton {
                id: menuButton
                height: parent.height
                font.family: ioniconsFont.name
                //Layout.alignment: Qt.AlignCenter
                anchors.leftMargin: 100
                palette.buttonText: textColor
                text: "\uF32A"
                font.pixelSize: 30
                onClicked: drawer.toggle()
                leftPadding: 30

                background: Rectangle {
                    color: drawerBackgroudColor
                }
            }

            Label {
                text: "FUSiON SMART"
                id: title
                elide: Label.ElideRight
                Layout.alignment: Qt.AlignRight | Qt.AlignHCenter
                color: textColor
                font.pixelSize: 24
            }

            Label {
                text: "BETA"
                elide: Label.ElideRight
                color: textColorSecudary
                font.pixelSize: 15
                Layout.alignment: Qt.AlignRight | Qt.AlignHCenter
            }
        }
    }

    NavigationDrawer {
        id: drawer
        width: parent.width > 500 ? maxWidthDrawerItem : parent.width * 0.75
        height: window.height
        open: (parent.width > 500)
        color: drawerBackgroudColor
        anchors.top: parent.top
        anchors.topMargin: 0
        position: Qt.LeftEdge

        ToolBar {
            id: toolBarOnDrawer
            width: parent.width
            height: toolBarOnDrawerHeight
            background: Rectangle {
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
                }
            }
        }

        Rectangle {
            id: perfilCircleOut
            width: sizePerfilCircleOut
            height: sizePerfilCircleOut
            radius: sizePerfilCircleOut / 2
            anchors.verticalCenter: toolBarOnDrawer.bottom
            anchors.horizontalCenter: toolBarOnDrawer.horizontalCenter
            opacity: 0.2
        }

        Rectangle {
            width: parent.width
            height: dividerHeight
            anchors.top: toolBarOnDrawer.bottom
            color: footerSelectedItemColor
        }

        Rectangle {
            id: perfilCircleIn
            width: sizePerfilCircleIn
            height: sizePerfilCircleIn
            radius: sizePerfilCircleIn / 2
            anchors.centerIn: perfilCircleOut
            color: drawerBackgroudColor

            Text {
                id: iconPerfil
                //anchors.fill: parent
                font.family: ioniconsFont.name
                anchors.horizontalCenter: perfilCircleIn.horizontalCenter
                anchors.verticalCenter: perfilCircleIn.verticalCenter
                text: "\uF345"
                color: textColor
                font.pixelSize: 50
            }

        }

        Rectangle {
            id: contentDrawer
            width: parent.width
            anchors.top: perfilCircleOut.bottom
            anchors.bottom: parent.bottom
            color: drawerBackgroudColor

            GridLayout {
                width: 210
                height: 28
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                columns: (drawer.width < minHeightDashboardItem)? 1 : 2

                Text {
                    id: drawerLabel
                    text: "FUSiON SMART"
                    Layout.alignment: Qt.AlignTop
                    color: textColor
                    font.pixelSize: 24
                }

                Text {
                    id: betaLabel
                    text: "BETA"
                    color: textColorSecudary
                    font.pixelSize: 15
                    Layout.alignment: Qt.AlignBottom
                }
            }

            ListView {

            }
        }
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

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
