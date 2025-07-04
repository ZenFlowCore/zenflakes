// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/widgets/battery"
import "root:/widgets/clock"
import "root:/widgets/audio"
import "root:/widgets/workspaces"
import "root:/widgets/logout"
import "root:/widgets/border"
import "root:/colors.js" as Colors
import "root:/widgets/test"
import "root:/widgets/styles"
import "root:/widgets/tools"
Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: bar
            property var modelData
            property real margin: 15
            property real base_margin: 20
            property bool isSoleBar: Quickshell.screens.length == 1
            screen: modelData

            anchors {
                left: true
                top: true
                bottom: true
            }

            color: "#00" + Colors.background.slice(1)
            implicitWidth: 50
            
            
            Column {
                id: column
                anchors.fill: parent
                spacing: 10

                // Arch
                StyledRect {
                    id: archie
                    implicitHeight: 60
                    anchors.topMargin: margin
                    implicitWidth: 96
                    anchors.top: parent.top
                    anchors.bottom: clockie
                    Text {
                        text: ""
                        // rotation: 270
                        font.pointSize: 15
                        color: Colors.primary
                        anchors.centerIn: parent
                    }
                }
                        
                StyledRect {
                    id: toolie
                    anchors {
                        top: archie.bottom

                    }

                       
                    Tools {}
                    implicitWidth: 96
                    implicitHeight: 60
                     
                }    

                // Clock
                StyledRect {
                    id: clockie
                    Clock {
                    }
                }
                // Workspace
                StyledRect {
                    id: workies
                    anchors.bottom: loggie.top
                    anchors.top: clockie.bottom
                    anchors.right: parent.right
                    Workspace {}
                }
                // Test
                StyledRect {

                    implicitWidth: 96
                    implicitHeight: 60
                    anchors.bottom: batterie.top
                    anchors.bottomMargin: margin

                    Test {}
                }  
                // Battery
                StyledRect {
                    id: batterie
                    implicitHeight: 60
                    implicitWidth: 96
                    anchors.bottom: loggie.top
                    Battery {}

                }
                
                  

                StyledRect {
                    id: loggie
                    implicitWidth: 96
                    implicitHeight: 60
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: margin

                    Logout {
                        id: wlogout
                    }
                    Text {
                        text: ""
                        anchors.centerIn: parent
                        color: Colors.primary
                        font.pointSize: 13
                    }

                    property bool show: false

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loggie.show = true;
                            console.log("gud");
                        }
                    }
                }
                    
               }
        }
    }
}
