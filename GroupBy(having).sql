USE ThanhCong
GO

SELECT * FROM dbo.BOMON,dbo.GIAOVIEN
WHERE BOMON.MABM=GIAOVIEN.MABM

-- Xuất ra Danh sách tên bộ môn và số lượng giáo viên của bộ môn đó
SELECT BM.TENBM,BM.MAKHOA, COUNT(*) FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
WHERE BM.MABM = GV.MABM 
GROUP BY BM.TENBM,BM.MAKHOA

-- Thằng cho hiển thị ra phải là thằng duy nhất trong groupby này
-- cột hiển thị phải nằm trong khối groupby hoặc agreegation

-- Lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > (SELECT SUM(LUONG)/10 FROM dbo.GIAOVIEN)


-- Xuất ra tên giáo viên và số lượng đề tài giáo viên đã làm đó
SELECT GV.HOTEN,COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV=TGDT.MAGV
GROUP BY GV.HOTEN


-- XUẤT ra tên gv và sô sluowjng ng thân của giáo viên đó
SELECT GV.HOTEN, COUNT(*) AS SOLUONG  FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV=NT.MAGV
GROUP BY GV.HOTEN

-- Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà gv đó tham gia
SELECT GV.HOTEN,COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV=TGDT.MAGV
AND TGDT.KETQUA = N'ĐẠT'
GROUP BY GV.HOTEN

--Xuất ra tên khoa có tổng số lương giáo viên trong khoa là lớn nhất
SELECT TOP (1) K.TENKHOA,SUM(GV.LUONG) FROM dbo.KHOA AS K, dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE K.MAKHOA=BM.MAKHOA
AND GV.MABM = BM.MABM
GROUP BY K.TENKHOA
ORDER BY SUM(GV.LUONG) DESC 


-- Xuất ra số lượng giáo viên trong từng bộ môn mà số gv lớn hơn 2
SELECT BM.TENBM,COUNT(*) FROM dbo.GIAOVIEN GV, dbo.BOMON AS BM
WHERE BM.MABM=GV.MABM
GROUP BY BM.TENBM HAVING COUNT(*)>1

-- Xuất ra mức lương và tổng tuổi của giáo viên nhận đc mức lương đó
SELECT LUONG,SUM(YEAR(GETDATE())-YEAR(NGSINH)) FROM dbo.GIAOVIEN 
GROUP BY LUONG 