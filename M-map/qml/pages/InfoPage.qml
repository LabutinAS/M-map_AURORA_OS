import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "infoPage"

    PageHeader {
        title: qsTr("Информация")
    }

    // Устанавливаем белый фон для страницы
    Rectangle {
        anchors.fill: parent
        color: "white"

        Column {
            anchors.fill: parent
            anchors.margins: Theme.paddingMedium
            spacing: Theme.paddingMedium

            // Ряд кнопок сверху страницы
            Grid {
                columns: 2
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: Theme.paddingSmall

                Button {
                    text: qsTr("1 линия")
                    color: "black"
                    onClicked: {
                        updateLineTable([
                            { vestibule: qsTr("Пр.Ветеранов-1"), openTime: "06:30", closeTime: "20:00" },
                            { vestibule: qsTr("Пр.Ветеранов-2"), openTime: "05:38", closeTime: "00:00" },
                            { vestibule: qsTr("Ленинский пр.-1"), openTime: "05:40", closeTime: "00:45" },
                            { vestibule: qsTr("Ленинский пр.-2"), openTime: "06:30", closeTime: "20:00" },
                            { vestibule: qsTr("Автово"), openTime: "05:30", closeTime: "00:42" },
                            { vestibule: qsTr("Кировский завод"), openTime: "05:30", closeTime: "00:40" },
                            { vestibule: qsTr("Нарвская"), openTime: "05:36", closeTime: "00:36" },
                            { vestibule: qsTr("Балтийская"), openTime: "05:36", closeTime: "00:33" },
                            { vestibule: qsTr("Технологический институт-1"), openTime: "07:00", closeTime: "20:00" },
                            { vestibule: qsTr("Пушкинская"), openTime: "05:38", closeTime: "00:28" },
                            { vestibule: qsTr("Владимирская"), openTime: "05:38", closeTime: "00:26" },
                            { vestibule: qsTr("Пл.Восстания-1"), openTime: "05:44", closeTime: "00:25" },
                            { vestibule: qsTr("Пл.Восстания-2"), openTime: "05:44", closeTime: "00:25" },
                            { vestibule: qsTr("Чернышевская"), openTime: "05:48", closeTime: "00:25" },
                            { vestibule: qsTr("Пл.Ленина-1"), openTime: "05:46", closeTime: "00:28" },
                            { vestibule: qsTr("Пл.Ленина-2"), openTime: "05:46", closeTime: "22:00" },
                            { vestibule: qsTr("Выборгская"), openTime: "05:45", closeTime: "00:30" },
                            { vestibule: qsTr("Лесная"), openTime: "05:42", closeTime: "00:33" },
                            { vestibule: qsTr("Пл.Мужества"), openTime: "05:40", closeTime: "00:37" },
                            { vestibule: qsTr("Политехническая"), openTime: "05:37", closeTime: "00:39" },
                            { vestibule: qsTr("Академическая"), openTime: "05:35", closeTime: "00:40" },
                            { vestibule: qsTr("Гражданский пр."), openTime: "05:30", closeTime: "00:44" },
                            { vestibule: qsTr("Девяткино"), openTime: "05:32", closeTime: "00:00" }
                        ]);
                    }
                }

                Button {
                    text: qsTr("2 линия")
                    color: "black"
                    onClicked: {
                        updateLineTable([
                            { vestibule: qsTr("Купчино"), openTime: "05:30", closeTime: "00:00" },
                            { vestibule: qsTr("Звездная"), openTime: "05:31", closeTime: "00:45" },
                            { vestibule: qsTr("Московская-1"), openTime: "06:30", closeTime: "22:00" },
                            { vestibule: qsTr("Московская-2"), openTime: "05:35", closeTime: "00:41" },
                            { vestibule: qsTr("Парк Победы"), openTime: "05:37", closeTime: "00:37" },
                            { vestibule: qsTr("Электросила"), openTime: "05:40", closeTime: "00:35" },
                            { vestibule: qsTr("Московские ворота"), openTime: "05:43", closeTime: "00:33" },
                            { vestibule: qsTr("Фрунзенская"), openTime: "05:45", closeTime: "00:30" },
                            { vestibule: qsTr("Технологический институт-2"), openTime: "05:40", closeTime: "00:28" },
                            { vestibule: qsTr("Сенная пл."), openTime: "05:36", closeTime: "00:26" },
                            { vestibule: qsTr("Невский пр.-1"), openTime: "07:00", closeTime: "23:00" },
                            { vestibule: qsTr("Невский пр.-2"), openTime: "05:36", closeTime: "00:28" },
                            { vestibule: qsTr("Горьковская"), openTime: "05:38", closeTime: "00:26" },
                            { vestibule: qsTr("Петроградская"), openTime: "05:36", closeTime: "00:28" },
                            { vestibule: qsTr("Черная речка"), openTime: "05:50", closeTime: "00:32" },
                            { vestibule: qsTr("Пионерская"), openTime: "05:46", closeTime: "00:35" },
                            { vestibule: qsTr("Удельная"), openTime: "05:44", closeTime: "00:38" },
                            { vestibule: qsTr("Озерки"), openTime: "05:41", closeTime: "00:41" },
                            { vestibule: qsTr("Пр.Просвещения"), openTime: "05:36", closeTime: "00:40" },
                            { vestibule: qsTr("Парнас"), openTime: "05:46", closeTime: "00:00" }
                        ]);
                    }
                }

                Button {
                    text: qsTr("3 линия")
                    color: "black"
                    onClicked: {
                        updateLineTable([
                            { vestibule: qsTr("Приморская"), openTime: "05:51", closeTime: "00:03" },
                            { vestibule: qsTr("Василеостровская"), openTime: "05:33", closeTime: "00:34" },
                            { vestibule: qsTr("Гостиный двор"), openTime: "05:36", closeTime: "00:28" },
                            { vestibule: qsTr("Маяковская"), openTime: "05:42", closeTime: "00:25" },
                            { vestibule: qsTr("Пл.Ал.Невского-1"), openTime: "05:39", closeTime: "00:24" },
                            { vestibule: qsTr("Елизаровская"), openTime: "05:38", closeTime: "00:24" },
                            { vestibule: qsTr("Ломоносовская"), openTime: "05:34", closeTime: "00:27" },
                            { vestibule: qsTr("Пролетарская"), openTime: "05:38", closeTime: "00:30" },
                            { vestibule: qsTr("Обухово"), openTime: "05:39", closeTime: "00:33" },
                            { vestibule: qsTr("Рыбацкое"), openTime: "05:35", closeTime: "00:05" }
                        ]);
                    }
                }

                Button {
                    text: qsTr("4 линия")
                    color: "black"
                    onClicked: {
                        updateLineTable([
                            { vestibule: qsTr("Ул.Дыбенко"), openTime: "05:35", closeTime: "00:05" },
                            { vestibule: qsTr("Пр.Большевиков"), openTime: "05:37", closeTime: "00:18" },
                            { vestibule: qsTr("Ладожская"), openTime: "05:40", closeTime: "00:15" },
                            { vestibule: qsTr("Новочеркасская"), openTime: "05:39", closeTime: "00:14" },
                            { vestibule: qsTr("Пл.Ал.Невского-2"), openTime: "05:35", closeTime: "00:15" },
                            { vestibule: qsTr("Лиговский пр."), openTime: "05:40", closeTime: "00:18" },
                            { vestibule: qsTr("Достоевская"), openTime: "07:00", closeTime: "20:00" }
                        ]);
                    }
                }

                Button {
                    text: qsTr("5 линия")
                    color: "black"
                    onClicked: {
                        updateLineTable([
                            { vestibule: qsTr("Волковская"), openTime: "05:35", closeTime: "00:05" },
                            { vestibule: qsTr("Звенигородская"), openTime: "05:40", closeTime: "00:23" },
                            { vestibule: qsTr("Садовая"), openTime: "05:36", closeTime: "00:20" },
                            { vestibule: qsTr("Спортивная"), openTime: "05:37", closeTime: "00:16" },
                            { vestibule: qsTr("Чкаловская"), openTime: "05:38", closeTime: "00:19" },
                            { vestibule: qsTr("Крестовский остров"), openTime: "05:42", closeTime: "00:22" },
                            { vestibule: qsTr("Старая деревня"), openTime: "05:37", closeTime: "00:25" },
                            { vestibule: qsTr("Комендантский пр."), openTime: "05:36", closeTime: "00:03" }
                        ]);
                    }
                }

                Button {
                    text: qsTr("Стоимость")
                    color: "black"
                    onClicked: {
                        updateCostTable([
                            { ticketType: qsTr("Обычный"), cost: "70 руб" },
                            { ticketType: qsTr("Льготный"), cost: "0 руб" }
                        ]);
                    }
                }
            }

            // Таблица для линий
            Column {
                id: lineTableContainer
                visible: false // Делаем таблицу невидимой по умолчанию
                width: parent.width * 0.9 // Ширина 90% от ширины страницы
                anchors.leftMargin: 15 // Сдвиг таблицы вправо
                spacing: Theme.paddingSmall

                // Заголовок таблицы для линий
                Row {
                    spacing: Theme.paddingLarge
                    width: parent.width
                    Label {
                        text: qsTr("Вестибюль станции")
                        font.bold: true
                        font.pixelSize: 14 // Уменьшение размера текста
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 3
                        wrapMode: Text.WordWrap // Перенос текста на новую строку
                    }
                    Label {
                        text: qsTr("Время открытия")
                        font.bold: true
                        font.pixelSize: 14 // Уменьшение размера текста
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 3
                    }
                    Label {
                        text: qsTr("Время закрытия")
                        font.bold: true
                        font.pixelSize: 14 // Уменьшение размера текста
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 3
                    }
                }

                // Данные таблицы для линий
                Repeater {
                    id: lineTableRepeater
                    model: [] // Модель будет обновляться динамически

                    Row {
                        spacing: Theme.paddingLarge
                        width: parent.width
                        Label {
                            text: modelData.vestibule
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 3
                            wrapMode: Text.WordWrap // Перенос текста на новую строку
                        }
                        Label {
                            text: modelData.openTime
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 3
                        }
                        Label {
                            text: modelData.closeTime
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 3
                        }
                    }
                }
            }

            // Таблица для стоимости
            Column {
                id: costTableContainer
                visible: false // Делаем таблицу невидимой по умолчанию
                width: parent.width * 0.9 // Ширина 90% от ширины страницы
                anchors.leftMargin: 5 // Сдвиг таблицы вправо
                spacing: Theme.paddingSmall

                // Заголовок таблицы для стоимости
                Row {
                    spacing: Theme.paddingLarge
                    width: parent.width
                    Label {
                        text: qsTr("Тип билета")
                        font.bold: true
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 2
                    }
                    Label {
                        text: qsTr("Стоимость")
                        font.bold: true
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width / 2
                    }
                }

                // Данные таблицы для стоимости
                Repeater {
                    id: costTableRepeater
                    model: [] // Модель будет обновляться динамически

                    Row {
                        spacing: Theme.paddingLarge
                        width: parent.width
                        Label {
                            text: modelData.ticketType
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 2
                        }
                        Label {
                            text: modelData.cost
                            color: "black"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: parent.width / 2
                        }
                    }
                }
            }
        }
    }

    // Функции для обновления данных таблиц
    function updateLineTable(data) {
        lineTableRepeater.model = data;
        lineTableContainer.visible = true;
        costTableContainer.visible = false;
    }

    function updateCostTable(data) {
        costTableRepeater.model = data;
        costTableContainer.visible = true;
        lineTableContainer.visible = false;
    }
}
