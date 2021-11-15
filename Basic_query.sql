-- lấy hêt các dữ liệu trong bảng bộ môn ra
SELECT * FROM dbo.BOMON 

-- Lấy tất cả mã khoa từ Table BOMON
SELECT MAKHOA
FROM dbo.BOMON

-- Lấy tất cả mã khoa không trùng nhau từ Table BOMON
SELECT DISTINCT MAKHOA
FROM dbo.BOMON

-- Đếm số khoa không trùng nhau
SELECT COUNT(DISTINCT MAKHOA) FROM dbo.BOMON

--Lấy tất cả dữ liệu trong table BOMON
SELECT * FROM dbo.BOMON

--Lấy tất cả dữ liệu của 5 record đầu tiên trong table BOMON
SELECT TOP 5 * FROM dbo.BOMON

--Lấy tất cả dữ liệu của 5% đầu tiên trong table BOMON
SELECT TOP 5 PERCENT * FROM dbo.BOMON

-- Lấy Mã đề tài + tên đề tài trong bảng bộ môn
SELECT MABM, TENBM FROM dbo.BOMON

-- Đổi tên cột hiển thị
SELECT MABM AS 'HowKteam.com', TENBM AS N'Giáo dục' FROM dbo.BOMON

-- Xuất ra mã giáo viên + Tên + Tên bộ môn giáo viên đó dạy
SELECT GV.MAGV, GV.HOTEN, BM.TENBM
FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM





