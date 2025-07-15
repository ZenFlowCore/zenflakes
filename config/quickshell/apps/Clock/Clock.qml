import Quickshell
import QtQuick
import "../../widgets/styles"
import "root:/colors.js" as Colors

FloatingWindow {

  title: "window"
  maximumSize: Qt.size(2600, 1600)
  minimumSize: Qt.size(0, 0)

  Rectangle {
   id: nav
   implicitWidth: 300
   implicitHeight: parent.height
   color: "transparent"
   anchors.left: parent.left

 }

  Rectangle {
  implicitWidth: parent.width - nav.implicitWidth
  implicitHeight: parent.height
  color: Colors.background
  anchors.right: parent.right
  StyledText {
     text: Time.time
     font.pointSize: 100
     color: Colors.foreground
     anchors.horizontalCenter: parent.horizontalCenter
     anchors.verticalCenter: parent.verticalCenter
   }
 }
}
