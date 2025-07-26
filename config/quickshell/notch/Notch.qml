import Quickshell
import QtQuick
import QtQuick.Controls
import qs.widgets.styles
import "../colors.js" as Colors
import qs.widgets.clock
import qs.widgets.battery

PanelWindow {
    anchors {
        left: true
        right: true
        top: true
        bottom: true
    }

    color: "transparent"
    mask: Region {
        Region {
            x: e_rect.x
            y: e_rect.y
            width: e_rect.width
            height: e_rect.height
        }
    }

    StyledRect {
        id: rect
    }
    StyledRect {
        id: e_rect
        radius: e_rect.show ? 16 : 200
        implicitWidth: e_rect.show ? 404 : 48
        implicitHeight: e_rect.show ? 764 : 200
        color: Colors.foreground
        focus: true  // Required to receive keyboard input

        property bool show: false
        property bool contentExpanded: false

        StyledRect {
            width: parent.implicitWidth
            height: parent.implicitHeight
            anchors.centerIn: parent
            Clock {
                rotation: 270
                visible: e_rect.show ? false : true
                anchors.centerIn: parent
            }

            Battery {
                rotation: 270
                visible: e_rect.show ? false : true
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
            }
        }
        // Trigger content expansion after main expansion completes
        onShowChanged: {
            if (show) {
                contentExpandTimer.start();
            } else {
                contentExpanded = false;
            }
            a;
        }

        Timer {
            id: contentExpandTimer
            interval: 250  // Slightly after main animation (200ms)
            onTriggered: e_rect.contentExpanded = true
        }

        Behavior on implicitWidth {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        Behavior on implicitHeight {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        Behavior on radius {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 16
        }

        // Fix: MouseArea that properly tracks the expanding rectangle
        MouseArea {
            id: mousearea
            property bool clickLocked: false
            hoverEnabled: true
            anchors.fill: parent  // This will automatically follow the parent's size

            onClicked: {
                e_rect.show = true;
                clickLocked = true;
            }
            onDoubleClicked: {
                e_rect.show = false;
                clickLocked = false;
            }
        }

        StyledRect {
            radius: e_rect.show ? 16 : 200
            implicitWidth: e_rect.show ? parent.width - 32 : 0
            implicitHeight: e_rect.show ? parent.height - 32 : 0
            color: "transparent"
            anchors.centerIn: parent
            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on implicitHeight {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on radius {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }

            SwipeView {
                id: view
                currentIndex: 1
                anchors.fill: parent

                Item {
                    id: first

                    // Page 1: Dashboard widgets
                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 15

                        // Header
                        Text {
                            text: "Dashboard"
                            font.pixelSize: 24
                            font.bold: true
                            color: Colors.background
                            opacity: e_rect.contentExpanded ? 1 : 0
                            Behavior on opacity {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.OutQuad
                                }
                            }
                        }

                        // Widget grid
                        Grid {
                            columns: 2
                            spacing: 12
                            anchors.horizontalCenter: parent.horizontalCenter

                            // Widget 1
                            StyledRect {
                                width: 150
                                height: 100
                                color: Colors.color11
                                radius: 12
                                scale: e_rect.contentExpanded ? 1 : 0.3
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    NumberAnimation {
                                        duration: 400
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 50
                                    }
                                    NumberAnimation {
                                        duration: 300
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Weather"
                                    color: "white"
                                    font.pixelSize: 16
                                }
                            }

                            // Widget 2
                            StyledRect {
                                width: 150
                                height: 100
                                color: Colors.blue
                                radius: 12
                                scale: e_rect.contentExpanded ? 1 : 0.3
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    PauseAnimation {
                                        duration: 100
                                    }
                                    NumberAnimation {
                                        duration: 400
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 150
                                    }
                                    NumberAnimation {
                                        duration: 300
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Calendar"
                                    color: "white"
                                    font.pixelSize: 16
                                }
                            }

                            // Widget 3
                            StyledRect {
                                width: 150
                                height: 100
                                color: "#ff6b6b"
                                radius: 12
                                scale: e_rect.contentExpanded ? 1 : 0.3
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    PauseAnimation {
                                        duration: 200
                                    }
                                    NumberAnimation {
                                        duration: 400
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 250
                                    }
                                    NumberAnimation {
                                        duration: 300
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Tasks"
                                    color: "white"
                                    font.pixelSize: 16
                                }
                            }

                            // Widget 4
                            StyledRect {
                                width: 150
                                height: 100
                                color: "#4ecdc4"
                                radius: 12
                                scale: e_rect.contentExpanded ? 1 : 0.3
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    PauseAnimation {
                                        duration: 300
                                    }
                                    NumberAnimation {
                                        duration: 400
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 350
                                    }
                                    NumberAnimation {
                                        duration: 300
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Music"
                                    color: "white"
                                    font.pixelSize: 16
                                }
                            }
                        }

                        // Quick actions
                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 10

                            StyledRect {
                                width: 60
                                height: 60
                                radius: 30
                                color: Colors.background
                                scale: e_rect.contentExpanded ? 1 : 0
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    PauseAnimation {
                                        duration: 400
                                    }
                                    NumberAnimation {
                                        duration: 300
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 450
                                    }
                                    NumberAnimation {
                                        duration: 200
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "+"
                                    color: Colors.foreground
                                    font.pixelSize: 24
                                    font.bold: true
                                }
                            }

                            StyledRect {
                                width: 60
                                height: 60
                                radius: 30
                                color: Colors.background
                                scale: e_rect.contentExpanded ? 1 : 0
                                opacity: e_rect.contentExpanded ? 1 : 0
                                Behavior on scale {
                                    PauseAnimation {
                                        duration: 500
                                    }
                                    NumberAnimation {
                                        duration: 300
                                        easing.type: Easing.OutBack
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: 550
                                    }
                                    NumberAnimation {
                                        duration: 200
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "⚙"
                                    color: Colors.foreground
                                    font.pixelSize: 20
                                }
                            }
                        }
                    }
                }

                Item {
                    id: secondPage

                    // Page 2: Settings/Controls
                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 20

                        Text {
                            text: "Controls"
                            font.pixelSize: 24
                            font.bold: true
                            color: Colors.background
                            opacity: e_rect.contentExpanded ? 1 : 0
                            Behavior on opacity {
                                NumberAnimation {
                                    duration: 300
                                }
                            }
                        }

                        // Control items that slide in from the right
                        Repeater {
                            model: ["Brightness", "Volume", "WiFi", "Bluetooth"]

                            StyledRect {
                                width: parent.width - 40
                                height: 50
                                color: Colors.background
                                radius: 8
                                x: e_rect.contentExpanded ? 0 : parent.width
                                opacity: e_rect.contentExpanded ? 1 : 0

                                Behavior on x {
                                    PauseAnimation {
                                        duration: index * 100
                                    }
                                    NumberAnimation {
                                        duration: 400
                                        easing.type: Easing.OutQuart
                                    }
                                }
                                Behavior on opacity {
                                    PauseAnimation {
                                        duration: index * 100 + 50
                                    }
                                    NumberAnimation {
                                        duration: 300
                                    }
                                }

                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData
                                    color: Colors.foreground
                                    font.pixelSize: 16
                                }
                            }
                        }
                    }
                }

                Item {
                    id: thirdPage

                    // Page 3: Stats/Info
                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 15

                        Text {
                            text: "System Info"
                            font.pixelSize: 24
                            font.bold: true
                            color: Colors.background
                            opacity: e_rect.contentExpanded ? 1 : 0
                            Behavior on opacity {
                                NumberAnimation {
                                    duration: 300
                                }
                            }
                        }

                        // Info cards that fade in with stagger
                        Grid {
                            columns: 1
                            spacing: 12
                            anchors.horizontalCenter: parent.horizontalCenter

                            Repeater {
                                model: [
                                    {
                                        title: "CPU Usage",
                                        value: "45%",
                                        color: Colors.blue
                                    },
                                    {
                                        title: "Memory",
                                        value: "8.2 GB",
                                        color: Colors.color11
                                    },
                                    {
                                        title: "Storage",
                                        value: "256 GB",
                                        color: "#ff6b6b"
                                    },
                                    {
                                        title: "Network",
                                        value: "Connected",
                                        color: "#4ecdc4"
                                    }
                                ]

                                StyledRect {
                                    width: 320
                                    height: 60
                                    color: modelData.color
                                    radius: 8
                                    scale: e_rect.contentExpanded ? 1 : 0.8
                                    opacity: e_rect.contentExpanded ? 1 : 0

                                    Behavior on scale {
                                        PauseAnimation {
                                            duration: index * 80
                                        }
                                        NumberAnimation {
                                            duration: 350
                                            easing.type: Easing.OutBack
                                        }
                                    }
                                    Behavior on opacity {
                                        PauseAnimation {
                                            duration: index * 80 + 100
                                        }
                                        NumberAnimation {
                                            duration: 250
                                        }
                                    }

                                    Row {
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        spacing: 10

                                        Text {
                                            text: modelData.title
                                            color: "white"
                                            font.pixelSize: 16
                                        }

                                        Text {
                                            text: modelData.value
                                            color: "white"
                                            font.pixelSize: 16
                                            font.bold: true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Row {
                id: indicator
                anchors.bottom: view.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 20
                spacing: 8

                visible: e_rect.show
                opacity: e_rect.contentExpanded ? 1 : 0

                Behavior on opacity {
                    PauseAnimation {
                        duration: 200
                    }
                    NumberAnimation {
                        duration: 300
                    }
                }

                Repeater {
                    model: view.count

                    StyledRect {
                        width: view.currentIndex === index ? 24 : 8
                        height: 8
                        radius: 4
                        color: view.currentIndex === index ? Colors.blue : "#90" + Colors.background.slice(1)

                        Behavior on width {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutCubic
                            }
                        }

                        Behavior on color {
                            ColorAnimation {
                                duration: 200
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                view.currentIndex = index;
                            }
                        }
                    }
                }
            }
        }
    }
}
