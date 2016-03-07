TEMPLATE = app
QT += qml quick
RESOURCES += qml.qrc
CONFIG += console
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


SOURCES += main.cpp \
    board.cpp


# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    board.h
