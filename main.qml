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

        Grid {
            id: grid1
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            rows: 2
            focus:true

            Scoreboard {
                id: scoreboard1
                anchors.top: parent.top
                anchors.topMargin: 10
            }

            Damier {
                id: damier1
                y: 109
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: scoreboard1.horizontalCenter
            }

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




}
