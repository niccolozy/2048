#ifndef BOARD_H
#define BOARD_H

#define LEFT 1
#define UP 2
#define RIGHT 3
#define DOWN 4

#include <vector>
#include <QObject>
#include <QColor>

class Board : public QObject
{
    Q_OBJECT
    int size;   //board size
    int goal;   //the number to get for winning, 2048 as default

    std::vector<int> scores;                //scores matching historic boards
    std::vector<int> cells;                 //current board
    std::vector< std::vector<int> > steps;  //board history

    // used in "main.qml" in order to show interface win and lose
    bool winQML;
    bool loseQML;
    Q_PROPERTY(bool winQML READ readWin NOTIFY winChanged)
    Q_PROPERTY(bool loseQML READ readLose NOTIFY loseChanged)

    //private methods for board movement and update
    std::vector<int> create_line(int type,int num,bool* moved);
    void update_board(int type,int num,std::vector<int> current_line);

public:
    Q_INVOKABLE explicit Board(QObject *parent= 0);
    ~Board();

    //randomly generate nb cells on board
    void rand_generation(int nb);

    Q_INVOKABLE void restart(int size);
    Q_INVOKABLE void go_back();

    // used in "Scoreboard.qml" to read our scores
    Q_INVOKABLE QString readScr();

    // used in "Tesselle.qml" to read the number and color of the id-th cell in the board
    Q_INVOKABLE QString readVec(int id);
    Q_INVOKABLE QColor fondColor(int id);

    // used in "main.qml" bloc "damier"
    Q_INVOKABLE void move(int type);

    // used in "Win.qml" to continue the game even when we achieve 2048
    Q_INVOKABLE void continuer();


    bool check_moveble();
    void check_end();

    bool readWin();
    bool readLose();

signals:
    void winChanged();
    void loseChanged();

};

#endif // BOARD_H
