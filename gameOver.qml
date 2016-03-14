import QtQuick 2.0

Item {
    id: gameOver
    width: 380
    height: 380
    color: "#bbada0"
    radius: 3
    visible: true

    Text {
        id: text1
        x: 0
        y: 110
        width: 380
        height: 66
        color: "#766d65"
        text: "Game Over!"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Verdana"
        wrapMode: Text.WordWrap
        font.pixelSize: 49
    }

    Rectangle {
        id: rectangle1
        x: 90
        y: 200
        width: 200
        height: 43
        color: "#8c7963"
        radius: 3
        clip: true

        Text {
            id: text2
            x: 87
            y: 14
            color: "#e2e1d6"
            text: qsTr("Try again")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            font.bold: true
            font.family: "Verdana"
            font.pixelSize: 21
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
    }
}

