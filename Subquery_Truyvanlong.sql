USE ThanhCong
GO

-- Kiểm tra xem giáo viên 001 có phải là giáo viên quản lý chuyên môn hay không
-- Lấy ra danh sách các mã giáo viên QLCM
-- Kiểm tra mã GV tồn tại trong danh sách đó
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001'
/* 001 tồn tại trong danh sách*/
AND MAGV IN 
(
	SELECT GVQLCM FROM dbo.GIAOVIEN
)

-- truy vấn lồng trong from
SELECT * FROM
dbo.GIAOVIEN, (SELECT * FROM dbo.DETAI) AS DT

-- 1. Xuất ra danh sách giáo viên tham gia nhiều hơn một đề tài

-- Lấy ra tất cả thông tin của Giáo viên 
SELECT * FROM dbo.GIAOVIEN AS GV
-- khi mà số lượng đề tài giáo viên đó tham gia > 1
WHERE 1 <
(
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE MAGV = GV.MAGV
)

-- 2. Xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên
-- Lấy được danh sách bộ môn nằm trong khoa hiện tại

SELECT * FROM dbo.KHOA AS K
WHERE 2 < 
(
	SELECT COUNT(*) FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
	WHERE BM.MAKHOA = k.MAKHOA
	AND bm.MABM = gv.MABM
)

-- sắp xếp giảm dần
SELECT MAGV FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- sắp xếp tăng dần
SELECT MAGV FROM dbo.GIAOVIEN
ORDER BY MAGV ASC

-- lấy ra top 5 phần tử
SELECT TOP(5) * FROM dbo.GIAOVIEN 

