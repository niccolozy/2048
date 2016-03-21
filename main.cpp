#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "board.h"
#include <QtQml>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Board b;
    engine.rootContext()->setContextProperty("board", &b);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();

}

