import QtQuick 2.0

Rectangle
{
    id: tesselle


    width: 93
    height: 93
    color: "#00000000"
    radius: 4


    Rectangle {
        id: rectangle1
        color: "#ccc0b2"
        radius: 3
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5

        Text
        {
            id: innerNum
            x: 30
            y: 34
            text: qsTr("Text")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.family: "Tahoma"
            font.pixelSize: 24
        }
    }
}

