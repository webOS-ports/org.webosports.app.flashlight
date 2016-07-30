/*
 * Copyright (C) 2016 Herman van Hazendonk <github.com@herrie.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import Qt.labs.controls 1.0
import LunaNext.Common 0.1

Window {
    id: window

    width: Settings.displayWidth
    height: Settings.displayHeight

    Button {
        id: toggleButton
        text: "Turn Flashlight On"
        anchors.bottom: brightnessSlider.top
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(toggleButton.text==="Turn Flashlight On")
                {
                    toggleButton.text="Turn Flashlight Off"
                    LedsAdapter.ledSet(brightnessSlider.value);
                }
                else
                {
                    toggleButton.text="Turn Flashlight On"
                    LedsAdapter.stopAll();
                }
            }

        }
    }


    Slider
    {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        id: brightnessSlider
        from: 0
        to: 200
        stepSize: 0.01
        snapMode: Slider.SnapAlways
    }

    Text
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: brightnessSlider.bottom
        text: brightnessSlider.value
        color: "black"
    }

}
