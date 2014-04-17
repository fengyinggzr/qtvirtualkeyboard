/****************************************************************************
**
** Copyright (C) 2013 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Quick Enterprise Controls add-on.
**
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.0
import "../components"
import QtQuick.Enterprise.VirtualKeyboard 1.0

KeyboardLayout {
    inputMethod: PlainInputMethod {}
    inputMode: InputEngine.Numeric

    KeyboardColumn {
        Layout.fillWidth: false
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: height
        KeyboardRow {
            Key {
                id: keyOne
                key: Qt.Key_1
                text: "1"
            }
            Key {
                key: Qt.Key_2
                text: "2"
            }
            Key {
                key: Qt.Key_3
                text: "3"
            }
            BackspaceKey {  }
        }
        KeyboardRow {
            Key {
                key: Qt.Key_4
                text: "4"
            }
            Key {
                key: Qt.Key_5
                text: "5"
            }
            Key {
                key: Qt.Key_6
                text: "6"
            }
            Key {
                text: "_"
                repeat: true
                showPreview: false
                key: Qt.Key_Space
            }
        }
        KeyboardRow {
            Key {
                key: Qt.Key_7
                text: "7"
            }
            Key {
                key: Qt.Key_8
                text: "8"
            }
            Key {
                key: Qt.Key_9
                text: "9"
            }
            HideKeyboardKey {  }
        }
        KeyboardRow {
            Key {
                key: Qt.Key_Asterisk
                displayText: "*+"
                text: "*"
                alternativeKeys: "*+"
                visible: InputContext.inputMethodHints & Qt.ImhDialableCharactersOnly
            }
            Key {
                key: Qt.Key_0
                text: "0"
            }
            Key {
                id: signKey
                text: "#"
                key: Qt.Key_NumberSign
                visible: !(InputContext.inputMethodHints & Qt.ImhDigitsOnly)
                states: State {
                    when: InputContext.inputMethodHints & Qt.ImhFormattedNumbersOnly
                    PropertyChanges {
                        target: signKey

                        text: "."
                        key: Qt.Key_Period
                        enabled: InputContext.surroundingText.indexOf(".") === -1
                    }
                }
            }
            EnterKey {  }
        }
    }
}
