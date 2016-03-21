import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    id: window1
    width: 380
    height: 480
    color: "#fbf8ef"
    title: "2048"
    visible: true

    signal update()
    Component.onCompleted: window1.update();


    Scoreboard {
        id: scoreboard1
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

    }


    Damier {
        id: damier1
        y: 108
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

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
        visible: false
    }

    Win {
        id: win1
        x: 0
        y: 100
        width: 380
        height: 380
        visible: false
    }

}
