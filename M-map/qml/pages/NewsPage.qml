import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "newsPage"

    PageHeader {
        title: qsTr("НОВОСТИ")
    }

    // Устанавливаем белый фон для страницы
    Rectangle {
        anchors.fill: parent
        color: "white"

        Column {
            anchors.fill: parent
            anchors.margins: Theme.paddingMedium
            spacing: Theme.paddingMedium

            // Таблица новостей
            Column {
                id: newsTableContainer
                width: parent.width * 0.9 // Ширина 90% от ширины страницы
                anchors.leftMargin: 15 // Сдвиг таблицы вправо
                spacing: Theme.paddingSmall

                // Заголовок таблицы новостей
                Row {
                    spacing: Theme.paddingLarge
                    width: parent.width
                    Label {
                        text: qsTr("Дата")
                        font.bold: true
                        font.pixelSize: 14 // Уменьшение размера текста
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 4
                    }
                    Label {
                        text: qsTr("Новости")
                        font.bold: true
                        font.pixelSize: 14 // Уменьшение размера текста
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width * 3 / 4
                        wrapMode: Text.WordWrap // Перенос текста на новую строку
                    }
                }

                // Данные таблицы новостей
                Repeater {
                    model: [
                        { date: "15.12", news: qsTr("Станция Автово закрыта на ремонт до 17.12") },
                        { date: "14.12", news: qsTr("На станции Чернышевская проводятся технические работы") }
                    ]

                    Row {
                        spacing: Theme.paddingLarge
                        width: parent.width
                        Label {
                            text: modelData.date
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 4
                        }
                        Label {
                            text: modelData.news
                            color: "black"
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width * 3 / 4
                            wrapMode: Text.WordWrap // Перенос текста на новую строку
                        }
                    }
                }
            }
        }
    }
}
