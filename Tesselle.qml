import QtQuick 2.0

Item
{
    id: tesselle
    width: 93
    height: 93
    property int num
    Rectangle
    {
            anchors.fill: parent
            color: "#ccc0b2"
            radius: 3


            Text
            {
                id: innerNum
                x: 30
                y: 34
                text: board.readVec(num)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "Tahoma"
                font.pixelSize: 24
            }
    }
    function textUpdate(){
        innerNum.text = board.readVec(num);
        switch(innerNum.text){
            case "0":
                innerNum.text = "";
                break;
            case "2":
                innerNum.color = "red";
                break;
            case "4":
                innerNum.color = "orange";
                break;
            case "8":
                innerNum.color = "yellow";
                break;
            case "16":
                innerNum.color = "green";
                break;
        }

    }

    Connections {
        target: window1

        onUpdate: {
          textUpdate();
        }
      }
}
