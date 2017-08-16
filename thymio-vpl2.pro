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

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

OTHER_FILES += its-game/exercises

# trying to make ground textures under exercises folder work on android
android
{
    my_files.path = /assets
    my_files.files += $$PWD/exercises/lightdark.png
    my_files.files += $$PWD/exercises/darklight.png
    INSTALLS += my_files
}
