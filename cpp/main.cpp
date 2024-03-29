#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>

#include "cxx-qt-gen/cxxqt_object.cxxqt.h"

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;

	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect (
		&engine,
		&QQmlApplicationEngine::objectCreated,
		&app,
		[url](QObject* obj, const QUrl& objUrl) {
			if (!obj && url == objUrl)
				QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection);

	qmlRegisterType<CaesarObject>("kaue.cipher.caesar", 1, 0, "CaesarObject");
	qmlRegisterType<VigenereObject>("kaue.cipher.vigenere", 1, 0, "VigenereObject");

	engine.load(url);

	return app.exec();
}
