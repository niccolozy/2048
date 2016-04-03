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
    int size;
    bool end;
    bool win;
    int goal;
//    int best_score;
    std::vector<int> scores;
    std::vector<int> cells;
    std::vector< std::vector<int> > steps;

    std::vector<int> create_line(int type,int num,bool* moved);
    void update_board(int type,int num,std::vector<int> current_line);

    // used in "main.qml" in order to show interface win and lose
    Q_PROPERTY(bool winQML READ readWin NOTIFY winChanged)
    Q_PROPERTY(bool loseQML READ readLose NOTIFY loseChanged)

public:
    Q_INVOKABLE explicit Board(QObject *parent= 0);
    ~Board();

    // buttons used in "Scoreboard.qml"
    Q_INVOKABLE void restart(int size);
    Q_INVOKABLE void go_back();

    // used in "Scoreboard.qml" to read our scores
    Q_INVOKABLE QString readScr();
//    Q_INVOKABLE QString readBestScr();

    // used in "Tesselle.qml" to read the numbers and colors in the board
    Q_INVOKABLE QString readVec(int id);
    Q_INVOKABLE QColor fondColor(int id);

    // used in "main.qml" bloc "damier"
    Q_INVOKABLE void move(int type);

    // used in "Win.qml" to continue the game even we achieve 2048
    Q_INVOKABLE void continuer();

    void set_goal(int goal);
    void rand_generation(int nb);
    void print_board();

    bool check_moveble();
    void check_end();

    bool readWin();
    bool readLose();

signals:
    void winChanged();
    void loseChanged();

};

#endif // BOARD_H
