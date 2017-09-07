#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlContext>
#include <QtDebug>
#include "thymio-vpl2.h"
#include "game/storyteller.h"
#include "simulator.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);
	app.setOrganizationName("Mobsya");
	app.setOrganizationDomain("mobsya.org");
	app.setApplicationName("Thymio VPL Mobile Preview");

	QTranslator qtTranslator;
    QLocale::system().name();
    qtTranslator.load("thymio-vpl2_" + QLocale::system().name(), ":/its-game/translations/");
    //qtTranslator.load("thymio-vpl2_de_DE", ":/its-game/translations/");
	app.installTranslator(&qtTranslator);

	thymioVPL2Init();

    QQmlApplicationEngine engine;

    StoryTeller* stote{new StoryTeller()};
    engine.rootContext()->setContextProperty("stote", stote);

    Simulator* simulator{new Simulator()};
    engine.rootContext()->setContextProperty("simulator", simulator);

    engine.load(QUrl(QStringLiteral("qrc:/its-game/game/Startup.qml")));



	return app.exec();
}

