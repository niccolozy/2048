#ifdef QT_NO_DEBUG_OUTPUT
#undef QT_NO_DEBUG_OUTPUT
#endif

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "board.h"
#include <iostream>


int main(int argc, char *argv[])
{
    //QGuiApplication app(argc, argv);

    //QQmlApplicationEngine engine;
    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    Board b(4);
    b.rand_generation(2);
    b.print_board();
    int move = 5;
    std::cin>>move;
    while(move)
    {
        b.move(move);
        std::cout<<std::endl;
        b.print_board();
        std::cin>>move;
    }
    //return app.exec();
    return 0;
}
