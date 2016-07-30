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

import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import LunaNext.Common 0.1
import QtQuick.Window 2.0

Window {
    id: root
    width: Settings.displayWidth
    height: Settings.displayHeight

    Component.onCompleted:
    {
        root.visible = true
    }

    Button {
        id: toggleButton
        text: "Turn Flashlight On"
        anchors.bottom: brightnessSlider.top
        anchors.bottomMargin: Units.gu(4)
        anchors.horizontalCenter: parent.horizontalCenter
        height: Units.gu(7)

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(toggleButton.text==="Turn Flashlight On")
                {
                    toggleButton.text="Turn Flashlight Off"
                    Leds.ledSet(brightnessSlider.value);
                }
                else
                {
                    toggleButton.text="Turn Flashlight On"
                    Leds.ledSet(0);
                    Leds.stopAll();
                }
            }

        }
    }

    Slider
    {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        id: brightnessSlider
        minimumValue: 0
        maximumValue: 255
        stepSize: 1
        updateValueWhileDragging: true
        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 600
                implicitHeight: Units.gu(4)
                color: "gray"
                radius: 8
            }
            handle:  Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "lightgray"
                border.color: "gray"
                border.width: 2
                implicitWidth: Units.gu(4)
                implicitHeight: Units.gu(4)
                radius: 12
            }
        }
    }

    Text
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: brightnessSlider.bottom
        text: brightnessSlider.value
        color: "black"
    }

}
