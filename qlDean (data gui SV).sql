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

update PHONGBAN
set TRPHG='NV001',NGNC='2000-05-22'
where MAPHG='QL'
update PHONGBAN
set TRPHG='NV003',NGNC='2002-10-10'
where MAPHG='DH'
update PHONGBAN
set TRPHG='NV002',NGNC='2002-03-15'
where MAPHG='NC'

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
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV008','DT002',12.5)

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
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE)
values('NV005','2','Nguyen Manh Tam','Nam','2003-01-13','Con')
--BỔ SUNG
insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('TH003','Tin hoc hoa 3','TP HCM','DH','2002-02-01','2006-02-01')
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV008','TH003',20)

--1.	Cho biết MANV và TENNV làm việc ở phòng ‘Nghien cuu’
SELECT MANV, TENNV
FROM NHANVIEN, PHONGBAN
WHERE  TENPHG = 'Nghien cuu'

--2.	Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ tham gia
SELECT  MANV, COUNT(*)AS SL_DA, SUM(THOIGIAN)AS TONG_TG
FROM PHANCONG
GROUP BY  MANV
SELECT  HONV, TENNV, COUNT(*)AS SL_DA, SUM(THOIGIAN)AS TONG_TG
FROM PHANCONG, NHANVIEN
WHERE PHANCONG.MANV = NHANVIEN.MANV
GROUP BY  HONV, TENNV

--3.	Cho biết số lượng nhân viên của từng phòng ban
SELECT TENPHG, COUNT(*) AS SL_NV
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHONG = PHONGBAN.MAPHG
GROUP BY TENPHG
--4.	Cho biết những nhân viên tham gia từ 2 đề án trở lên
SELECT MANV
FROM PHANCONG
GROUP BY MANV
HAVING COUNT(*)>=2
--5.	Cho biết những phòng ban (TENPHG) có lương trung bình của các nhân viên lớn lơn 20000
--6.	Tìm những phòng ban có lương trung bình cao nhất
SELECT TENPHG, AVG(MLUONG)AS LUONG_TB
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHONG = PHONGBAN.MAPHG
GROUP BY TENPHG
having AVG(MLUONG) >= all(SELECT AVG(MLUONG)
						FROM NHANVIEN
						GROUP BY NHANVIEN.PHONG)
--7.	Với những đề án ở ‘Ha Noi’, cho biết mã đề án, mã phòng ban chủ trì đề án, họ tên trưởng phòng cùng với ngày sinh và địa chỉ của người ấy
select	DEAN.MADA, PHONGBAN.MAPHG, 
		NHANVIEN.HONV, NHANVIEN.TENLOT,	NHANVIEN.TENNV,
		NHANVIEN.DCHI, NHANVIEN.NGSINH
from	DEAN, PHONGBAN, NHANVIEN
where	DDIEM_DA = 'Ha Noi'
	and	DEAN.PHONG = PHONGBAN.MAPHG
	and PHONGBAN.TRPHG = NHANVIEN.MANV 
--8.	Tìm họ tên của nhân viên phòng số “nghiên cứu” có tham gia vào đề án “Tin hoc hoa 3” với số giờ làm việc trên 10 giờ
--9.	Tìm họ tên của từng nhân viên và người phụ trách trực tiếp nhân viên đó
select N1.HONV, N1.TENLOT, N1.TENNV, N1.MA_NQL, N2.HONV AS HO_NQL, N2.TENLOT AS TENLOT_NQL, N2.TENNV AS TEN_NQL, N2.MANV 
from NHANVIEN N1, NHANVIEN N2 
where (N1.MA_NQL = N2.MANV)

select NV1.HONV + ' ' + NV1.TENLOT + ' ' + NV1.TENNV as 'Ho ten NV', NV2.HONV + ' ' + NV2.TENLOT + ' ' + NV2.TENNV as 'Ho ten NGQL'
from NHANVIEN NV1
left join NHANVIEN NV2 ON NV1.MA_NQL = NV2.MANV
--10.	Tìm họ tên của những nhân viên được “Nguyen Thanh Tung” phụ trách trực tiếp
--11.	Cho biết các mã đề án có
--a.	Nhân viên với họ là ‘Nguyen’ tham gia hoặc,
--b.	Trưởng phòng chủ trì đề án đó với họ là ‘Nguyen’
select  TENDA
FROM DEAN
WHERE MADA IN 
		(SELECT MADA
		FROM NHANVIEN NV, PHANCONG PC
		WHERE NV.MANV = PC.MANV AND NV.HONV='Nguyen')
OR MADA IN
		(SELECT MADA
		FROM NHANVIEN, PHONGBAN DEAN
		WHERE MANV=TRPHG AND MAPHG=PHONG
		AND HONV='Nguyen')
--12.	Tìm nhân viên có người thân cùng tên và cùng giới tính

SELECT *
FROM NHANVIEN NV, THANNHAN TN
WHERE NV.MANV=TN.MANV
AND NV.TENNV=TN.TENTN AND NV.PHAI=TN.PHAI
AND TENTN LIKE '%+TENNV' 

--13.	Tìm những nhân viên không có thân nhân nào
SELECT *
FROM NHANVIEN NV
WHERE NOT EXISTS(
				SELECT*
				FROM THANNHAN TN
				WHERE NV.MANV = TN.MANV)
--14.	Tìm những nhân viên có lương lớn hơn lương của ít nhất một nhân viên phòng 4
SELECT*
FROM NHANVIEN
WHERE MLUONG > ANY(
			SELECT *
			FROM NHANVIEN, PHONGBAN
			WHERE TENPHG = 'Nghien cuu')
SELECT NV1.*
FROM NHANVIEN NV1, NHANVIEN NV2, PHONGBAN 
WHERE NV1.MLUONG > NV2.MLUONG AND NV2.TENPHG = 'Nghien cuu'
--15.	Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 4
SELECT*
FROM NHANVIEN
WHERE MLUONG > ALL(
		SELECT MLUONG
		FROM NHANVIEN NV, PHONGBAN PB
		WHERE PHONG = 'Nghien cuu')
--16.	Tìm những trưởng phòng có tối thiểu một thân nhân
SELECT*
FROM NHANVIEN
WHERE MANV IN(SELECT MANV FROM THANNHAN)
AND MANV IN(SELECT TRPHG FROM PHONGBAN)


