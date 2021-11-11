import QtQuick 2.12
import QtQuick.Layouts 1.2

import "../Components"
import "../Constants"

ColumnLayout
{
    id: root

    property bool containsMouse: settingsLine.mouseArea.containsMouse || supportLine.mouseArea.containsMouse ||
                                 privacyLine.mouseArea.containsMouse || privacySwitch.mouseArea.containsMouse

    signal supportLineSelected(var lineType)
    signal settingsClicked()

    height: lineHeight * 3

    FigurativeLine
    {
        id: settingsLine

        Layout.fillWidth: true
        label.text: isExpanded ? qsTr("Settings") : ""
        icon.source: General.image_path + "menu-settings-white.svg"
        onClicked: settingsClicked()
    }

    FigurativeLine
    {
        id: supportLine

        Layout.fillWidth: true
        label.text: isExpanded ? qsTr("Support") : ""
        icon.source: General.image_path + "menu-support-white.png"
        type: Main.LineType.Support
        onClicked: supportLineSelected(type)
    }

    Line
    {
        id: privacyLine

        Layout.fillWidth: true
        label.text: qsTr("Privacy")
        label.visible: isExpanded

        onClicked:
        {
            General.privacy_mode = !General.privacy_mode;
            privacySwitch.checked = General.privacy_mode;
        }

        DefaultSwitch
        {
            id: privacySwitch

            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            scale: 0.75
            mouseArea.hoverEnabled: true

            onClicked: parent.clicked()
        }
    }
}
