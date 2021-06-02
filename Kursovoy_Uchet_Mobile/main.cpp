#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "SBarcodeFilter.h"
#include <QQmlContext>

#include "appcore.h"
#include "settings.h"
#include "connectioncontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<SBarcodeFilter>("com.scythestudio.scodes", 1, 0, "SBarcodeFilter");
    qmlRegisterType<Settings>("com.custom", 1, 0, "Settings");

    QQmlApplicationEngine engine;
    AppCore appCore;
    Settings settings;
    ConnectionController connection;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("appCore", &appCore);
    context->setContextProperty("settings", &settings);
    context->setContextProperty("connection", &connection);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
