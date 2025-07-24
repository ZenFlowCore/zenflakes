import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import "colors.js" as Colors
import qs.widgets.audio
import qs.widgets.border
import qs.apps.applaunch
import qs.bar

Scope {

    Audio {}

    Bar {}

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
