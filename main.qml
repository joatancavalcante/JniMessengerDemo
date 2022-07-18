import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

ApplicationWindow {
    id: window
    visible: true

    ColumnLayout {
        anchors.fill: parent
        Text {
            id: messengerLog
            text: qsTr("")
            clip: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            transformOrigin: Item.Center
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }

        RowLayout {
            id: rowlayout
            Layout.bottomMargin: 10
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            anchors.bottom: window.bottom
            spacing: 10

            Button {
                text: qsTr("Enviar pro java via JNI")
                onClicked: {
                    var message = qsTr("QML enviando pro Java: Olá de QML")
                    messengerLog.text += "\n" + message
                    JniMessenger.printFromJava(message)
                }
            }

            Button {
                text: "Clear"
                onClicked: messengerLog.text = ""
            }
        }
    }

    Connections {
        target: JniMessenger
        function onMessageFromJava(message) {
            var output = qsTr("QML recebendo mensagem: %1").arg(message)
            print(output)
            messengerLog.text += "\n" + output
        }
    }
}
