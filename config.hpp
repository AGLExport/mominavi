// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2025 Automotive Grade Linux

#ifndef MOMI_CONFIG_H
#define MOMI_CONFIG_H
#include <QObject>
#include <QString>

class MomiConfig: public QObject{

    Q_OBJECT

    double m_car_speed;         // set Km/h
    int m_update_interval;      // set millisecond
    double m_start_latitude;
    double m_start_longitude;
    QString m_style;

public:
    MomiConfig();
    virtual ~MomiConfig();

    Q_INVOKABLE double getCarSpeed();
    Q_INVOKABLE int getUpdateInterval();
    Q_INVOKABLE double getStartLatitude();
    Q_INVOKABLE double getStartLongitude();
    Q_INVOKABLE QString getMaplibreStyle();

private:
    void loadConfig();
};

#endif // MOMI_CONFIG_H
