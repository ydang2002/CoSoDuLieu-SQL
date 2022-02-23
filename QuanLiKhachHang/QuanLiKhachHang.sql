create database QuanLiKhachHang
DROP database  QuanLiKhachHang
--use QuanLiKhachHang
create table  KHACHHANG
(
	MAKH NCHAR(4) NOT NULL primary key,
	HOTEN NCHAR(100),
	DCHI  NCHAR(100),
	SODT NCHAR(20),
	NGSINH SMALLDATETIME

)
create table SANPHAM
(
	MASP NCHAR(4) NOT NULL PRIMARY KEY,
	TENSP NCHAR(40),
	DVT NCHAR(20),
	NUOCSX NCHAR(40),
	GIA MONEY,
)

CREATE TABLE HOADON
(	
	SOHD INT NOT NULL PRIMARY KEY,
	NGHD NCHAR(4),
	MAKH NCHAR(4),
	TRIGIA MONEY,
)
ALTER TABLE HOADON ALTER COLUMN NGHD SMALLDATETIME
CREATE TABLE CTHD
(
	SOHD INT NOT NULL,
	MASP NCHAR(4) NOT NULL,
	SL   INT,
	primary key (SOHD,MASP)
)
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)

insert into KHACHHANG values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','10/12/1960')
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974')
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','06/12/1980')
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965')
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','03/09/1950')
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','12/31/1981')
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971')
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','01/10/1971')
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979')
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983')


insert into sanpham values('BC01','But chi','cay','Singapore',30000)
insert into sanpham values('BC02','But chi','cay','Singapore',50000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',35000)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',50000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',70000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',200000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',10000)
insert into sanpham values('ST09','But long','cay','Viet Nam',50000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',70000)

insert into hoadon values(1001,'03/7/2006','KH01',320000)
insert into hoadon values(1002,'12/08/2006','KH01',840000)
insert into hoadon values(1003,'03/08/2006','KH02',100000)
insert into hoadon values(1004,'01/09/2006','KH02',180000)
insert into hoadon values(1005,'09/10/2006','KH01',3800000)
insert into hoadon values(1006,'12/10/2006','KH01',2430000)
insert into hoadon values(1007,'08/10/2006','KH03',510000)
insert into hoadon values(1008,'08/10/2006','KH01',440000)
insert into hoadon values(1009,'08/10/2006','KH03',200000)
insert into hoadon values(1010,'01/11/2006','KH01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04',250000)
insert into hoadon values(1012,'03/11/2006','KH05',21000)
insert into hoadon values(1013,'12/12/2006','KH06',5000)
insert into hoadon values(1014,'01/12/2006','KH03',3150000)
insert into hoadon values(1015,'01/01/2007','KH06',910000)
insert into hoadon values(1016,'01/01/2007','KH07',12500)
insert into hoadon values(1017,'02/01/2007','KH08',35000)
insert into hoadon values(1018,'11/01/2007','KH08',330000)
insert into hoadon values(1019,'11/01/2007','KH01',30000)
insert into hoadon values(1020,'11/01/2007','KH09',70000)
insert into hoadon values(1021,'11/01/2007','KH10',67500)
insert into hoadon values(1022,'11/01/2007',Null,7000)
insert into hoadon values(1023,'11/01/2007',Null,330000)


insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)


-- CÂU 3Tìm khách hàng (MAKH, HOTEN) có tr? giá trung bình c?a các hóa ??n ?ã mua hàng là cao nh?t.
SELECT TOP 1  HOADON.MAKH, HOTEN
FROM HOADON, KHACHHANG 
WHERE HOADON.MAKH = KHACHHANG.MAKH
GROUP BY HOADON.MAKH, KHACHHANG.HOTEN
ORDER BY AVG(HOADON.TRIGIA) DESC
--CÂU 4 In ra danh sách các khách hàng (MAKH, HOTEN) ch?a mua b?t k? hàng hóa nào c?a n??c s?n xu?t là Trung Qu?c.
SELECT MASP
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc' AND MASP
					NOT IN(SELECT MASP
							FROM CTHD)

/*SELECT MAKH
	FROM KHACHHANG, SANPHAM
	WHERE KHACHHANG.MAKH = SANPHAM.*/

SELECT MAKH, HOTEN
	FROM KHACHHANG, SANPHAM
	WHERE  MASP IN
	(
		SELECT MASP,TENSP
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc' AND MASP
					NOT IN(SELECT MASP
							FROM CTHD)
	)
GROUP BY MAKH, HOTEN
SELECT MASP
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc'SELECT MASP
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc'

SELECT MASP
	FROM SANPHAM
	WHERE MASP = (SELECT MASP
	FROM SANPHAM
	WHERE NUOCSX = 'Trung Quoc' AND MASP
					NOT IN(SELECT MASP
							FROM CTHD))
SELECT *
	FROM CTHD, SANPHAM
	WHERE SANPHAM.MASP=CTHD.MASP AND CTHD.MASP IN (SELECT MASP
									FROM SANPHAM
									WHERE NUOCSX = 'Trung Quoc')
SELECT *
	FROM HOADON HD, CTHD
	WHERE HD.SOHD = CTHD.SOHD AND NOT EXISTS (SELECT CTHD.SOHD
	FROM CTHD, SANPHAM
	WHERE SANPHAM.MASP=CTHD.MASP AND CTHD.MASP IN (SELECT MASP
									FROM SANPHAM
									WHERE NUOCSX = 'Trung Quoc'))


GO
--CÂU 4
SELECT * FROM KHACHHANG
WHERE MAKH NOT IN (

SELECT HD.MAKH
FROM CTHD CT 
JOIN SANPHAM SP ON SP.MASP = CT.MASP
JOIN HOADON HD ON HD.SOHD = CT.SOHD
WHERE SP.NUOCSX = 'Trung Quoc'
)

SELECT *, SL*GIA AS'THANHTIEN'
FROM  CTHD CT   
JOIN SANPHAM SP ON SP.MASP = CT.MASP
JOIN HOADON HD ON HD.SOHD = CT.SOHD
WHERE  HD.MAKH = 'KH01' AND SP.NUOCSX != 'Viet Nam'

--CÂU 5
SELECT *, SL*GIA AS'THANHTIEN'
FROM SANPHAM SP, KHACHHANG KH, HOADON HD, CTHD CT
WHERE KH.MAKH = HD.MAKH AND HD.SOHD=CT.SOHD AND CT.MASP=SP.MASP AND KH.MAKH = 'KH01' AND SP.NUOCSX != 'Viet Nam'

--CÂU 6
SELECT TOP 5  HOADON.MAKH, HOTEN, SUM(HOADON.TRIGIA)
FROM HOADON, KHACHHANG 
WHERE HOADON.MAKH = KHACHHANG.MAKH
GROUP BY HOADON.MAKH, KHACHHANG.HOTEN
ORDER BY SUM(HOADON.TRIGIA) DESC