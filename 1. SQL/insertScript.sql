create table dir_container_types
(
    id    int primary key not null identity (1,1),
    name  varchar(50)     not null,
    mnemo varchar(50)     not null
)

insert into dir_container_types(name, mnemo)
values (N'Красный', 'krasniy'),
       (N'Желтый', 'zheltiy'),
       (N'Зеленый', 'zeleniy')

create table re_containers
(
    id              int primary key not null identity (1,1),
    number          int             not null,
    type_id         int             not null,
    length          float           not null,
    width           float           not null,
    height          float           not null,
    weight          float           not null,
    is_empty        bit             not null,
    date_of_receipt datetime        null,
    foreign key (type_id) references dir_container_types (id)
)

insert into re_containers(number, type_id, length, width, height, weight, is_empty, date_of_receipt)
values (12, 1, 14.6, 7.2, 9.0, 97.3, 0, '2014-05-13T10:20:10'),
       (345, 2, 140.2, 78.2, 9.0, 970.3, 0, '2024-06-03T11:15:10'),
       (677, 2, 10.3, 4.2, 9.0, 0, 1, '2017-07-23T13:35:10'),
       (654, 1, 123.2, 1.2, 9.0, 100.3, 0, '2010-06-30T18:45:10'),
       (342, 3, 76.1, 0.2, 9.0, 55.3, 0, '2011-09-10T15:55:10'),
       (1365, 3, 98.9, 7.2, 9.0, 52.3, 0, '2012-01-11T14:16:10'),
       (9687, 2, 12.7, 2.2, 9.0, 0, 1, '2013-02-12T13:28:10'),
       (4385, 3, 99.4, 65.2, 9.0, 123.3, 0, '2010-03-13T12:26:10'),
       (3487, 2, 13.2, 6.7, 9.0, 56.3, 0, '2016-06-12T11:45:10'),
       (567, 1, 19.7, 7.2, 9.0, 0, 1, '2009-03-09T10:55:10')

create table dir_operation_types
(
    id    int primary key not null identity (1,1),
    name  varchar(50)     not null,
    mnemo varchar(50)     not null
)

insert into dir_operation_types(name, mnemo)
values (N'Ввоз', 'vvoz'),
       (N'Вывоз', 'vivoz')

create table re_operations
(
    id                int primary key not null identity (1,1),
    container_id      int             not null,
    date_start        datetime        not null,
    date_end          datetime        null,
    type_id           int             not null,
    operator_fullname varchar(50)     not null,
    inspection_place  varchar(50)     not null,
    foreign key (type_id) references dir_operation_types (id),
    foreign key (container_id) references re_containers (id)
)

insert into re_operations(container_id, date_start, date_end, type_id, operator_fullname, inspection_place)
values (1, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Мельникова Каролина Андреевна', N'Москва'),
       (1, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Богданов Владислав Фёдорович', N'Киров'),
       (2, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Панов Илья Ярославович', N'Казань'),
       (3, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Герасимова Александра Владимировна', N'Крым'),
       (2, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Панов Илья Ярославович', N'Краснодар'),
       (3, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Богданов Владислав Фёдорович', N'Гулькевичи'),
       (4, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Мельникова Каролина Андреевна', N'Абинск'),
       (5, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Соколов Степан Данилович', N'Санкт-петербург'),
       (6, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Герасимова Александра Владимировна', N'Красноярск'),
       (10, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Панов Илья Ярославович', N'Уфа'),
       (7, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Соколов Степан Данилович', N'Магнитогорск'),
       (8, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 2, N'Мельникова Каролина Андреевна', N'Крым'),
       (9, '2013-02-10T13:28:10', '2013-02-12T13:28:10', 1, N'Герасимова Александра Владимировна', N'Краснодар')