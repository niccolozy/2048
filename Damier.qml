import QtQuick 2.0

Rectangle
{
    id: damier
    width: 372
    height: 372
    color: "#bbada0"

    Grid
    {
        id: grid1
        width: 372
        rows: 4
        columns: 4
        anchors.fill: parent

        Repeater
        {
            model: 16
            Tesselle
            {
                num:index
            }
        }
    }
}
