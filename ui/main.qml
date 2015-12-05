import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1


ApplicationWindow {
    visible: true
    width: 1600
    height: 900
    title: "uCode"
    color:  "white"

    //Creates the Menu bar at the top
    menuBar : UMenuBar {

    }

    //Main Window
    RowLayout {
        id: mainWindow
        anchors.fill: parent
        spacing: 5

        // Creates the Canvas to draw the UML Diagram
        UDrawingCanvas {
            id: myDrawingCanvas
            Layout.preferredWidth: parent.width * 0.75
            Layout.preferredHeight: parent.height
        }

        //Right column with buttons and boxes
        ColumnLayout {
            id: sideWindow
            spacing : 5
            Layout.preferredWidth: parent.width * 0.25
            Layout.preferredHeight: parent.height
            Layout.margins: 10
            Layout.leftMargin: 5

            // Buttons Base, Interface and Child
            UClassTypeSelection {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height * 0.05
            }

            //Boxes and buttons Create and Update
            UClassPanel {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height * 0.95
            }
        }
    }
}