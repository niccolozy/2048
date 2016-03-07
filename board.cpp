#include "board.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>

Board::Board()
{
    size = 4;
    for(int i=0;i<size*size;i++)
        cells.push_back(0);
    rand_generation(2);
}

Board::Board(int s)
{
    size = s;
    for(int i=0;i<size*size;i++)
        cells.push_back(0);
    rand_generation(2);
}

Board::~Board()
{

}


void Board::rand_generation(int nb)
{
    srand (time(NULL));
    int nb_cell_added = 0;
    while(nb_cell_added < nb)
    {
        int index = rand()%(size*size);
        int value = (rand()%2+1)*2;
        if (!cells[index])
        {
            cells[index] = value;
            nb_cell_added++;
        }
    }
}

void Board::print_board()
{
    for(int i=0;i<size;i++)
    {
        for(int j=0;j<size;j++)
            std::cout<<cells[i*4+j]<<" ";
        std::cout<<std::endl;
    }
}

void Board::move(int type)
{

}
