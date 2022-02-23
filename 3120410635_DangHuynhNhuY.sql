drop database qldean;
create database qldean;
use qldean;

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
values('NV001','Vuong','Ngoc','Minh','1957-10-22','Nu','450 Trung Vuong, Ha Noi',NULL,'QL',15000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV002','Nguyen','Thanh','Tung','1955-01-09','Nam','731 Tran Hung Dao, Q1, TP HCM',NULL,'NC',17000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV003','Le','Thi','Nhan','1960-12-18','Nu','291 Ho Van Hue, QPN, TP HCM',NULL,'DH',16000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV004','Dinh','Ba','Tien','1968-01-09','Nam','638 Nguyen Van Cu, Q5, TP HCM','NV001','QL',10000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV005','Bui','Thuy','Vu','1972-07-19','Nam','332 Nguyen Thai Hoc, Q1, TP HCM','NV001','QL',5000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV006','Nguyen','Manh','Hung','1973-09-15','Nam','978 Ba Ria, Vung Tau','NV002','NC',9000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV007','Tran','Thanh','Tam','1975-07-31','Nu','543 Mai Thi Luu, Q1, TP HCM','NV002','NC',5000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV008','Tran','Hong','Van','1976-07-04','Nu','980 Le Hong Phong, Q10, TP HCM','NV003','DH',9000000)

insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV009','Mai','Hanh','Phuc','1976-04-17','Nu','980 Hau Giang, Q6, TP HCM','NV003','DH',7000000)
insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,PHAI,DCHI,MA_NQL,PHONG,MLUONG)
values('NV010','Nguyen','Manh','Cuong','1975-08-27','Nam','20 Hung Vuong, Q6, TP HCM','NV003','DH',5000000)


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
insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG,NGBD_DK,NGKT_DK)
values('TH003','Tin hoc hoa 3','Ha Noi','NC','2003-09-01','2004-09-01')

insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV001','TH001',30)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV001','TH002',12.5)
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV001','TH003',15)
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
insert into PHANCONG(MANV,MADA,THOIGIAN)
values('NV008','TH003',20)

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



--1. Cho biết đề án có tất cả nhân viên tham gia

SELECT PC.MADA, COUNT(PC.MANV) AS 'TONG NHAN VIEN'  FROM PHANCONG PC
GROUP BY PC.MADA


--2. Cho biết mã nhân viên, tên nhân viên, mã đề án, tên đề án nhân viên đó tham gia (nếu không có đề án ghi NULL)
SELECT NV.MANV, NV.TENNV,DA.MADA, DA.TENDA FROM PHANCONG PC
JOIN DEAN DA ON PC.MADA = DA.MADA
JOIN NHANVIEN NV ON PC.MANV = NV.MANV


--3. Cho biết mã nhân viên, trung bình giờ được phân công. Xếp giảm dần theo TB giờ.
SELECT PC.MANV, AVG(PC.THOIGIAN) AS 'TRUNG BINH GIO' FROM PHANCONG PC
GROUP BY PC.MANV
ORDER BY AVG(PC.THOIGIAN) DESC

--4. Cho biết các mã đề án có nhân viên với họ là ‘Nguyen’ tham gia.
select  MADA
FROM DEAN
WHERE MADA IN 
		(SELECT MADA
		FROM NHANVIEN NV, PHANCONG PC
		WHERE NV.MANV = PC.MANV AND NV.HONV='Nguyen')
--5. Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 'dieu hanh'
SELECT*
FROM NHANVIEN
WHERE MLUONG > ALL(
		SELECT MLUONG
		FROM NHANVIEN NV, PHONGBAN PB
		WHERE PHONG = 'dieu hanh')
--6. Tìm nhân viên có người thân cùng tên nhưng khác giới tính



SELECT *
FROM NHANVIEN NV, THANNHAN TN
WHERE  
NV.PHAI !=TN.PHAI
AND NV.MANV = TN.MANV
AND TN.TENTN LIKE '% ' + NV.TENNV 


--7. Cho biết MANV, TENNV, MLUONG của những nhân viên có lương bằng 2 mức thấp nhất của công ty
--(ví dụ: những người có lương 5tr, 7tr)

SELECT * FROM NHANVIEN NV
WHERE NV.MLUONG IN (
	SELECT DISTINCT TOP(2)  NV1.MLUONG FROM NHANVIEN NV1 ORDER BY NV1.MLUONG ASC
)



--8. Cho biết đề án không có nhân viên tham gia
SELECT * FROM DEAN DA
WHERE DA.MADA NOT IN (
SELECT PC.MADA FROM PHANCONG PC 
)

--9. Cho biết thông tin của nhân viên phòng 'Quan ly'

SELECT *
FROM NHANVIEN, PHONGBAN
WHERE  TENPHG = 'Quan ly'
--10. Cho biết nhân viên không có người thân
SELECT *
FROM NHANVIEN NV
WHERE NOT EXISTS(
				SELECT*
				FROM THANNHAN TN
				WHERE NV.MANV = TN.MANV)


--Lưu ý: sinh viên làm câu hỏi nào, ghi lại câu hỏi đó trước bài làm, câu nào không ghi lại sẽ không được chấm
--