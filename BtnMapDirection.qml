// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION

import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    Image {
        id: image
        x: 0
        y: 3
        width: 92
        height: 92
        opacity: 1
        source: "images/02_NORTH-UP.png"
    }

    Button {
        id: btn_map_direction
        width: 100
        height: 100
        iconSource: ""
        opacity: 0
        visible: true
        clip: false
        state: "NorthUp"



        function settleState() {
            if(root.st_heading_up){
                btn_map_direction.state = "NorthUp"
                car_position_mapitem.state = "NorthUp"
                root.st_heading_up = false
            } else {
                btn_map_direction.state = "HeadingUp"
                car_position_mapitem.state = "HeadingUp"
                root.st_heading_up = true
            }
            map.rotateMapSmooth()
        }

        onClicked: { settleState() }

        states: [
            State {
                name: "HeadingUp"
                PropertyChanges { target: image; source: "images/01_HEADING-UP.png" }
            },
            State {
                name: "NorthUp"
                PropertyChanges { target: image; source: "images/02_NORTH-UP.png" }
            }
        ]
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
