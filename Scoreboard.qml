import QtQuick 2.0


Rectangle
{
    id: scoreBoard
    width: 380
    height: 100
    color: "#fbfaef"

    property int numScore: 0;
    property int numBestScore: 0;

    Text {
        id: slogan
        color: "#766d65"
        text: "2048"

        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.top: parent.top
        anchors.topMargin: 5

        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 40
    }

    Rectangle {
        id: contenuScore
        width: 110
        height: 48
        color: "#bcada0"
        radius: 3
        anchors.left: parent.left
        anchors.leftMargin: 142
        anchors.top: parent.top
        anchors.topMargin: 8

        Text {
            id: textScore
            x: 0
            color: "#f2e7d9"
            text: qsTr("SCORE")
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pixelSize: 12
        }

        Text {
            id: numScore
            x: 38
            color: "#ffffff"
            text: board.readScr()   //
            font.family: "Verdana"
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
    }

    Rectangle {
        id: contenuBestScore
        x: 265
        width: 110
        height: 48
        color: "#bbada0"
        radius: 3
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 9

        Text {
            id: textBestScore
            x: 38
            color: "#f2e7d9"
            text: qsTr("BEST")
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        Text {
            id: numBestScore
            x: 38
            color: "#ffffff"
            text: board.readScr()   //
            font.family: "Verdana"
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
    }

    Bouton {
        id: restart
        y: 74
        anchors.left: parent.left
        anchors.leftMargin: 9
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        label: "RESTART"

        mouse.onClicked:
        {
            board.restart(4);
            window1.update();
        }
    }

    Bouton {
        id: reverse
        x: 135
        y: 63
        label: "REVERSE"
        mouse.onClicked:
        {
            board.go_back();
            window1.update();
        }
    }

    Bouton {
        id: taille
        x: 262
        y: 63
        label: "SIZE"

        // onCliked:  ;
    }


    function scoreUpdate(){
        numScore.text = board.readScr();
        numBestScore.text = board.readBestScr();
    }

    Connections {
        target: window1

        onUpdate: {
            scoreUpdate();
        }
    }

}
