import QtQuick 2.0

Rectangle
{
    id: win
    width: 380
    height: 380
    color: "#bbada0"
    radius: 3

    Text {
        id: text1
        x: 0
        y: 84
        width: 380
        height: 60
        color: "#766d65"
        text: qsTr("YOU WIN!")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 49
    }

    Bouton {
        id: restart
        x: 53
        y: 229
        label: "RESTART"
    }

    Bouton {
        id: continuee
        x: 221
        y: 229
        label: "CONTINUE"
    }

}
