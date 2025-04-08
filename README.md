# M-map  
Мобильное приложение на ОС АВРОРА  
 
Интерактивная карта метро Санкт-Петербурга  
Мобильное приложение для навигации по Петербургскому метрополитену с возможностью построения маршрута, расчёта времени в пути и просмотра актуальной информации.  


## Основной функционал  
Интерактивная карта метро в виде графа (станции — узлы, пути — рёбра)  
Построение кратчайшего маршрута между станциями (алгоритм DFS с учётом пересадок)  
Расчёт и отображение времени в пути  
Просмотр режима работы линий, стоимости проезда и новостей метрополитена  
Удобный интерфейс с перемещением по карте и навигационными кнопками  

## Приложение
#### Заглавный экран с основным графом
![map2](https://github.com/user-attachments/assets/346074ac-433a-4048-9288-2aa662a9ebe5)


#### Побочные страницы с расписанием
![map1](https://github.com/user-attachments/assets/e9d2ac90-8d36-4c13-ac24-617692cb90a5)



## Технические особенности  
Реализация на **QML** для **ОС AVROVRA**  

Визуализация линий метро с помощью **кривых Безье**  

Оптимизированный алгоритм поиска пути (поиск в глубину с учётом штрафов за пересадки)  

Парсинг данных вручную(был написан простой парсер на Python) из-за отсутствия открытого API  


## Сложности и решения  
Парсинг данных — информация извлекалась написание кода на питон из веб-страниц, так как у СПб метро нет API.  
Отрисовка рёбер — использованы кривые Безье для улучшенной визуализации.  
Алгоритм поиска пути — изначально пробовали алгоритм Дейкстры, но из-за некорректного учёта пересадок перешли на поиск в глубину (DFS) с модификациями.  


 
  Лабутин А.С. - Главный разработчик  
  Ануфриев Ю.В. - Разработчик    
  Титова А.В. - Продукт Менеджер  
  
    
(Сделали на основе шаблона приложения поэтому могут быть странные файлы template)

