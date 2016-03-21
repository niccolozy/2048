import QtQuick 2.0

Rectangle
{
    id: damier
    width: 372
    height: 372
    color: "#bbada0"

    // visible: (!board.winQML && !board.loseQML)

    property int size: repeater1.model;

    Grid
    {
        id: grid1
        width: 372
        rows: 4
        columns: 4
        anchors.fill: parent

        Repeater
        {
            id:repeater1
            model: 16
            Tesselle
            {
                num:index
                height: 372/grid1.columns
                width: 372/grid1.rows
            }
        }
    }

    function sizeUpdate(i)
    {
        grid1.rows = i;
        grid1.columns = i;
        repeater1.model= i*i;
    }


    Connections {
        target: scoreboard1

        onSizeChange:
        {
            sizeUpdate(i);
        }
      }
}
