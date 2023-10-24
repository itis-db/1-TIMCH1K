
insert into activitytype(activitytypeid, name, sysname)
values
    (10, 'Программа', 'ProgramVariant'),
    (20, 'Подпрограмма', 'SubProgramVariant'),
    (30, 'Территория', 'AreaVariant'),
    (40, 'Проект', 'ProjectVariant'),
    (50, 'Контракт', 'ContractVariant');


insert into activity(activityid, activitytypeid, code, name, parentid)
values
    (100, 10, 'X', 'Программа X', null),
    (200, 20, 'X1', 'Подпрограмма X1', 100),
    (300, 30, 'X1.1', 'Территория X1.1', 200),
    (400, 40, 'X1.1.1', 'Проект X1.1.1', 300),
    (500, 50, 'X1.1.1.1', 'Контракт X1.1.1.1', 400),
    (600, 10, 'Y', 'Программа Y', null),
    (700, 20, 'Y1', 'Подпрограмма Y1', 600),
    (800, 30, 'Y1.1', 'Территория Y1.1', 700),
    (900, 40, 'Y1.1.1', 'Проект Y1.1.1', 800),
    (1000, 50, 'Y1.1.1.1', 'Контракт Y1.1.1.1', 900);

insert into program(programid, indexnum, yearstart, yearfinish)
values
    (100, 0, 2020, 2030),
    (600, 1, 2030, 2040);

insert into subprogram(subprogramid, indexnum)
values
    (200, 0),
    (700, 1);

insert into area(areaid, name)
values
    (300, 'Регион Z'),
    (800, 'Регион W');

INSERT INTO contract(contractid, areaid) VALUES (500, 300);


