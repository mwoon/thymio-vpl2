#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlContext>
#include "thymio-vpl2.h"
#include "zpdes.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);
	app.setOrganizationName("Mobsya");
	app.setOrganizationDomain("mobsya.org");
	app.setApplicationName("Thymio VPL Mobile Preview");

	QTranslator qtTranslator;
	QLocale::system().name();
	qtTranslator.load("thymio-vpl2_" + QLocale::system().name(), ":/thymio-vpl2/translations/");
	app.installTranslator(&qtTranslator);

	thymioVPL2Init();

    QQmlApplicationEngine engine;
    Zpdes* zpdes{new Zpdes()};
    engine.rootContext()->setContextProperty("zpdes", zpdes);

    engine.load(QUrl(QStringLiteral("qrc:/Startup.qml")));



	return app.exec();
}

