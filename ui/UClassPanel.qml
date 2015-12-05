import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

ColumnLayout {
    id: classPanel
    spacing : 0

    Label {
        Layout.fillHeight: true
        Layout.fillWidth: true

        StyledText {
            text: "Baseclass"
            horizontalAlignment: Text.AlignLeft
        }
    }

    TextField {
        id: parentField
        Layout.fillHeight: true
        Layout.fillWidth: true
        font.family: "Droid Sans"
        font.bold: false
        font.italic: false
        font.pointSize: 9
    }

    Label {
        Layout.fillHeight: true
        Layout.fillWidth: true
        StyledText {
            text: "Name"
            horizontalAlignment: Text.AlignLeft
        }
    }

    TextField {
        id: nameField
        Layout.fillHeight: true
        Layout.fillWidth: true
        font.family: "Droid Sans"
        font.bold: false
        font.italic: false
        font.pointSize: 9
    }

    Label {
        Layout.fillHeight: true
        Layout.fillWidth: true
        StyledText {
            text: "Methods"
            horizontalAlignment: Text.AlignLeft
        }
    }

    TextArea {
        id : methodField
        Layout.rowSpan: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        font.family: "Droid Sans"
        font.bold: false
        font.italic: false
        font.pointSize: 9
    }

    Label {
        Layout.fillHeight: true
        Layout.fillWidth: true
        StyledText {
            text: "Attributes"
            horizontalAlignment: Text.AlignLeft
        }
    }
    TextArea {
        id: attributeField
        Layout.rowSpan: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        font.family: "Droid Sans"
        font.bold: false
        font.italic: false
        font.pointSize: 9
    }

    property int coordX: 20
    property int coordY: 20

    RowLayout {
        spacing : 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.topMargin: 10
        Button {
            StyledText {
                text: "Create"
            }

            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                var name = nameField.text
                var parent = parentField.text
                var methods = methodField.text
                var attributes = attributeField.text
                drawingCanvas.insertClass(coordX,coordY,name, methods,attributes)
                coordX += 200
                if(coordX >= 1200 ){
                    coordX = 20
                    coordY += 200
                }
                drawingCanvas.requestPaint()
            }

        }
        Button {
            StyledText {
                text: "Update"
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                var name = nameField.text
                var parent = parentField.text
                var methods = methodField.text
                var attributes = attributeField.text
                dispatcher.createClass(name, parent, methods, attributes)
                drawingCanvas.drawClass(name, parent, methods, attributes)
            }
        }
    }
}
