import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

import "./Pages"
import "assets/fonts/Nunito_Sans"
import "./Components"
import "FontAwesome"
import "FontWeather"
import "./Ionicons/ionicons.js" as Ionicons
import "Style"


ApplicationWindow {

    property alias fontWeather: fontAwesomeLoadder.name
    property alias fontAwesome: fontAwesome.name
    property alias fontNunitoLight: nunitoFont.name

    property bool mobileView: false


    id: window
    width: Style.window.appWidth
    height: Style.window.appHeight
    visible: true
    title: qsTr("Smart Energy")

    /**
        Alteração nas cores do tema padrão do qml
    **/
    Material.accent: Style.color.footerSelectedItemColor
    Material.background: Style.color.backGroundColor
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

    FontLoader {
        id: nunitoFont;
        source: "qrc:/assets/fonts/Nunito_Sans/NunitoSans-Light.ttf"
    }



    ToolBar {
        id: overlayHeader
        z: 1
        visible: (parent.width < Style.window.minOpenDrawer)
        width: parent.width
        height: Style.window.toolBarHeight
        background: Rectangle {
            color: Style.color.drawerBackgroudColor
        }

        RowLayout {

            //anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent

            ToolButton {
                id: menuButton
                height: parent.height
                font.family: ioniconsFont.name
                //Layout.alignment: Qt.AlignCenter
                palette.buttonText: Style.color.textColor
                text: "\uF32A"
                font.pixelSize: 30

                onClicked: drawer.toggle()
                leftPadding: Style.margin.leftMarginOnMenu

                background: Rectangle {
                    color: Style.color.drawerBackgroudColor
                }
            }

            Label {
                text: "FUSiON SMART"
                id: title
                elide: Label.ElideRight
                Layout.leftMargin: Style.margin.leftMarginOnLabel
                Layout.alignment: Qt.AlignVCenter
                color: Style.color.textColor
                font.pixelSize: 24
                font.family: fontNunitoLight
            }

            Label {
                text: "BETA"
                elide: Label.ElideRight
                color: Style.color.colorSecudary
                font.pixelSize: 15
                Layout.fillWidth: true
                font.family: fontNunitoLight
            }
        }
    }

    NavigationDrawer {
        id: drawer
        width: parent.width > Style.window.mobileWidth ? Style.window.maxWidthDrawerItem : parent.width * 0.85
        height: window.height
        open: (parent.width > Style.window.minOpenDrawer )
        color: Style.color.drawerBackgroudColor
        anchors.top: parent.top
        anchors.topMargin: 0
        position: Qt.LeftEdge

        ToolBar {
            id: toolBarOnDrawer
            width: parent.width
            height: Style.window.toolBarOnDrawerHeight
            background: Rectangle {
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: Style.color.colorGradient_1
                    }
                    GradientStop {
                        position: 0.33
                        color: Style.color.colorGradient_2
                    }
                    GradientStop {
                        position: 0.66
                        color: Style.color.colorGradient_3
                    }
                }
            }
        }

        Rectangle {
            id: perfilCircleOut
            width: Style.window.sizePerfilCircleOut
            height: Style.window.sizePerfilCircleOut
            radius: Style.window.sizePerfilCircleOut / 2
            anchors.verticalCenter: toolBarOnDrawer.bottom
            anchors.horizontalCenter: toolBarOnDrawer.horizontalCenter
            opacity: 0.2
        }

        Rectangle {
            width: parent.width
            height: Style.window.dividerHeight
            anchors.top: toolBarOnDrawer.bottom
            color: Style.color.footerSelectedItemColor
        }

        Rectangle {
            id: perfilCircleIn
            width: Style.window.sizePerfilCircleIn
            height: Style.window.sizePerfilCircleIn
            radius: Style.window.sizePerfilCircleIn / 2
            anchors.centerIn: perfilCircleOut
            color: Style.color.drawerBackgroudColor

            Text {
                id: iconPerfil
                //anchors.fill: parent
                font.family: ioniconsFont.name
                anchors.horizontalCenter: perfilCircleIn.horizontalCenter
                anchors.verticalCenter: perfilCircleIn.verticalCenter
                text: "\uF345"
                color: Style.color.textColor
                font.pixelSize: 50
            }

        }

        Rectangle {
            id: contentDrawer
            width: parent.width
            anchors.top: perfilCircleOut.bottom
            anchors.bottom: parent.bottom
            color: Style.color.drawerBackgroudColor

            GridLayout {
                id: gridLabel
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                columns: (drawer.width < Style.window.minHeightDashboardItem) ? 1 : 2

                Text {
                    id: drawerLabel
                    text: "FUSiON SMART"
                    Layout.alignment: Qt.AlignTop
                    color: Style.color.textColor
                    font.pixelSize: 24
                    font.family: fontNunitoLight
                }

                Text {
                    id: betaLabel
                    text: "BETA"
                    color: Style.color.colorSecudary
                    font.pixelSize: 15
                    Layout.alignment: Qt.AlignBottom
                    font.family: fontNunitoLight
                }
            }

            MenuSidebarItem {
                id: menuSidebarItem
                topMargin: Style.margin.topMarginMenuItem
                interactive: false
                anchors.top: gridLabel.bottom
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height
                focus: true
                onCurrentIndexChanged: {
                    console.log("Changed Current Index: " +
                                menuSidebarItem.currentIndex)
                }
            }
        }
    }

    SwipeView {
        id: swipeView

        currentIndex: menuSidebarItem.currentIndex
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: overlayHeader.visible ? parent.left : drawer.right

        Item {
            //            ScrollView {
            //                anchors.fill: parent
            //                ScrollBar.vertical.interactive: true
            //                contentWidth: parent.width
            //                contentHeight: 1200

            Dashboard {
                id: dashboardPage
                anchors.fill: parent
                background: Loader { sourceComponent: gradientBackground }
            }
            //   }
        }

        Item {
            Cost {
                id: costPage
                anchors.fill: parent
                background: Loader { sourceComponent: gradientBackground }
            }
        }

        Item {
            Appliances {
                id: appliancesPage
                anchors.fill: parent
                background: Loader { sourceComponent: gradientBackground }
            }
        }

        Item {
            UsageByRooms {
                id: usageByRoomsPage
                anchors.fill: parent
                background: Loader { sourceComponent: gradientBackground }
            }
        }

        Item {
            Emissions {
                id: emissionsPage
                anchors.fill: parent
                background: Loader { sourceComponent: gradientBackground }
            }
        }

        onCurrentIndexChanged: {
            if ( menuSidebarItem.currentIndex !== swipeView.currentIndex ) {
                menuSidebarItem.currentIndex = swipeView.currentIndex
            }
        }
    }

    PageIndicator {
        id: viewIndicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: swipeView.horizontalCenter

        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8

            radius: width / 2
            color: Style.color.footerSelectedItemColor

            opacity: index === swipeView.currentIndex ? 1 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }

    }


    Component {
        id: gradientBackground

        Rectangle {
            layer.enabled: true
            anchors.fill: parent

            layer.effect: LinearGradient {
                start: Qt.point(0, 0)
                end: Qt.point(window.width - 100, window.height - 100)
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: Style.color.colorGradient_1
                    }
                    GradientStop {
                        position: 0.33
                        color: Style.color.colorGradient_2
                    }
                    GradientStop {
                        position: 0.66
                        color: Style.color.colorGradient_3
                    }
                    GradientStop {
                        position: 1
                        color: Style.color.colorGradient_4
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
