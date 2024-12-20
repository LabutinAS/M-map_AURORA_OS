import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        Label {
            anchors.centerIn: parent
            text: qsTr("M-map")
        }
    }

    property var firstNode: null
    property var secondNode: null
    property real distance: 0
    property var shortestPath: []
    property var pathLabels: [] // Массив для хранения номеров вершин в пути
    property color mbR_5: "purple"
    property color mbR_4: "orange"
    property color mbR_3: "green"
    property color mbR_2: "blue"
    property color mbR_1: "red"
    // Матрица весов рёбер между узлами
    property var edgeWeights: [
        {nodes: [0, 1], controlX: 192, controlY: 173.75, weight: 3, color: mbR_5},
        {nodes: [1, 2], controlX: 191.25, controlY: 220.5, weight: 3, color: mbR_5},
        {nodes: [2, 3], controlX: 193.25, controlY: 265.25, weight: 3, color: mbR_5},
        {nodes: [3, 4], controlX: 199.25, controlY: 305.25, weight: 3, color: mbR_5},
        {nodes: [4, 56], controlX: 239.25, controlY: 404.25, weight: 3, color: mbR_5},
        {nodes: [5, 56], controlX: 272, controlY: 444.5, weight: 3, color: mbR_5},
        {nodes: [5, 19], controlX: 323.25, controlY: 585.25, weight: 3, color: mbR_2},
        {nodes: [5, 18], controlX: 408, controlY: 484, weight: 3, color: mbR_4},
        {nodes: [6, 18], controlX: 429, controlY: 505.75, weight: 3, color: mbR_1},
        {nodes: [6, 5], controlX: 343, controlY: 498.75, weight: 3, color: mbR_5},
        {nodes: [6, 55], controlX: 443.5, controlY: 607.25, weight: 3, color: mbR_5},
        {nodes: [7, 57], controlX: 477.75, controlY: 729.75, weight: 3, color: mbR_5},
        {nodes: [8, 9], controlX: 458, controlY: 75.25, weight: 3, color: mbR_1},
        {nodes: [9, 10], controlX: 458, controlY: 111.75, weight: 3, color: mbR_1},
        {nodes: [10, 11], controlX: 458, controlY: 148, weight: 3, color: mbR_1},
        {nodes: [11, 12], controlX: 457.25, controlY: 184, weight: 3, color: mbR_1},
        {nodes: [12, 13], controlX: 457.75, controlY: 222.25, weight: 3, color: mbR_1},
        {nodes: [13, 14], controlX: 458, controlY: 259, weight: 3, color: mbR_1},
        {nodes: [14, 15], controlX: 458, controlY: 295, weight: 3, color: mbR_1},
        {nodes: [15, 16], controlX: 458, controlY: 336.25, weight: 3, color: mbR_1},
        {nodes: [16, 17], controlX: 457.25, controlY: 387.5, weight: 3, color: mbR_1},
        {nodes: [17, 18], controlX: 448.25, controlY: 459.25, weight: 3, color: mbR_1},
        {nodes: [17, 34], controlX: 357.25, controlY: 401, weight: 3, color: mbR_3},
        {nodes: [17, 44], controlX: 606.5, controlY: 395, weight: 3, color: mbR_3},
        {nodes: [18, 50], controlX: 513.25, controlY: 484, weight: 3, color: mbR_4},
        {nodes: [19, 6], controlX: 376.75, controlY: 577, weight: 3, color: mbR_1},
        {nodes: [19, 35], controlX: 323.75, controlY: 655.75, weight: 3, color: mbR_2},
        {nodes: [20, 19], controlX: 281, controlY: 648.25, weight: 3, color: mbR_1},
        {nodes: [21, 20], controlX: 231.25, controlY: 696, weight: 3, color: mbR_1},
        {nodes: [22, 21], controlX: 202, controlY: 732.75, weight: 3, color: mbR_1},
        {nodes: [23, 22], controlX: 180.5, controlY: 767.5, weight: 3, color: mbR_1},
        {nodes: [23, 24], controlX: 164, controlY: 819.25, weight: 3, color: mbR_1},
        {nodes: [25, 24], controlX: 161.25, controlY: 837.5, weight: 3, color: mbR_1},
        {nodes: [26, 27], controlX: 324, controlY: 57, weight: 3, color: mbR_2},
        {nodes: [27, 28], controlX: 324, controlY: 93.25, weight: 3, color: mbR_2},
        {nodes: [28, 29], controlX: 324, controlY: 127.5, weight: 3, color: mbR_2},
        {nodes: [29, 30], controlX: 324, controlY: 160, weight: 3, color: mbR_2},
        {nodes: [30, 31], controlX: 324, controlY: 191.25, weight: 3, color: mbR_2},
        {nodes: [31, 32], controlX: 324, controlY: 239.5, weight: 3, color: mbR_2},
        {nodes: [32, 33], controlX: 324, controlY: 289, weight: 3, color: mbR_2},
        {nodes: [33, 34], controlX: 324, controlY: 376, weight: 3, color: mbR_2},
        {nodes: [34, 5], controlX: 324, controlY: 463.25, weight: 3, color: mbR_2},
        {nodes: [34, 43], controlX: 144.75, controlY: 413, weight: 3, color: mbR_3},
        {nodes: [35, 36], controlX: 324, controlY: 700.25, weight: 3, color: mbR_2},
        {nodes: [36, 37], controlX: 324, controlY: 737.25, weight: 3, color: mbR_2},
        {nodes: [37, 38], controlX: 324, controlY: 771.5, weight: 3, color: mbR_2},
        {nodes: [38, 39], controlX: 324, controlY: 807.75, weight: 3, color: mbR_2},
        {nodes: [39, 40], controlX: 324, controlY: 844, weight: 3, color: mbR_2},
        {nodes: [40, 41], controlX: 324, controlY: 878.5, weight: 3, color: mbR_2},
        {nodes: [42, 43], controlX: 81.5, controlY: 369, weight: 3, color: mbR_3},
        {nodes: [42, 59], controlX: 65.5, controlY: 253.5, weight: 3, color: mbR_3},
        {nodes: [44, 45], controlX: 607, controlY: 675.5, weight: 3, color: mbR_3},
        {nodes: [44, 51], controlX: 678, controlY: 501.75, weight: 3, color: mbR_4},
        {nodes: [45, 46], controlX: 607, controlY: 766.75, weight: 3, color: mbR_3},
        {nodes: [46, 47], controlX: 607, controlY: 803, weight: 3, color: mbR_3},
        {nodes: [47, 48], controlX: 607, controlY: 840.5, weight: 3, color: mbR_3},
        {nodes: [48, 49], controlX: 607, controlY: 878.5, weight: 3, color: mbR_3},
        {nodes: [50, 44], controlX: 590, controlY: 484.75, weight: 3, color: mbR_4},
        {nodes: [52, 51], controlX: 699.25, controlY: 532.25, weight: 3, color: mbR_4},
        {nodes: [53, 52], controlX: 700, controlY: 581.5, weight: 3, color: mbR_4},
        {nodes: [53, 54], controlX: 700.75, controlY: 676, weight: 3, color: mbR_4},
        {nodes: [55, 7], controlX: 474.25, controlY: 675, weight: 3, color: mbR_5},
        {nodes: [58, 57], controlX: 478, controlY: 749, weight: 3, color: mbR_5},
        {nodes: [58, 61], controlX: 478, controlY: 807.5, weight: 3, color: mbR_5},
        {nodes: [60, 59], controlX: 65, controlY: 215.75, weight: 3, color: mbR_3},
        {nodes: [62, 61], controlX: 478, controlY: 825.75, weight: 3, color: mbR_5},
        {nodes: [63, 62], controlX: 478, controlY: 860.75, weight: 3, color: mbR_5}
        // Добавьте другие рёбра с их контрольными точками
    ]

    // Позиции узлов
    property color mbSt_5: "purple"
    property color mbSt_4: "orange"
    property color mbSt_3: "green"
    property color mbSt_2: "blue"
    property color mbSt_1: "red"
    property var nodes: [
        {id: 0, x: 192, y: 146, color: mbSt_5, n_st: "Комендантский проспект"},
        {id: 1, x: 192, y: 183, color: mbSt_5, n_st: "Старая деревня"},
        {id: 2, x: 191, y: 233, color: mbSt_5, n_st: "Крестовский остров"},
        {id: 3, x: 194, y: 276, color: mbSt_5, n_st: "Чкаловская"},
        {id: 4, x: 201, y: 315, color: mbSt_5, n_st: "Спортивная"},
        {id: 5, x: 324, y: 484, color: mbSt_5, n_st: "Сенная площадь\nСадовая\nСпасская"},
        {id: 6, x: 396, y: 551, color: mbSt_1, n_st: "Звенигородская\nПушкинская"},
        {id: 7, x: 477, y: 698, color: mbSt_5, n_st: "Волковская"},
        {id: 8, x: 458, y: 49, color: mbSt_1, n_st: "Девяткино"},
        {id: 9, x: 458, y: 84, color: mbSt_1, n_st: "Гражданскай проспект"},
        {id: 10, x: 458, y: 121, color: mbSt_1, n_st: "Академическая"},
        {id: 11, x: 458, y: 157, color: mbSt_1, n_st: "Политехническая"},
        {id: 12, x: 457, y: 193, color: mbSt_1, n_st: "Площадь мужества"},
        {id: 13, x: 458, y: 232, color: mbSt_1, n_st: "Лесная"},
        {id: 14, x: 458, y: 268, color: mbSt_1, n_st: "Выборгская"},
        {id: 15, x: 458, y: 304, color: mbSt_1, n_st: "Площадь Ленина"},
        {id: 16, x: 458, y: 347, color: mbSt_1, n_st: "Чернышевская"},
        {id: 17, x: 457, y: 401, color: mbSt_1, n_st: "Маяковская\nПлощадь восстания"},
        {id: 18, x: 436, y: 484, color: mbSt_1, n_st: "Владимирская\nДостоевская"},
        {id: 19, x: 323, y: 619, color: mbSt_1, n_st: "Технологический институт 1\nТехнологический институт 2"},
        {id: 20, x: 239, y: 688, color: mbSt_1, n_st: "Балтийская"},
        {id: 21, x: 208, y: 724, color: mbSt_1, n_st: "Нарвская"},
        {id: 22, x: 184, y: 759, color: mbSt_1, n_st: "Кировский завод"},
        {id: 23, x: 170, y: 793, color: mbSt_1, n_st: "Автово"},
        {id: 24, x: 162, y: 828, color: mbSt_1, n_st: "Ленинский проспект"},
        {id: 25, x: 159, y: 866, color: mbSt_1, n_st: "Проспект ветеранов"},
        {id: 26, x: 324, y: 27, color: mbSt_2, n_st: "Парнас"},
        {id: 27, x: 324, y: 67, color: mbSt_2, n_st: "Проспект просвещения"},
        {id: 28, x: 324, y: 102, color: mbSt_2, n_st: "Озерки"},
        {id: 29, x: 324, y: 136, color: mbSt_2, n_st: "Удельная"},
        {id: 30, x: 324, y: 168, color: mbSt_2, n_st: "Пионерская"},
        {id: 31, x: 324, y: 199, color: mbSt_2, n_st: "Черная речка"},
        {id: 32, x: 324, y: 253, color: mbSt_2, n_st: "Петроградская"},
        {id: 33, x: 324, y: 301, color: mbSt_2, n_st: "Горьковская"},
        {id: 34, x: 324, y: 401, color: mbSt_2, n_st: "Невский проспект\nГостиный двор"},
        {id: 35, x: 324, y: 668, color: mbSt_2, n_st: "Фрунзенская"},
        {id: 36, x: 324, y: 711, color: mbSt_2, n_st: "Московские ворота"},
        {id: 37, x: 324, y: 746, color: mbSt_2, n_st: "Электросила"},
        {id: 38, x: 324, y: 780, color: mbSt_2, n_st: "Парк победы"},
        {id: 39, x: 324, y: 817, color: mbSt_2, n_st: "Московская"},
        {id: 40, x: 324, y: 853, color: mbSt_2, n_st: "Звездная"},
        {id: 41, x: 324, y: 887, color: mbSt_2, n_st: "Купчино"},
        {id: 42, x: 67, y: 333, color: mbSt_3, n_st: "Приморская"},
        {id: 43, x: 97, y: 381, color: mbSt_3, n_st: "Василеостровская"},
        {id: 44, x: 607, y: 485, color: mbSt_3, n_st: "Площадь Александра Невского 1\nПлощадь Александра Невского 2"},
        {id: 45, x: 607, y: 739, color: mbSt_3, n_st: "Елизаровская"},
        {id: 46, x: 607, y: 776, color: mbSt_3, n_st: "Ломоносовская"},
        {id: 47, x: 607, y: 812, color: mbSt_3, n_st: "Пролетарская"},
        {id: 48, x: 607, y: 850, color: mbSt_3, n_st: "Обухово"},
        {id: 49, x: 607, y: 888, color: mbSt_3, n_st: "Рыбацкое"},
        {id: 50, x: 539, y: 484, color: mbSt_4, n_st: "Лиговский проспект"},
        {id: 51, x: 691, y: 518, color: mbSt_4, n_st: "Новочеркасская"},
        {id: 52, x: 700, y: 563, color: mbSt_4, n_st: "Ладожская"},
        {id: 53, x: 700, y: 637, color: mbSt_4, n_st: "Проспект большевиков"},
        {id: 54, x: 701, y: 689, color: mbSt_4, n_st: "Улица Дыбенко"},
        {id: 55, x: 454, y: 634, color: mbSt_5, n_st: "Обводный канал"},
        {id: 56, x: 260, y: 426, color: mbSt_5, n_st: "Адмиралтейская"},
        {id: 57, x: 478, y: 739, color: mbSt_5, n_st: "Бухарестская"},
        {id: 58, x: 478, y: 779, color: mbSt_5, n_st: "Международная"},
        {id: 59, x: 65, y: 227, color: mbSt_3, n_st: "Зенит"},
        {id: 60, x: 65, y: 182, color: mbSt_3, n_st: "Беговая"},
        {id: 61, x: 478, y: 817, color: mbSt_5, n_st: "Проспект Славы"},
        {id: 62, x: 478, y: 852, color: mbSt_5, n_st: "Дунайская"},
        {id: 63, x: 478, y: 887, color: mbSt_5, n_st: "Шушары"}
    ]

    // Смещения для перемещения всего графа
    property real offsetX: 0 // Смещение по оси X
    property real offsetY: 0 // Смещение по оси Y
    property real initialX: 0 // Начальная позиция мыши по оси X
    property real initialY: 0 // Начальная позиция мыши по оси Y

    Item {
        width: parent.width
        height: parent.height - 50
        anchors.horizontalCenter: parent.horizontalCenter

        Canvas {
            id: graphCanvas
            width: 900
            height: 1000
            anchors.centerIn: parent

            onPaint: {
                var ctx = graphCanvas.getContext("2d");
                ctx.clearRect(0, 0, graphCanvas.width, graphCanvas.height);
                ctx.fillStyle = "white"; // Белый
                ctx.fillRect(0, 0, graphCanvas.width, graphCanvas.height);

                // Отрисовка рёбер с кривыми Безье
                for (var i = 0; i < edgeWeights.length; i++) {
                    var edge = edgeWeights[i];
                    var startNode = nodes[edge.nodes[0]];
                    var endNode = nodes[edge.nodes[1]];

                    var controlX = edge.controlX;
                    var controlY = edge.controlY;

                    // Проверяем, входит ли ребро в кратчайший путь step-by-step
                    var isEdgeOnPath = false;
                    for (var j = 0; j < shortestPath.length - 1; j++) {
                        if (
                            (shortestPath[j] === edge.nodes[0] && shortestPath[j + 1] === edge.nodes[1]) ||
                            (shortestPath[j] === edge.nodes[1] && shortestPath[j + 1] === edge.nodes[0])
                        ) {
                            isEdgeOnPath = true;
                            break;
                        }
                    }

                    ctx.strokeStyle = edge.color; // Цвет ребра
                    ctx.lineWidth = isEdgeOnPath ? 8 : 3; // Увеличиваем ширину, если ребро в кратчайшем пути

                    ctx.beginPath();
                    ctx.moveTo(startNode.x + offsetX, startNode.y + offsetY);
                    ctx.quadraticCurveTo(
                        controlX + offsetX,
                        controlY + offsetY,
                        endNode.x + offsetX,
                        endNode.y + offsetY
                    );
                    ctx.stroke();
                }

                // Отрисовка узлов с учётом смещения
                for (var j = 0; j < nodes.length; j++) {
                    var node = nodes[j];
                    var nodeRadius = 12; // Базовый радиус узла

                    // Увеличиваем радиус для выбранных узлов
                    if (node === firstNode || node === secondNode) {
                        nodeRadius = 16; // Увеличиваем радиус на 1 для выбранного узла
                    }

                    ctx.beginPath();
                    ctx.arc(node.x + offsetX, node.y + offsetY, nodeRadius, 0, 2 * Math.PI);

                    // Используем свойство color для установки цвета узла
                    ctx.fillStyle = node.color;
                    ctx.fill();

                    // Отображение номера вершины, если она входит в кратчайший путь
                    var pathIndex = shortestPath.indexOf(node.id);
                    if (pathIndex !== -1) {
                        ctx.arc(node.x + offsetX, node.y + offsetY, nodeRadius, 0, 2 * Math.PI);
                        ctx.fillStyle = "black";
                        ctx.font = "bold 20px Default";
                        ctx.textAlign = "center";
                        ctx.textBaseline = "middle";
                        ctx.fillText(pathLabels[pathIndex], node.x + offsetX, node.y + offsetY);
                    }
                    // Отображение названия станции
                    ctx.textAlign = "right";
                    ctx.fillStyle = "black";

                    // Вычисляем смещение для узлов с особым положением
                    var textYOffset = ((node.id === 18 || node.id === 50 || node.id === 44 || node.id === 34 || node.id === 17) ? (node.id ===50 ? -15 : -25 ): 0);
                    var textXOffset = ((node.id === 44 || node.id === 50) ? (node.id === 50 ? 35 : 145) : 0);
                    // Разбиваем текст на строки по символу '\n'
                    var stationNames = node.n_st.split("\n");

                    // Отрисовываем каждую строку с вертикальным смещением
                    for (var line = 0; line < stationNames.length; line++) {
                        ctx.fillText(
                            stationNames[line],
                            node.x + offsetX - 20 + textXOffset,
                            node.y + offsetY + textYOffset + line * 15 // Смещение между строками с учётом textYOffset
                        );
                    }


                }
            }


            MouseArea {
                anchors.fill: parent
                onPressed: function(mouse) {
                    initialX = mouse.x;
                    initialY = mouse.y;
                }

                onPositionChanged: function(mouse) {
                    // Вычисляем смещение относительно начальной позиции
                    var deltaX = mouse.x - initialX;
                    var deltaY = mouse.y - initialY;

                    // Обновляем смещение всего графа
                    offsetX += deltaX;
                    offsetY += deltaY;

                    // Обновляем начальные координаты для следующего сдвига
                    initialX = mouse.x;
                    initialY = mouse.y;

                    graphCanvas.requestPaint(); // Перерисовываем Canvas
                }

                onClicked: function(mouse) {
                    // Определение выбранного узла с учётом смещения
                    for (var k = 0; k < nodes.length; k++) {
                        var node = nodes[k];
                        var dx = mouse.x - (node.x + offsetX);
                        var dy = mouse.y - (node.y + offsetY);
                        var distanceToNode = Math.sqrt(dx * dx + dy * dy);

                        if (distanceToNode <= 12) { // Если нажато на узел (радиус 12)
                            if (firstNode === null) {
                                firstNode = node;
                            } else if (secondNode === null && firstNode !== node) {
                                secondNode = node;
                                calculateDistance();
                            } else {
                                // Если выбранная вершина уже существует, сбрасываем их
                                firstNode = node;
                                secondNode = null;
                                distance = 0;
                                shortestPath = [];
                                pathLabels = [];
                            }
                            graphCanvas.requestPaint();
                            //console.log(node.id);
                            break;
                        }
                    }
                }
            }
        }
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: graphCanvas.bottom
        text: distance > 0 ? qsTr("Время: ") + distance + qsTr("мин ") : qsTr("Выберете откуда/куда")
        font.pixelSize: 20
        color: "white"
    }
    // Добавляем кнопки внизу экрана
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: Theme.paddingLarge

        Button {
            text: qsTr("Новости")
            onClicked: {
                pageStack.push(Qt.resolvedUrl("NewsPage.qml"));
            }
        }

        Button {
            text: qsTr("Информация")
            onClicked: {
                pageStack.push(Qt.resolvedUrl("InfoPage.qml"));
            }
        }
    }

    function calculateDistance() {
        if (!firstNode || !secondNode) return;

        var allPaths = [];

        function dfs(currentNode, currentPath, currentDistance, lastColor, colorChanges) {
            if (currentNode === secondNode.id) {
                allPaths.push({
                    path: currentPath.slice(),
                    distance: currentDistance,
                    colorChanges: colorChanges
                });
                return;
            }

            nodes.forEach(function(node) {
                if (currentPath.indexOf(node.id) === -1) { // Заменяем includes на indexOf
                    edgeWeights.forEach(function(edge) {
                        if ((edge.nodes[0] === currentNode && edge.nodes[1] === node.id) ||
                            (edge.nodes[1] === currentNode && edge.nodes[0] === node.id)) {

                            var penalty = (lastColor && lastColor !== edge.color) ? 5 : 0;
                            currentPath.push(node.id);
                            dfs(node.id, currentPath, currentDistance + edge.weight + penalty, edge.color, colorChanges + (penalty > 0 ? 1 : 0));
                            currentPath.pop();
                        }
                    });
                }
            });
        }

        dfs(firstNode.id, [firstNode.id], 0, null, 0);

        if (allPaths.length > 0) {
            allPaths.sort(function(a, b) {
                return a.distance - b.distance;
            });

            var shortest = allPaths[0];
            shortestPath = shortest.path;
            distance = shortest.distance;

            // Генерация меток для пути (нумерация начинается с 1)
            pathLabels = [];
            for (var i = 0; i < shortestPath.length; i++) {
                pathLabels.push(i + 1);
            }

            console.log("Все конечные пути и их расстояния:");
            allPaths.forEach(function(pathObj) {
                console.log("Путь: ", pathObj.path.join(" -> "), " Расстояние: ", pathObj.distance, " Смены цвета: ", pathObj.colorChanges);
            });
        } else {
            shortestPath = [];
            distance = 0;
            pathLabels = [];
            console.log("Пути между выбранными узлами нет.");
        }
    }



}
