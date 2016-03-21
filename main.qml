import QtQuick 2.3
import QtQuick.Window 2.2


Window {
    id: window1
    width: 380
    height: 523
    color: "#fbf8ef"
    title: "2048"
    visible: true

    signal update()
    //Component.onCompleted: window1.update();


    Scoreboard {
        id: scoreboard1
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

    }


    Damier {
        id: damier1
        x: 4
        y: 104
        width: 372
        height: 372


        visible: true

        focus:true

        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Up:
                board.move(2);
                window1.update();
                break;
            case Qt.Key_Down:
                board.move(4);
                window1.update();
                break;
            case Qt.Key_Left:
                board.move(1);
                window1.update();
                break;
            case Qt.Key_Right:
                board.move(3);
                window1.update();
                break;
            case Qt.Key_R:
                board.go_back();
                window1.update();
                break;
            }
        }

    }

    GameOver {
        id: gameOver1
        x: 0
        y: 100

        // visible:false
        visible: board.loseQML
    }

    Win {
        id: win1
        x: 0
        y: 100
        width: 380
        height: 380
        visible: board.winQML
    }

    Text {
        id: text1
        x: 15
        y: 495
        width: 303
        height: 33
        text: qsTr("DU Xudong et ZHANG Yang   ECLyon-S8 PIG")
        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 14
    }

}
