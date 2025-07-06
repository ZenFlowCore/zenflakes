import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "../../colors.js" as Colors
import "."

PanelWindow {
    id: poppie

    visible: clockie.show

    anchors.top: parent.top
    anchors.right: parent.right
    color: Colors.primary
}
