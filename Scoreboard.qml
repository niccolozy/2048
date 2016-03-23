import QtQuick 2.0


Rectangle
{
    id: scoreBoard
    width: 380
    height: 100
    color: "#fbfaef"

    property int numScore: 0;
    property int numBestScore: 0;

    signal sizeChange(int i)


    Rectangle {
        id: sloganConteunu
        x: 12
        y: 8
        width: 114
        height: 48
        color: "#ebd15b"
        radius: 3

        Text {
            id: slogan
            color: "#ffffff"
            text: "2048"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent


            font.bold: true
            font.family: "Verdana"
            font.pixelSize: 32
        }
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
        y: 63
        width: 79
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        label: "RESTART"

        NumberAnimation {
            id: hide
            target: damier1
            easing.type: Easing.InOutCubic
            properties: "opacity"
            from: 1.0
            to: 0.0
            duration: 500
           }
        NumberAnimation {
            id: show
            target: damier1
            easing.type: Easing.InOutCubic
            properties: "opacity"
            from: 0.0
            to: 1.0
            duration: 700
           }

        mouse.onClicked:
        {
            hide.start();
            board.restart(4);
            window1.update();
            show.start();
        }  
    }

    Bouton {
        id: reverse
        x: 111
        y: 63
        width: 79
        height: 29
        label: "REVERSE"
        mouse.onClicked:
        {
            board.go_back();
            window1.update();
        }
    }

    Bouton {
        id: taille
        x: 238
        y: 63
        width: 99
        height: 29
        label: qsTr(size+"x"+size)
        property int size: 4;

        mouse.onClicked:
        {
            hide.start();
            board.restart(size);
            parent.sizeChange(size);
            window1.update();
            show.start();
        }
    }

    ChangeSize {
        id: changeSize1
        x: 203
        y: 63
        signe: '-'
        mouse.onClicked:
        {
            if(taille.size > 2)
                taille.size--;
        }

    }

    ChangeSize {
        id: changeSize2
        x: 343
        y: 63
        signe: '+'
        mouse.onClicked:
        {
            taille.size++;
        }
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
