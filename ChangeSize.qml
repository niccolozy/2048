import QtQuick 2.0

Rectangle
{
    width: 29
    height: 29
    color: "#e56d41"
    radius: 10

    property string signe: "";
    property alias mouse : mouseArea1;

    Text {
        id: text1
        color: "#ffffff"
        text: signe
        font.bold: signe
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        font.pixelSize: 28
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
    }


}
