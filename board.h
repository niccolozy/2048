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
    int best_score;
    std::vector<int> scores;
    std::vector<int> cells;
    std::vector< std::vector<int> > steps;

    std::vector<int> create_line(int type,int num,bool* moved);
    void update_board(int type,int num,std::vector<int> current_line);

public:
    explicit Board(QObject *parent= 0);
    Board(int size);
    ~Board();

    Q_INVOKABLE QString readVec(int id);
    Q_INVOKABLE QColor fondColor(int id);
    Q_INVOKABLE QString readScr();
    Q_INVOKABLE QString readBestScr();
    void set_goal(int goal);
    void rand_generation(int nb);
    void print_board();
    Q_INVOKABLE void move(int type);
    Q_INVOKABLE void go_back();
    Q_INVOKABLE bool check_moveble();
    void check_end();
};

#endif // BOARD_H
