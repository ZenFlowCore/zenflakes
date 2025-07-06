import QtQuick
import Quickshell
import "root:/colors.js" as Colors
import "../styles"

Item {
    id: clockie
    implicitHeight: parent.width + 20
    implicitWidth: parent.width

    StyledText {
        text: Time.time
        font.family: "JetBrainsMono Nerd Font Mono"
        font.pointSize: 13
        anchors.horizontalCenter: parent.horizontalCenter
    }

    property bool show: false

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: clockie.show = true
        onExited: clockie.show = false
    }

    PopUpCalendar {}
}
