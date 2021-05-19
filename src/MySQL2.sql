create database MySQL2;
use MySQL2;
create table diemdendulich
(
    id           int not null auto_increment primary key,
    tendiemden   nvarchar(100),
    giatrungbinh double,
    thanhpho_id  int,
    foreign key (thanhpho_id) references thanhpho (id)

);
create table khachhangdattuor
(
    id          int not null auto_increment primary key,
    name        nvarchar(100),
    socancuoc   int,
    namsinh     int,
    thanhpho_id int,
    foreign key (thanhpho_id) references thanhpho (id)
);
create table thanhpho
(
    id          int not null auto_increment primary key,
    tenthanhpho nvarchar(100)
);
create table loaituor
(
    id      int not null auto_increment primary key,
    maloai  int,
    tenloai nvarchar(100)
);
create table tuor
(
    id               int not null auto_increment primary key,
    matuor           int,
    loaituor_id      int,
    id_diemdendulich int,
    idngaybatdau     date,
    idngayketthuc    date,
    foreign key (loaituor_id) references loaituor (id),
    foreign key (id_diemdendulich) references diemdendulich (id)


);

insert into diemdendulich(id, tendiemden, giatrungbinh, thanhpho_id) value
    (1, 'LangBac', 3000000, 1),
    (2, 'DoSon', 2000000, 2),
    (3, 'MyKhe', 5000000, 3),
    (4, 'DinhDocLap', 3000000, 4),
    (5, 'VinPear', 4000000, 5);
insert into khachhangdattuor(id, name, socancuoc, namsinh, thanhpho_id) value
    (1, 'Nguyen Van A', 123123123, 1990, 1),
    (2, 'Nguyen Van B', 123123124, 1991, 2),
    (3, 'Nguyen Van C', 123123125, 1992, 3),
    (4, 'Nguyen Van D', 123123126, 1993, 4),
    (5, 'Nguyen Van E', 123123127, 1994, 1),
    (6, 'Nguyen Van F', 123123128, 1995, 2),
    (7, 'Nguyen Van G', 123123129, 1991, 3),
    (8, 'Nguyen Van H', 1231231210, 1992, 4),
    (9, 'Nguyen Van I', 1231231211, 1993, 5),
    (10, 'Nguyen Van K', 123123112, 1994, 1);
insert into thanhpho(id, tenthanhpho) value
    (1, 'HaNoi'),
    (2, 'HaiPhong'),
    (3, 'DaNang'),
    (4, 'Saigon'),
    (5, 'NhaTrang');
insert into tuor(id, matuor, loaituor_id, id_diemdendulich, idngaybatdau, idngayketthuc) value
    (1, 1, 1, 1, '2020-03-18', '2020-03-20'),
    (2, 1, 1, 2, '2020-03-18', '2020-03-20'),
    (3, 2, 2, 1, '2020-03-18', '2020-03-20'),
    (4, 2, 2, 2, '2020-04-18', '2020-04-20'),
    (5, 2, 2, 3, '2020-04-18', '2020-04-20'),
    (6, 3, 3, 4, '2020-04-18', '2020-04-20'),
    (7, 3, 3, 5, '2020-03-18', '2020-03-20'),
    (8, 3, 3, 3, '2020-03-18', '2020-03-20'),
    (9, 4, 4, 4, '2020-04-18', '2020-04-20'),
    (10, 4, 4, 4, '2020-04-18', '2020-04-20'),
    (11, 4, 4, 5, '2020-03-18', '2020-03-20'),
    (12, 5, 5, 3, '2020-04-18', '2020-04-20'),
    (13, 5, 5, 1, '2020-04-18', '2020-04-20'),
    (14, 5, 5, 2, '2020-03-18', '2020-03-20'),
    (15, 4, 4, 3, '2020-03-18', '2020-03-20');
insert into loaituor(id, maloai, tenloai) value
    (1, 1, 'nganngay'),
    (2, 2, 'nganngay'),
    (3, 3, 'daingay'),
    (4, 4, 'daingay'),
    (5, 5, 'nganngay');
insert into hoadondattuor(id, tuor_id, khachhang_id, trangthai) value
    (1, 1, 1, 'dathanhtoan'),
    (2, 2, 2, 'dathanhtoan'),
    (3, 2, 3, 'dathanhtoan'),
    (4, 3, 4, 'dathanhtoan'),
    (5, 3, 5, 'chuathanhtoan'),
    (6, 1, 6, 'chuathanhtoan'),
    (7, 1, 7, 'dathanhtoan'),
    (8, 3, 8, 'dathanhtoan'),
    (9, 3, 9, 'chuathanhtoan'),
    (10, 4, 10, 'dathanhtoan');
select thanhpho.tenthanhpho, count(thanhpho.id)
from thanhpho
         join diemdendulich d on thanhpho.id = d.thanhpho_id
         join tuor t on d.id = t.id_diemdendulich
group by thanhpho.tenthanhpho;

select count(tuor.idngaybatdau), month(tuor.idngaybatdau) as thang from tuor
group by month(tuor.idngaybatdau)
having thang ='03';



select count(tuor.idngayketthuc) from tuor
where month(tuor.idngayketthuc) = '04';

