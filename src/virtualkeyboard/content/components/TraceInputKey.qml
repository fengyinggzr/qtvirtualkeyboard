/****************************************************************************
**
** Copyright (C) 2015 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://www.qt.io
**
** This file is part of the Qt Virtual Keyboard add-on for Qt Enterprise.
**
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://www.qt.io
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.0

/*!
    \qmltype TraceInputKey
    \inqmlmodule QtQuick.Enterprise.VirtualKeyboard
    \ingroup qtvirtualkeyboard-qml
    \inherits Item
    \since QtQuick.Enterprise.VirtualKeyboard 1.4

    \brief A specialized key for collecting touch input data.

    This type can be placed in the keyboard layout. It collects
    and renders touch input data (trace) from the key area.
*/

Item {
    id: traceInputKey

    /*! Sets the key weight value which determines the relative size of the key.

        Use this property to change the key size in the layout.

        The default value is inherited from the parent element
        of the key in the layout hierarchy.
    */
    property real weight: parent.keyWeight

    /*! Pattern recognition mode of this input area.

        The default value is \l {DeclarativeInputEngine::PatternRecognitionDisabled} {InputEngine.PatternRecognitionDisabled}.
    */
    property alias patternRecognitionMode: traceInputArea.patternRecognitionMode

    /*! List of horizontal rulers in the input area.

        The rulers are defined as a number of pixels from the top edge of the bounding box.

        Here is an example how to define rulers:

        \code
            horizontalRulers: [boundingBox.height / 3, boundingBox.height / 3 * 2]
            verticalRulers: [boundingBox.width / 3, boundingBox.width / 3 * 2]
        \endcode
    */
    property alias horizontalRulers: traceInputArea.horizontalRulers

    /*! List of vertical rulers in the input area.

        The rulers are defined as a number of pixels from the left edge of the bounding box.
    */
    property alias verticalRulers: traceInputArea.verticalRulers

    /*! Bounding box for the trace input.

        This property is readonly and is automatically updated based on the item size
        and margins.
    */
    readonly property alias boundingBox: traceInputArea.boundingBox

    Layout.minimumWidth: traceInputKeyPanel.implicitWidth
    Layout.minimumHeight: traceInputKeyPanel.implicitHeight
    Layout.preferredWidth: weight
    Layout.fillWidth: true
    Layout.fillHeight: true

    Loader {
        id: traceInputKeyPanel
        sourceComponent: keyboard.style.traceInputKeyPanelDelegate
        anchors.fill: parent
        onStatusChanged: if (status == Loader.Ready) traceInputKeyPanel.item.control = traceInputKey
    }

    TraceInputArea {
        id: traceInputArea
        anchors.fill: traceInputKeyPanel
        anchors.margins: traceInputKeyPanel.item ? traceInputKeyPanel.item.traceMargins : 0
    }
}
