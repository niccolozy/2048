import QtQuick 2.0

Rectangle
{
    id: win
    width: 380
    height: 380
    color: "#bbada0"
    radius: 3
    opacity: 0.7

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

        mouse.onClicked:
        {
            board.restart(scoreboard1.size);
            window1.update();
        }
    }

    Bouton {
        id: continuee
        x: 221
        y: 229
        opacity: 1
        label: "CONTINUE"

        mouse.onClicked:
        {
            board.continuer();
            window1.update();
        }
    }

}
