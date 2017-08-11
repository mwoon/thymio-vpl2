TEMPLATE = app

QT += qml
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

include(thymio-vpl2.pri)

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

copydata.commands = $(COPY_DIR) $$PWD/exercises $$OUT_PWD
first.depends = $(first) copydata
export(first.depends)
export(copydata.commands)
QMAKE_EXTRA_TARGETS += first copydata

TRANSLATIONS+=  translations/thymio-vpl2_de_DE.ts

