pragma Singleton

import QtQuick 2.0

QtObject {

    readonly property QtObject window: QtObject {
        property int minHeightDashboardItem: 300
        property int minOpenDrawer: 500
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
        property int heightContentItemMenu: 40
        property int heightItemMenu: 70
        property int sizeMenuIcon: 30
    }

    readonly property QtObject color: QtObject {
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
    }

    readonly property QtObject margin: QtObject {
        property int leftMarginOnMenu: 25
        property int leftMarginOnLabel: 20
        property int topMarginMenuItem: 130

    }
}
