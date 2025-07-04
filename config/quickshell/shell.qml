import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland 
import "colors.js" as Colors
import "widgets"
import "bars/eBars/right_bar"
import "bars/eBars/bar"
import "widgets/audio"
import "widgets/bar"
import "widgets/right_bar"
import "widgets/border"
Scope { 
    
  Audio {}

  Bar {}
  
  Right_Bar {}

  Border {}

  Connections {
    function onReloadCompleted() {
      Quickshell.inhibitReloadPopup();
    }

    function onReloadFailed() {
      Quickshell.inhibitReloadPopup();
    }

    target: Quickshell
  }

}

