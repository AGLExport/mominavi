// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION
import QtQuick 2.0

Item {
    Rectangle {
        width: 800
        height: 60
        color: "#6e110e0c"
        border.width: 2
        radius: 10.0
        border.color: "#00000000"

        Text {
            x: 10
            y: 2
            width: 780
            height: 56
            color: "#f5f5f5"

            id: routeText
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }
    }

    function setText(string) {
        routeText.text = string
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
