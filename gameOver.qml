import QtQuick 2.0

Rectangle {
    id: gameOver
    width: 380
    height: 380
    color: "#bbada0"
    radius: 3
    opacity: 0.7

    // visible: board.loseQML

    Text {
        id: text1
        x: 0
        width: 380
        height: 66
        color: "#766d65"
        text: "Game Over!"
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 102
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Verdana"
        wrapMode: Text.WordWrap
        font.pixelSize: 49
    }

    Bouton {
        id: restart
        x: 40
        y: 245
        label: "RESTART"

        mouse.onClicked:
        {
            board.restart(4);
            window1.update();
        }
    }

    Bouton {
        id: reverse
        x: 226
        y: 245
        label: "REVERSE"

        mouse.onClicked:
        {
            board.go_back();
            window1.update();
        }
    }
}

