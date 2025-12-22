// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION
// Copyright (C) 2024 Automotive Grade Linux

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "config.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    MomiConfig momiConfig;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("momiConfig", &momiConfig);

    const QUrl url(QStringLiteral("qrc:/mominavi.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
