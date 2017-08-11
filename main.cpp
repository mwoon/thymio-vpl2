#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlContext>
#include <QtDebug>
#include "thymio-vpl2.h"
#include "zpdes.h"
#include "storyteller.h"
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
    //qtTranslator.load("thymio-vpl2_" + QLocale::system().name(), ":/thymio-vpl2/translations/");
    qtTranslator.load("thymio-vpl2_de_DE", ":/thymio-vpl2/translations/");
	app.installTranslator(&qtTranslator);

	thymioVPL2Init();

    QQmlApplicationEngine engine;

    StoryTeller* stote{new StoryTeller()};
    engine.rootContext()->setContextProperty("stote", stote);

    Simulator* simulator{new Simulator()};
    engine.rootContext()->setContextProperty("simulator", simulator);

    engine.load(QUrl(QStringLiteral("qrc:/Startup.qml")));



	return app.exec();
}

