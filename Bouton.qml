import QtQuick 2.0

Rectangle {
    id: bouton
    width: 110
    height: 29
    color: "#8c7963"
    radius: 3

    property string label: "";
    property alias mouse : mouseArea1;

    Text {
        // id: text1
        x: 18
        y: 6
        color: "#fbeee0"
        text: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 14
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent;
    }
}
