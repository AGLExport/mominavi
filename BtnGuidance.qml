// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION

import QtQuick 2.0
import QtQuick.Controls 1.5
import QtLocation 5.9
import QtPositioning 5.6

Item {
    id: btn_guidance

    // 0: idle
    // 1: routing
    // 2: on guide
    property int sts_guide: 0

    onSts_guideChanged: {
        //console.log("onSts_guideChanged")
        switch(btn_guidance.sts_guide){
        case 0:
            positionTimer.stop();
            break
        case 1:
            break
        case 2:
            positionTimer.start();
            break
        default:
            break
        }
    }

    function startGuidance() {
        btn_present_position.state = "Flowing"
        btn_guidance.sts_guide = 2
        btn_guidance.state = "onGuide"
    }

    function discardWaypoints(startFromCurrentPosition) {
        if (startFromCurrentPosition === undefined) startFromCurrentPosition = false
        map.initDestination(startFromCurrentPosition)

        if(btn_guidance.sts_guide != 0){
            map.qmlSignalStopDemo()
        }

        if(map.center !== map.currentpostion){
            btn_present_position.state = "Optional"
        }

        btn_guidance.sts_guide = 0
        btn_guidance.state = "Idle"
    }

    Image {
        id: discard_image
        x: 4
        y: 4
        width: 92
        height: 92
        visible: false
        source: "images/07_CANCEL.png"
    }

    Timer {
        id: positionTimer
        interval: 100
        repeat: true
        onTriggered: map.updatePositon()
    }

    Image {
        id: guidance_image
        x: 4
        y: 4
        width: 92
        height: 92
        visible: false
        source: "images/06_START-DEMO.png"
    }

    Button {
        id: discard
        width: 100
        height: 100
        opacity: 0

        visible: false

        onClicked: discardWaypoints()
    }

    Button {
        id: guidance
        width: 100
        height: 100
        opacity: 0

        visible: false

        onClicked: { startGuidance() }

    }


    states: [
        State {
            name: "Idle"
            PropertyChanges { target: discard; visible: false }
            PropertyChanges { target: discard_image; visible: false }
            PropertyChanges { target: guidance; visible: false }
            PropertyChanges { target: guidance_image; visible: false }
            PropertyChanges { target: guidance; x: 0 }
            PropertyChanges { target: guidance_image; x: 0 }
            PropertyChanges { target: progress_next_cross; state: "invisible" }
        },
        State {
            name: "Routing"
            PropertyChanges { target: discard; visible: true }
            PropertyChanges { target: discard_image; visible: true }
            PropertyChanges { target: guidance; visible: true }
            PropertyChanges { target: guidance_image; visible: true }
            PropertyChanges { target: guidance; x: -100 }
            PropertyChanges { target: guidance_image; x: -100 }
            PropertyChanges { target: progress_next_cross; state: "invisible" }
        },
        State {
            name: "onGuide"
            PropertyChanges { target: discard; visible: true }
            PropertyChanges { target: discard_image; visible: true }
            PropertyChanges { target: guidance; visible: false }
            PropertyChanges { target: guidance_image; visible: false }
            PropertyChanges { target: guidance; x: 0 }
            PropertyChanges { target: guidance_image; x: 0 }
            PropertyChanges { target: progress_next_cross; state: "visible" }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad }
        NumberAnimation { properties: "visible"; easing.type: Easing.InOutQuad }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
