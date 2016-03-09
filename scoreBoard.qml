import QtQuick 2.0

Rectangle {
    id: scoreBoard
    width: 380
    height: 100
    color: "#fbfaef"

    signal optionsClicked;  //

    property int numScore: 0;
    property int numBestScore: 0;

    Text {
        id: slogan
        x: 5
        y: 8
        color: "#766d65"
        text: "2048"
        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 40
    }

    Rectangle {
        id: contenuScore
        x: 150
        width: 110
        height: 48
        color: "#bcada0"
        radius: 3
        anchors.top: parent.top
        anchors.topMargin: 5

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
            text: numScore
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
        anchors.topMargin: 5

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
            text: numBestScore
            font.family: "Verdana"
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
    }
}

