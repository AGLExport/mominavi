// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION
// Copyright (C) 2024 Automotive Grade Linux

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <stdio.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/mominavi.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *rootObject = engine.rootObjects().constFirst();

    QString StrEnvLat = qgetenv("MOMIMAP_INITIAL_LATITUDE");
    if (StrEnvLat.size() > 0) {
        rootObject->setProperty("car_position_lat", StrEnvLat);
    }

    QString StrEnvLong = qgetenv("MOMIMAP_INITIAL_LONGITUDE");
    if (StrEnvLong.size() > 0) {
        rootObject->setProperty("car_position_lon", StrEnvLong);
    }

    QString StrEnvStyle = qgetenv("MAPLIBRE_MAP_STYLE");
	fprintf(stderr, "MAPLIBRE_MAP_STYLE=%s\n", StrEnvStyle.toUtf8().data());
	if (StrEnvStyle.size() > 0) {
        rootObject->setProperty("maplibre_map_style", StrEnvStyle);
		fprintf(stderr, "set MAPLIBRE_MAP_STYLE to maplibre_map_style\n");
	}


    return app.exec();
}
