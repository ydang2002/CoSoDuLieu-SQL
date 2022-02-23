--tạo csddl
create database QLSV_NEW
--dùng database
use QLSV_NEW

create table  KHOA
(
	MAKHOA nchar(4) NOT NULL primary key,
	TENKHOA nchar(100),
	NAMTHANHLAP int
)
create table SVIEN
(
	MASV nchar(8) NOT NULL primary key,
	TENSV nchar(100) NOT NULL,
	NAM int,
	MAKHOA nchar(4) NOT NULL foreign key REFERENCES KHOA(MAKHOA)
)
create table MHOC
(
	MAMH nchar(6) NOT NULL primary key,
	TENMH nchar(100) NOT NULL,
	TINCHI int,
	MAKHOA nchar(4) NOT NULL foreign key REFERENCES KHOA(MAKHOA)
)
create table DKIEN
(
	MAMH nchar(6) NOT NULL,
	MAMH_TRUOC nchar(6) NOT NULL,
	primary key (MAMH,MAMH_TRUOC)
)
create table HPHAN
(
	MAHP int  NOT NULL primary key,
	MAMH nchar(6) NOT NULL,
	HOCKY int,
	NAM int,
	GV nchar(50)
)
create table KQUA
(
	MASV nchar(8) NOT NULL,
	MAHP int NOT NULL,
	primary key (MASV,MAHP),
	DIEM float
)
--nhập dữ liệu table Khoa
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('CNTT', 'Cong nghe thong tin', 1980)
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('HOA', 'Hoa', 1980)
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('SINH', 'Sinh', 1981)
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('TOAN', 'Toan', 1976)
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('VLY', 'Vat Ly', 1982)
--nhap dữ liệu table SVIEN
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K25.0005', 'Ly Thanh', 3, 'HOA')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K26.0008', 'Phan Anh Khanh', 2, 'TOAN')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0017', 'Nguyen Cong Phu', 1, 'TOAN')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0018', 'Han Quoc Viet', 2, 'VLY')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0019', 'Tran Minh Thanh', 2, 'CNTT')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0020', 'Nguyen Thanh Tuan', 3, 'CNTT')
--nhập dữ liệu table MHOC
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('HH0001', 'Hoa dai cuong A1', 5, 'HOA')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('HH0002', 'Hoa dai cuong A2', 5, 'HOA')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('TH0001', 'Tin hoc dai cuong A1', 4, 'CNTT')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('TH0002', 'Cau truc du lieu', 4, 'CNTT')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('TH0003', 'Co so du lieu', 5, 'CNTT')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('TH0004', 'Lap trinh web', 5, 'TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('TO0001', 'Toan roi rac', 3, 'TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('VL0001', 'Vat ly dai cuong A1', 5, 'VLY')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values('VL0002', 'Vt ly dai cuong A2', 4, 'VLY')
--nhap dữ liệu HPHAN
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(1,'TH0001', 1, 1996, 'N.D.Lam')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(2, 'VL0001', 1, 1966, 'T.N.Dung')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(3, 'TH0002', 1, 1997, 'H.Tuan')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(4, 'TH0001', 1,1997, 'N.D.Lam')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(5, 'TH0003', 2, 1997, 'N.C.Phu')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(6, 'HH0001', 1, 1996, 'L.T.Phuc')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(7, 'TH0002', 1, 1998, 'P.T.Nhu')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(8, 'TO0001', 1, 1996, 'N.C.Phu')
--nhap dữ lieu table DKIEN
insert into DKIEN(MAMH,MAMH_TRUOC) values('HH0002', 'HH0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values('TH0002', 'TH0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values('TH0003', 'TH0002')
insert into DKIEN(MAMH,MAMH_TRUOC) values('TH0003', 'TO0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values('TH0004', 'TH0003')
insert into DKIEN(MAMH,MAMH_TRUOC) values('VL0002', 'VL0001')
--NHAP DỮ LIỆU TABLE KQUA
insert into KQUA(MASV,MAHP,DIEM) values('K25.0005', '6', 6)
insert into KQUA(MASV,MAHP,DIEM) values('K26.0008', '1', 10)
insert into KQUA(MASV,MAHP,DIEM) values('K26.0008', '3', 9)
insert into KQUA(MASV,MAHP,DIEM) values('K27.0017', '4', 9.5)
insert into KQUA(MASV,MAHP,DIEM) values('K27.0018', '2',8)

--thuc hanh 3 
ALTER TABLE KHOA ADD DIADIEM NCHAR(5)
ALTER TABLE KHOA ALTER COLUMN DIADIEM NCHAR(10) --HIỆU CHỈNH KIỂU DỮ LIỆU
--XÓA CÔT DIADIEM
ALTER TABLE KHOA DROP COLUMN DIADIEM
UPDATE MHOC
SET MAKHOA ='CNTT'
WHERE MAMH='TH004'
--
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values(9,'TH0003', 1, 1996, 'N.V.Minh')
insert into KQUA(MASV,MAHP,DIEM) values('K27.0017', '9', 8)
insert into KQUA(MASV,MAHP,DIEM) values('K26.0008', '9', 3)
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('NN', 'ngoai ngu', 2000)
insert into KQUA(MASV,MAHP,DIEM) values('K27.0017', '1', 0)
insert into KQUA(MASV,MAHP,DIEM) values('K26.0008', '6', 0)
DELETE
FROM KQUA
WHERE DIEM=0
--2.2 Select, where
--7. Liệt kê tên các sinh viên thuộc khoa “Toán” (MAKHOA = “TOAN”)
SELECT TENSV 
FROM SVIEN
WHERE MAKHOA = 'CNTT'
--8. Liệt kê tên các môn học và số tín chỉ
SELECT TENMH,TINCHI
FROM MHOC
--9. Liệt kê kết quả học tập của sinh viên có mã số ‘K26.008’ (MASV)
SELECT*
FROM KQUA
WHERE MASV = 'K26.0008'
--10. Liệt kê tên sinh viên và mã môn học mà sinh viên đó đăng ký học với kết quả cuối khoá trên 7 điểm
SELECT MAMH,TENSV
FROM KQUA,SVIEN,HPHAN
WHERE  SVIEN.MASV = KQUA.MASV 
	AND KQUA.MAHP = HPHAN.MAHP
	AND KQUA.DIEM>7
--11. Liệt kê tên sinh viên thuộc về khoa có phụ trách môn học "Toán rời rạc
SELECT TENSV
FROM MHOC, SVIEN 
WHERE MHOC.TENMH = 'Toan roi rac'
--12. Liệt kê tên sinh viên, tên môn học, và điểm số của sinh viên ở học kì 1, năm 1996
SELECT TENSV,TENMH,DIEM
FROM MHOC,KQUA, SVIEN,HPHAN
WHERE SVIEN.MASV = KQUA.MASV
	AND KQUA.MAHP = HPHAN.MAHP
	AND HPHAN.MAMH = MHOC.MAMH
	AND HPHAN.HOCKY = 1 
	AND HPHAN.NAM = 1996
--13. Liệt kê tên các môn học phải học ngay trước môn "Cơ sở dữ liệu"
SELECT MH2.TENMH
FROM  MHOC MH1, MHOC MH2, DKIEN
WHERE MH1.MAMH = DKIEN.MAMH AND DKIEN.MAMH_TRUOC = MH2.MAMH AND MH1.TENMH='Co so du lieu' 
--SELECT TENMH FROM MHOC WHERE MAMH  IN
--	(SELECT MAMH_TRUOC FROM DKIEN WHERE MAMH = 'TH0003')	 
--14. Liệt kê tên các môn học phải học ngay sau môn "Cơ sở dữ liệu"
--SELECT TENMH
--FROM DKIEN, MHOC
--WHERE MHOC.MAMH = DKIEN.MAMH
--	 AND DKIEN.MAMH_TRUOC = 'TH0003'
SELECT MH2.TENMH
FROM  MHOC MH1, MHOC MH2, DKIEN
WHERE MH1.MAMH = DKIEN.MAMH_TRUOC AND DKIEN.MAMH = MH2.MAMH AND MH1.TENMH='Co so du lieu'

--15. Liệt kê tên môn học trước, tên môn học của môn học có số tính chỉ nhỏ hơn bằng 4
--Tìm mã môn học 
SELECT TENMH FROM MHOC WHERE MAMH  IN
(SELECT MAMH_TRUOC FROM DKIEN WHERE MAMH IN
(SELECT MAMH FROM MHOC WHERE MHOC.TINCHI <= 4))
--16. *Liệt kê danh sách sinh viên, điểm của môn “Cơ sở dữ liệu” ở học kì 1, năm học 1996 được sắp theo thứ tự điểm giảm 
--dần, trùng điểm số thì sắp theo tên tăng dần.
SELECT TENSV, DIEM
FROM KQUA, HPHAN, MHOC, SVIEN
WHERE KQUA.MAHP = HPHAN.MAHP
	AND MHOC.MAMH = HPHAN.MAMH
	AND MHOC.TENMH = 'co so du lieu'
	AND HPHAN.HOCKY = 1
	AND HPHAN.NAM = 1996
	ORDER BY DIEM DESC, TENSV ASC
	--DESC GIẢM DẦN
	--ASC TĂNG DẦN
-------------------------------------------
--SELECT MAMH_TRUOC FROM DKIEN WHERE MAMH = 'TH0003'
--SELECT MAMH FROM MHOC WHERE MHOC.TINCHI <= 4
--SELECT MAMH_TRUOC FROM DKIEN WHERE MAMH IN
--(SELECT MAMH FROM MHOC WHERE MHOC.TINCHI <= 4)
------------------------------------------------
--2.3 Các hàm tính toán
--Điểm trung bình toàn sinh viên
SELECT AVG(DIEM)
FROM KQUA
--điểm trung bình mỗi sinh viên: MSV, TENSV, DIEMTB 
select KQUA.MASV, SVIEN.TENSV, AVG(DIEM)
from KQUA, SVIEN
where KQUA.MASV = SVIEN.MASV
group by KQUA.MASV, SVIEN.TENSV
--17. Liệt kê mã học phần và số lượng sinh viên đăng ký theo từng học phần.
SELECT HPHAN.MAHP, COUNT(KQUA.MASV)
FROM SVIEN, MHOC, HPHAN, KQUA
WHERE SVIEN.MASV = KQUA.MASV
	AND KQUA.MAHP = HPHAN.MAHP
	AND MHOC.MAMH = HPHAN.MAMH
GROUP BY HPHAN.MAHP
--18. Liệt kê tên sinh viên và điểm trung bình của sinh viên đó trong từng học kỳ của từng niên học.

SELECT SVIEN.TENSV, HPHAN.HOCKY, HPHAN.NAM, AVG(DIEM)
FROM SVIEN, HPHAN, KQUA
WHERE SVIEN.MASV = KQUA.MASV
GROUP BY SVIEN.TENSV, KQUA.MASV,HPHAN.HOCKY, HPHAN.NAM
--19. Liệt kê tên sinh viên đạt điểm cao nhất.
SELECT TENSV, DIEM
FROM KQUA, SVIEN
WHERE KQUA.MASV = SVIEN.MASV
AND DIEM >= (SELECT MAX(DIEM) FROM KQUA)

--20. Liệt kê tên sinh viên có điểm cao nhất của môn “Cơ sở dữ liệu” ở học kì 1, năm 1996.
select SVIEN.MASV, TENSV, tenmh, DIEM 
from SVIEN, KQUA,HPHAN, MHOC
where SVIEN.MASV = KQUA.MASV
		and KQUA.MAHP = HPHAN.MAHP
		and HPHAN.MAMH = MHOC.MAMH
		and MHOC.TENMH = 'Co so du lieu'
		and HPHAN.HOCKY = 1
		and HPHAN.NAM = 1996
		and KQUA.DIEM >= (select MAX(DIEM)
							from KQUA, HPHAN, MHOC
							where KQUA.MAHP = HPHAN.MAHP	
							and HPHAN.MAMH = MHOC.MAMH
							and MHOC.TENMH = 'Co so du lieu'
							and HPHAN.HOCKY = 1
							and HPHAN.NAM = 1996)
--21. Liệt kê tên sinh viên có điểm trung bình cao nhất ở học kì 1, năm 1996.
--22. *Liệt kê danh sách 10 sinh viên có điểm môn “Cơ sở dữ liệu” cao nhất ở học kì 1, năm 1996

 


 --select ketQua.maHP, COUNT (maSV) as SVDK from ketQua group by ketQua.maHP
-- 2.4 NOT IN
--23. Liệt kê mã khoa, tên khoa của tất cả các khoa 
--24. Liệt kê mã khoa, tên khoa của khoa có sinh viên theo học
SELECT MAKHOA, TENKHOA  FROM KHOA WHERE MAKHOA IN (SELECT MAKHOA FROM SVIEN)
--25. Liệt kê mã khoa, tên khoa của khoa chưa có sinh viên theo học
SELECT MAKHOA, TENKHOA  FROM KHOA WHERE MAKHOA NOT IN (SELECT MAKHOA FROM SVIEN)
--26. Liệt kê tên sinh viên chưa đăng ký học môn “Toán rời rạc”

select tensvfrom svienwhere masv not in (select KQUA.masv					from kqua,hphan,mhoc					where  kqua.mahp=hphan.mahp					and mhoc.mamh=hphan.mamh					and tenmh='Toan roi rac')
--27. Liệt kê những môn học thuộc khoa “Toán” (MAKHOA=”TOAN”) phụ trách nhưng không được dạy ở học kì 1 năm 1996

SELECT TENMH FROM MHOC,KHOA 
WHERE MHOC.MAKHOA=KHOA.MAKHOA
AND MAMH NOT IN(SELECT MAMH
FROM HPHAN 
WHERE  HOCKY='1'
AND NAM = '1996'
)AND KHOA.MAKHOA='TOAN'
--28. *Liệt kê danh sách sinh viên năm 3 thuộc khoa “Toán” (MAKHOA=”TOAN”) không đăng kí học môn “Cơ sở dữ liệu” ở học kì 1, năm 1996

SELECT* FROM SVIEN
WHERE NAM = 3
AND MAKHOA = 'TOAN'
AND MASV NOT IN(SELECT SVIEN.MASV
FROM SVIEN, KQUA, HPHAN, MHOC
WHERE SVIEN.MASV = KQUA.MASV
AND KQUA.MAHP = HPHAN.MAHP
AND HPHAN.MAMH = MHOC.MAMH
AND TENMH ='Co so du lieu'
and HPHAN.NAM = 1996
AND HOCKY = 1)
--29. Liệt kê masv, mã học phần, điểm của sinh viên thi tất cả các học phần
SELECT MASV, HPHAN.MAHP, DIEM
FROM KQUA, HPHAN
GROUP BY MASV, HPHAN.MAHP, DIEM

--30. LIỆT KÊ HO TEN MA SV CUA SV THI TẤT CẢ CÁC MÔN
--31. LIỆT KÊ MÔN HỌC DƯỢC TẤT CẢ CÁC SINH VIÊN THI
--2.5 
--29.
--*Liệt kê danh sách các sinh viên có đăng kí trên 3 học phần (có điểm số) của học kì 1, năm 1996
--PHÂN BIỆT SỰ KHÁC NHAU CÁC CAU COUNT
SELECT MASV, COUNT(DIEM)
FROM KQUA
GROUP BY MASV

SELECT MASV, COUNT(*)
FROM KQUA
GROUP BY MASV

SELECT MASV, COUNT(DISTINCT(DIEM))
FROM KQUA
GROUP BY MASV 