// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2025 Automotive Grade Linux

#include <unistd.h>
#include "config.hpp"
#include <QtEnvironmentVariables>

MomiConfig::MomiConfig()
{
    loadConfig();
}

MomiConfig::~MomiConfig()
{

}

void MomiConfig::loadConfig()
{

    m_car_speed = 60; // set default Km/h
    m_update_interval = 100; // set default millisecond
    m_start_latitude = 36.136261; // set default coordinate Westgate
    m_start_longitude = -115.151254;
    m_style = QString("https://tile.openstreetmap.jp/styles/openmaptiles/style.json");

    QString StrEnvLat = qgetenv("MOMIMAP_INITIAL_LATITUDE");
    if (StrEnvLat.size() > 0) {
        double tmp = StrEnvLat.toDouble();
        if (tmp != 0.0) {
            m_start_latitude = tmp;
        }
    }

    QString StrEnvLong = qgetenv("MOMIMAP_INITIAL_LONGITUDE");
    if (StrEnvLong.size() > 0) {
        double tmp = StrEnvLong.toDouble();
        if (tmp != 0.0) {
            m_start_longitude = tmp;
        }
    }

    QString StrEnvSp = qgetenv("MOMIMAP_VEHICLE_DEMO_SPEED");
    if (StrEnvSp.size() > 0) {
        double tmp = StrEnvSp.toDouble();
        if (tmp != 0.0) {
            m_car_speed = tmp;
        }
    }

    QString StrEnvInterval = qgetenv("MOMIMAP_VEHICLE_DEMO_INTERVAL");
    if (StrEnvInterval.size() > 0) {
        m_update_interval = StrEnvInterval.toInt();
    }

    QString StrEnvStyle = qgetenv("MOMIMAP_MAPLIBRE_STYLE");
    if (StrEnvStyle.size() > 0) {
        m_style = StrEnvStyle;
    }

    return;
}

double MomiConfig::getCarSpeed()
{
    return m_car_speed;
}

int MomiConfig::getUpdateInterval()
{
    return m_update_interval;
}

double MomiConfig::getStartLatitude()
{
    return m_start_latitude;
}

double MomiConfig::getStartLongitude()
{
    return m_start_longitude;
}

QString MomiConfig::getMaplibreStyle()
{
    return m_style;
}
