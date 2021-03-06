create database qlpb;
use qlpb;
create table PHONGBAN
(
	MAPHG varchar(4) not null,
	TENPHG nvarchar(100) not null,
	TRPHG varchar(8),
	NGNC datetime,
	constraint U_PHONGBAN unique (TENPHG),
	constraint PK_PHONGBAN primary key (MAPHG)
)

create table NHANVIEN
(
	MANV varchar(8) not null,
	HONV nvarchar(50) not null,
	TENLOT nvarchar(50),
	TENNV nvarchar(50) not null,
	NGSINH datetime,
	PHAI nvarchar(5),
	DCHI nvarchar(100),
	MA_NQL varchar(8),
	PHONG varchar(4) not null,
	MLUONG real,
	constraint PK_NHANVIEN primary key (MANV)
)

alter table PHONGBAN add
constraint FK_PHONGBAN_NHANVIEN foreign key (TRPHG) references NHANVIEN(MANV)

alter table NHANVIEN add
constraint FK_NHANVIEN_PHONGBAN foreign key (PHONG) references PHONGBAN(MAPHG),
constraint FK_NHANVIEN_NHANVIEN foreign key (MA_NQL) references NHANVIEN(MANV)

create table DEAN
(
	MADA varchar(6) not null,
	TENDA nvarchar(50) not null,
	DDIEM_DA nvarchar(100),
	PHONG varchar(4) not null,
	NGBD_DK datetime,
	NGKT_DK datetime,
	constraint U_DEAN unique (TENDA),
	constraint PK_DEAN primary key (MADA),
	constraint FK_DEAN_PHONGBAN foreign key (PHONG) references PHONGBAN(MAPHG),
	constraint CHK_DEAN_NGBD_NGKT check (NGBD_DK <= NGKT_DK)
)

create table PHANCONG
(
	MANV varchar(8) not null,
	MADA varchar(6) not null,
	THOIGIAN real,
	constraint PK_PHANCONG primary key (MANV,MADA),
	constraint FK_PHANCONG_NHANVIEN foreign key (MANV) references NHANVIEN(MANV),
	constraint FK_PHANCONG_DEAN foreign key (MADA) references DEAN(MADA),
	constraint CHK_PHANCONG_THOIGIAN check (THOIGIAN>=0 and THOIGIAN<=40)
)

create table DIADIEM_PHG
(
	MAPHG varchar(4) not null,
	DIADIEM nvarchar(30),
	constraint PK_DIADIEM_PHG primary key (MAPHG,DIADIEM),
	constraint FK_DIADIEM_PHG_PHONGBAN foreign key (MAPHG) references PHONGBAN(MAPHG)
)

create table THANNHAN
(
	MANV varchar(8) not null,
	MATN varchar(6) not null,
	TENTN nvarchar(50) not null,
	PHAI nvarchar(5),
	NGSINH datetime,
	QUANHE nvarchar(30),
	constraint PK_THANNHAN primary key (MANV, MATN),
	constraint FK_THANNHAN_NHANVIEN foreign key (MANV) references NHANVIEN(MANV)
)

insert into PHONGBAN(MAPHG,TENPHG)
values('QL','Quan ly')
insert into PHONGBAN(MAPHG,TENPHG)
values('DH','Dieu hanh')
insert into PHONGBAN(MAPHG,TENPHG)
values('NC','Nghien cuu')

insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV001','Vuong','Ngoc','Quyen','1957-10-22','Nu','450 Trung Vuong, Ha Noi',NULL,'QL',3000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV002','Nguyen','Thanh','Tung','1955-01-09','Nam','731 Tran Hung Dao, Q1, TP HCM','NV001','NC',2500000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV003','Le','Thi','Nhan','1960-12-18','Nu','291 Ho Van Hue, QPN, TP HCM','NV001','DH',2500000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV004','Dinh','Ba','Tien','1968-01-09','Nam','638 Nguyen Van Cu, Q5, TP HCM','NV002','NC',2200000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV005','Bui','Thuy','Vu','1972-07-19','Nam','332 Nguyen Thai Hoc, Q1, TP HCM','NV003','DH',2200000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV006','Nguyen','Manh','Hung','1973-09-15','Nam','978 Ba Ria, Vung Tau','NV002','NC',2000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV007','Tran','Thanh','Tam','1975-07-31','Nu','543 Mai Thi Luu, Q1, TP HCM','NV002','NC',2200000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV008','Tran','Hong','Van','1976-07-04','Nu','980 Le Hong Phong, Q10, TP HCM','NV004','NC',1800000)

insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('NC','Ha Noi')
insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('NC','TP HCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('QL','TP HCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('DH','Ha Noi')
insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('DH','TP HCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM)
values('DH','Nha Trang')

insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('TH001','Tin hoc hoa 1','Ha Noi','NC','2003-02-01','2004-02-01')
insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('TH002','Tin hoc hoa 2','TP HCM','NC','2003-06-04','2004-02-01')
insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('DT001','Dao tao 1','Nha Trang','DH','2002-02-01','2006-02-01')
insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('DT002','Dao tao 2','Ha Noi','DH','2002-02-01','2006-02-01')

insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV001','TH001',30)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV001','TH002',12.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV002','TH001',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV002','TH002',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV002','DT001',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV002','DT002',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV003','TH001',37.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV004','DT001',22.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV004','DT002',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV006','DT001',30.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV007','TH001',20)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV007','TH002',10)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV008','TH001',10)


insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV003','1','Tran Minh Tien','Nam','1990-12-11','Con')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV003','2','Tran Ngoc Linh','Nu','1993-03-10','Con')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV003','3','Tran Minh Long','Nam','1957-10-10','Vo chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV001','1','Le Nhat Minh','Nam','1955-04-27','Vo chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV002','1','Le Hoai Thuong','Nu','1960-12-05','Vo chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV004','1','Le Phi Nhung','Nu','1972-12-23','Vo chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV005','1','Tran Thu Hong','Nu','1978-04-11','Vo chong')

/*
1. Thêm và bảng phân công dữ liệu sau
('NV008','DT002',12.5)
2. Thêm bảng thân nhân dòng dữ liệu sau
('NV005','2','Nguyen Manh Tam','Nam','2003-01-13','Con')
3. Cho biết thông tin các nhân viên có lương trên 250.000
4. Cho biết mã nhân viên, mã đề án có thời gian là cao nhất
5. Tính tổng thời gian phân công của từng nhân viên
6. Cho biết mã phòng ban, tên phòng ban, số lượng nhân viên. Chỉ liệt kê phòng có nhiều hơn 3 nhân viên.
7. Cho biết phòng ban cùng địa điểm với phòng có mã phòng là 'NC'
8. Cho biết thông tin về thân nhân của NV005
9. Cho biết thông tin của nhân viên cùng phòng với nhân viên NV003
10. Cho biết thông tin đề án do phòng 'Dieu hanh' quản lý

*/
--1. Thêm và bảng phân công dữ liệu sau
--('NV008','DT002',12.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV008','DT002',12.5)

--2. Thêm bảng thân nhân dòng dữ liệu sau
--('NV005','2','Nguyen Manh Tam','Nam','2003-01-13','Con')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV005','2','Nguyen Manh Tam','Nam','2003-01-13','Con')

--3. Cho biết thông tin các nhân viên có lương trên 250.000
SELECT TENNV
FROM NHANVIEN
WHERE MLUONG > 2500000

--4. Cho biết mã nhân viên, mã đề án có thời gian là cao nhất
SELECT DEAN.MADA, NHANVIEN.MANV 
FROM DEAN, NHANVIEN, PHANCONG
WHERE PHANCONG.MANV = NHANVIEN.MANV
	AND DEAN.MADA = PHANCONG.MADA
	AND THOIGIAN >=  (SELECT MAX(THOIGIAN) FROM PHANCONG)

--5. Tính tổng thời gian phân công của từng nhân viên
SELECT MANV, SUM(THOIGIAN) AS 'Tong Thoi Gian'
FROM PHANCONG
GROUP BY MANV

-- 6. Cho biết mã phòng ban, tên phòng ban, số lượng nhân viên. Chỉ liệt kê phòng có nhiều hơn 3 nhân viên.
SELECT * FROM PHONGBAN WHERE MAPHG IN (
 SELECT PHONG FROM NHANVIEN
GROUP BY PHONG
HAVING COUNT(MANV) > 3
)
--7. Cho biết phòng ban cùng địa điểm với phòng có mã phòng là 'NC'

SELECT * FROM DIADIEM_PHG WHERE DIADIEM IN (SELECT DIADIEM FROM DIADIEM_PHG WHERE MAPHG = 'NC')

--8. Cho biết thông tin về thân nhân của NV005
SELECT*
FROM THANNHAN
WHERE  MANV = 'NV005'

--9. Cho biết thông tin của nhân viên cùng phòng với nhân viên NV003
SELECT * FROM NHANVIEN WHERE PHONG = (SELECT PHONG FROM NHANVIEN WHERE MANV = 'NV003') AND MANV != 'NV003'

--10. Cho biết thông tin đề án do phòng 'Dieu hanh' quản lý
SELECT * FROM DEAN WHERE PHONG = (
SELECT MAPHG FROM PHONGBAN WHERE TENPHG = 'Dieu hanh'
)