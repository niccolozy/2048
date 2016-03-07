#include "board.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <algorithm>

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
    for(int line=0;line<size;line++)
    {
        std::vector<int> current_line;
        current_line = create_line(type,line);
        if(current_line.empty())
            continue;


        for(int i=0;i<current_line.size()-1;i++)
        {
            if(current_line[i] == current_line[i+1])
            {
                current_line[i] += current_line[i+1];
                current_line[i+1] = 0;
            }
        }
        current_line.erase(std::remove(current_line.begin(),current_line.end(),0),current_line.end());


        update_board(type,line,current_line);
    }
    rand_generation(2);
}

 std::vector<int> Board::create_line(int type,int num)
 {
     std::vector<int> current_line;
     switch (type)
     {
         case LEFT:
             for(int i=0;i<size;i++)
             {
                 if(cells[num*4+i])
                     current_line.push_back(cells[num*4+i]);
             }
             break;

         case UP:
             for(int i=0;i<size;i++)
             {
                 if(cells[num+i*4])
                     current_line.push_back(cells[num+i*4]);
             }
             break;

         case RIGHT:
             for(int i=0;i<size;i++)
             {
                 if(cells[num*4+size-i-1])
                     current_line.push_back(cells[num*4+size-i-1]);
             }
             break;

         case DOWN:
             for(int i=0;i<size;i++)
             {
                 if(cells[num+(size-i-1)*4])
                     current_line.push_back(cells[num+(size-i-1)*4]);
             }
             break;
         default:
             break;
     }

    return current_line;
 }

 void Board::update_board(int type,int num,std::vector<int> current_line)
 {
     switch (type)
     {
         case LEFT:
             for(int i=0;i<size;i++)
             {
                 if(i < current_line.size())
                     cells[num*4+i] = current_line[i];
                 else
                     cells[num*4+i] = 0;
             }
             break;

         case UP:
             for(int i=0;i<size;i++)
             {
                 if(i < current_line.size())
                     cells[num+i*4] = current_line[i];
                 else
                     cells[num+i*4] = 0;
             }
             break;

         case RIGHT:
             for(int i=0;i<size;i++)
             {
                 if(i < current_line.size())
                     cells[num*4+size-i-1] = current_line[i];
                 else
                     cells[num*4+size-i-1] = 0;
             }
             break;

         case DOWN:
             for(int i=0;i<size;i++)
             {
                 if(i < current_line.size())
                     cells[num+(size-i-1)*4] = current_line[i];
                 else
                     cells[num+(size-i-1)*4] = 0;
             }
             break;
         default:
             break;
     }

 }
