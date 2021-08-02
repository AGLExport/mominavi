// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION

import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    id: btn_present_position

    Image {
        id: image_present_position
        x: 4
        y: 4
        width: 92
        height: 92
        visible: false
        source: "images/05_CENTER-POSITION.png"
    }

    Button {
        id: btn_present_position_
        width: 100
        height: 100
        opacity: 0
        visible: true

        function present_position_clicked() {
            map.center = map.currentpostion
            btn_present_position.state = "Flowing"
        }
        onClicked: { present_position_clicked() }
    }

    states: [
        State{
            name: "Flowing"
            PropertyChanges { target: image_present_position; visible: false }
            PropertyChanges { target: btn_present_position; visible: false }
        },
        State{
            name: "Optional"
            PropertyChanges { target: image_present_position; visible: true }
            PropertyChanges { target: btn_present_position; visible: true }
        }
    ]

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
