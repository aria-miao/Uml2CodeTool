import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1


//This class creates the three buttons
RowLayout {
    spacing : 2
    Layout.fillHeight: true
    Layout.fillWidth: true

    //base button
    Rectangle {
        id: uBaseClassButton
        color: "grey"
        Layout.preferredWidth:  parent.width /3
        Layout.preferredHeight: parent.height

        StyledText {
            text: "Base"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.color = 'grey'
                uInterfaceClassButton.color = 'white'
                uChildClassButton.color = "white"
                dispatcher.setClassState(0)
                uClassPanel.disableParentField()
            }
        }
    }

    //Interface button
    Rectangle {
        id: uInterfaceClassButton
        color: "white"
        Layout.fillHeight: true
        Layout.fillWidth: true

        StyledText {
            text: "Interface"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.color = 'grey'
                uBaseClassButton.color = 'white'
                uChildClassButton.color = "white"
                dispatcher.setClassState(1)
                uClassPanel.disableParentField()
            }
        }
    }

    //Child button
    Rectangle {
        id: uChildClassButton
        color: "white"
        Layout.fillHeight: true
        Layout.fillWidth: true

        StyledText {
            text: "Child"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.color = 'grey'
                uBaseClassButton.color = 'white'
                uInterfaceClassButton.color = "white"
                dispatcher.setClassState(2)
                uClassPanel.enableParentField()
            }
        }
    }


}
