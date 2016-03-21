#include "board.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <algorithm>

Board::Board(QObject *parent) : QObject(parent)
{
    end = false;
    win = false;
    goal = 2048;    //
    size = 4;
    for(int i=0;i<size*size;i++)
        cells.push_back(0);
    rand_generation(2);
    scores.push_back(0);
    best_score = 0;
}

Board::~Board()
{

}

void Board::restart(int size)
{
    end = false;
    win = false;
    goal = 2048;
    this->size = size;


    steps.clear();


    cells.clear();
    for(int i=0;i<size*size;i++)
        cells.push_back(0);

    rand_generation(2);

    scores.clear();
    scores.push_back(0);

}

void Board::rand_generation(int nb)
{
    srand (time(NULL));
    int empty_cells = std::count(cells.begin(),cells.end(),0);
    if(nb > empty_cells)
        nb = empty_cells;
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

void Board::set_goal(int goal)
{
    this->goal = goal;
}

QString Board::readVec(int id)
{
    if(cells[id]==0)
        return "";
    else
        return QString::number(cells[id]);
}


QColor Board::fondColor(int id)  //
{
    int number = cells[id];
    QColor color;
    switch(number)
    {
        case 0: color = "#ccc0b2"; break;
        case 2: color = "#F4ECE4"; break;
        case 4: color = "#ece0c8"; break;
        case 8: color = "#f2b179"; break;
        case 16: color = "#f59563"; break;
        case 32: color = "#f57c5f"; break;
        case 64: color = "#f95c3b"; break;
        case 128: color = "#edce71"; break;
        case 256: color = "#eecc61"; break;
        case 512: color = "#ebc850"; break;
        case 1024: color = "#edc53f"; break;
        case 2048: color = "#eec22e"; break;
        case 4096: color = "#3d3a33"; break;
        case 8192: color = "#3d3a33"; break;
        case 16384: color = "#3d3a33"; break;
        default: color = QColor(0, 0, 0); break;
    }
    return color;
}


QString Board::readScr()
{
    return QString::number(scores.back());
}

QString Board::readBestScr()
{
    return QString::number(best_score);
}

void Board::print_board()
{
    for(int i=0;i<size;i++)
    {
        for(int j=0;j<size;j++)
            std::cout<<cells[i*4+j]<<" ";
        std::cout<<std::endl;
    }
    std::cout<<"Score : "<<this->scores.back()<<"\n";
    if(win)
        std::cout<<"You win!\n";
    else if(end)
        std::cout<<"You lose!\n";
}

void Board::move(int type)
{
    if(end)
        return;
    std::vector<int> temps = cells;
    bool moved = false;
    int new_score = 0;
    for(int line=0;line<size;line++)
    {
        std::vector<int> current_line;
        current_line = create_line(type,line,&moved);
        if(current_line.empty())
            continue;


        for(int i=0;i<current_line.size()-1;i++)
        {
            if(current_line[i] == current_line[i+1])
            {
                current_line[i] += current_line[i+1];
                current_line[i+1] = 0;
                new_score += current_line[i];
                moved = true;
            }
        }
        current_line.erase(std::remove(current_line.begin(),current_line.end(),0),current_line.end());


        update_board(type,line,current_line);
    }
    if(moved == true)
    {
        rand_generation(1);
        steps.push_back(temps);
        scores.push_back(scores.back()+new_score);
        if(scores.back() > best_score)
            best_score = scores.back();
        check_end();
    }
}

std::vector<int> Board::create_line(int type, int num, bool *moved)
{
    std::vector<int> current_line;
    switch (type)
    {
        case LEFT:
            for(int i=0;i<size;i++)
            {
                if(cells[num*size+i])
                    current_line.push_back(cells[num*size+i]);
                else if(i<size-1 && cells[num*size+i+1])
                    *moved = true;
            }
            break;

        case UP:
            for(int i=0;i<size;i++)
            {
                if(cells[num+i*size])
                    current_line.push_back(cells[num+i*size]);
                else if(i<size-1 && cells[num+(i+1)*size])
                    *moved = true;
            }
            break;

        case RIGHT:
            for(int i=0;i<size;i++)
            {
                if(cells[num*size+size-i-1])
                    current_line.push_back(cells[num*size+size-i-1]);
                else if(i<size-1 && cells[num*size+size-(i+1)-1])
                    *moved = true;
            }
            break;

        case DOWN:
            for(int i=0;i<size;i++)
            {
                if(cells[num+(size-i-1)*size])
                    current_line.push_back(cells[num+(size-i-1)*size]);
                else if(i<size-1 && cells[num+(size-i+1-1)*size])
                    *moved = true;
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
                    cells[num*size+i] = current_line[i];
                else
                    cells[num*size+i] = 0;
            }
            break;

        case UP:
            for(int i=0;i<size;i++)
            {
                if(i < current_line.size())
                    cells[num+i*size] = current_line[i];
                else
                    cells[num+i*size] = 0;
            }
            break;

        case RIGHT:
            for(int i=0;i<size;i++)
            {
                if(i < current_line.size())
                    cells[num*size+size-i-1] = current_line[i];
                else
                    cells[num*size+size-i-1] = 0;
            }
            break;

        case DOWN:
            for(int i=0;i<size;i++)
            {
                if(i < current_line.size())
                    cells[num+(size-i-1)*size] = current_line[i];
                else
                    cells[num+(size-i-1)*size] = 0;
            }
            break;
    default:
            break;
    }
}


void Board::go_back()   //
{
    if(!steps.empty())
    {
        cells = steps.back();
        steps.pop_back();
        scores.pop_back();
        if(end)
            end = false;
    }
}


bool Board::check_moveble()     //
{
    bool movable = false;
    for(int type=1; type<5; type++)
    {
        for(int line=0;line<size;line++)
        {
            std::vector<int> current_line;
            current_line = create_line(type,line,&movable);
            if(current_line.empty())
                continue;
            if(movable)
                return true;

            for(int i=0;i<current_line.size()-1;i++)
            {
                if(current_line[i] == current_line[i+1])
                    return true;
            }
        }
    }
    return false;
}


void Board::check_end()
{

    for(int i=0; i<cells.size(); i++)
    {
        if(cells[i] == goal)
        {
            win = true;
            return;
        }
    }

    end = !check_moveble();
}
