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
    b.print_board();
    //return app.exec();
    return 0;
}
