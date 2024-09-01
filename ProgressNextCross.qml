// SPDX-License-Identifier: GPL-3.0+
// Copyright (C) 2021 AISIN CORPORATION
// Copyright (C) 2024 Automotive Grade Linux
import QtQuick
import QtQuick.Controls

Item {
	id: progress_next_cross

    visible: false

    // val [Input]
    //   distance to next cross. (unit = meter)
    //   when over the ProgressBar.maximumValue/m, progress bar indicates max (same as ProgressBar.maximumValue/m)
    function setProgress(val) {
        if (val > bar.value ) {
            bar.to = val
        }

        if ( 0 < val ) {
            bar.value = val
        }else{
            bar.value = 0
        }
	}

	ProgressBar {
		id: bar
        width: 800
        height: 20
        //orientation: Qt.Horizontal
        value: 0
        from:  0
        to: 800
	}
    states: [
        State {
            name: "visible"; PropertyChanges { target: progress_next_cross; visible: true }},
        State {
            name: "invisible"; PropertyChanges { target: progress_next_cross; visible: false }}
    ]

}
