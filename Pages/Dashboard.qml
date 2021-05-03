import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    id: page
    property int iNumberOfElemenetsH: 3
    property int iNumberOfElemenetsV: 2

    header: Label {
        text: qsTr("DASHBOARD")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
        color: textColor
    }

    background: Rectangle {
        color: backGroundColor
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 20
        implicitHeight: 800
        rowSpacing: 5
        columnSpacing: 5
        columns: iNumberOfElemenetsH
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom

        Rectangle {
            id: weatherRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: colorMenuDashboard_1}
                GradientStop { position: 0.40; color: colorMenuDashboard_2 }
                GradientStop { position: 1.0; color: colorMenuDashboard_3}
            }

            Label {
                anchors.centerIn: parent
                text: "Weather"
                color: "white"
            }
        }

        Rectangle {
            id: lightingRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: colorMenuDashboard_1}
                GradientStop { position: 0.40; color: colorMenuDashboard_2 }
                GradientStop { position: 1.0; color: colorMenuDashboard_3}
            }

            Label {
                anchors.centerIn: parent
                text: "Lighting"
                color: "white"
            }
        }

        Rectangle {
            id: climateRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: colorMenuDashboard_1}
                GradientStop { position: 0.40; color: colorMenuDashboard_2 }
                GradientStop { position: 1.0; color: colorMenuDashboard_3}
            }

            Label {
                anchors.centerIn: parent
                text: "Climate"
                color: "white"
            }
        }

        Rectangle {
            id: securityRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: colorMenuDashboard_1}
                GradientStop { position: 0.40; color: colorMenuDashboard_2 }
                GradientStop { position: 1.0; color: colorMenuDashboard_3}
            }

            Label {
                anchors.centerIn: parent
                text: "Security"
                color: "white"
            }
        }
        Rectangle {
            id: energyMonitorRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: colorMenuDashboard_1}
                GradientStop { position: 0.40; color: colorMenuDashboard_2 }
                GradientStop { position: 1.0; color: colorMenuDashboard_3}
            }

            Label {
                anchors.centerIn: parent
                text: "Energy Monitor"
                color: "white"
            }
        }

        Rectangle {
            id: recentActivityRec
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: recentActivityBackground

            Label {
                anchors.centerIn: parent
                text: "Recent Activity"
                color: "white"
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log(appWidth/3)
        }
    }
}
