// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION

import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    Button {
        width: 100
        height: 100
        opacity: 0

        function zoomUp() {
            map.zoomLevel += 1
        }

        onClicked: { zoomUp() }
    }

    Image {
        id: image
        x: 4
        y: 4
        width: 92
        height: 92
        opacity: 1
        source: "images/04_WIDE.png"
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
