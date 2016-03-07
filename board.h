#ifndef BOARD_H
#define BOARD_H

#define LEFT 1
#define UP 2
#define RIGHT 3
#define DOWN 4

#include <vector>


class Board
{
    int size;
    std::vector<int> cells;

    std::vector<int> create_line(int type,int num);
    void update_board(int type,int num,std::vector<int> current_line);
public:
    Board();
    Board(int s);
    ~Board();

    void rand_generation(int nb);
    void print_board();
    void move(int type);
};

#endif // BOARD_H
