import QtQuick 2.0

Rectangle
{
    id: tesselle
    width: 93
    height: 93
    color: "#00000000"
    visible: true

    property int num ;

    Rectangle
    {
        id: fond
        anchors.fill: parent
        color: board.fondColor(num) // "#ccc0b2"
        radius: 3
        anchors.rightMargin: 4
        anchors.leftMargin: 4
        anchors.bottomMargin: 4
        anchors.topMargin: 4


        Text
        {
            id: innerNum
            x: 30
            y: 34

            text: board.readVec(num)    //

            color: text == "2" || text == "4" ? "#786f66" : "#f7f8f0"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.family: "Tahoma"
            font.pixelSize: 24
        }
    }



    function tesselleUpdate()
    {
        innerNum.text = board.readVec(num);
        fond.color=board.fondColor(num);
    }


    Connections {
        target: window1

        onUpdate:
        {
            tesselleUpdate();
        }

      }

}
