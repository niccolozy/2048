#ifndef BOARD_H
#define BOARD_H

#include <vector>


class Board
{
    int size;
    std::vector<int> cells;
public:
    Board();
    Board(int s);
    ~Board();

    void rand_generation(int nb);
    void print_board();
    void move(int type);
};

#endif // BOARD_H
