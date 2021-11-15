USE ThanhCong
GO

--Xuất ra thông tin giáo viên (mã GV và tên) và tên người thân tương ứng của giáo viên đó.
SELECT GV.MAGV,GV.HOTEN, NT.TEN AS "NGUOI THAN"
FROM dbo.GIAOVIEN AS GV 
INNER JOIN dbo.NGUOITHAN AS NT ON NT.MAGV = GV.MAGV

--Xuất ra thông tin đề tài (mã DT, tên DT) và tên chủ đề của đề tài đó
SELECT DT.MADT,DT.TENDT,CD.TENCD
FROM dbo.DETAI AS DT 
INNER JOIN dbo.CHUDE AS CD ON CD.MACD = DT.MACD

--Xuất ra tên đề tài và tên các giáo viên tham gia đề tài
SELECT DT.MADT, DT.TENDT,GV.HOTEN
FROM dbo.THAMGIADT AS TGDT
     INNER JOIN dbo.GIAOVIEN AS GV ON GV.MAGV = TGDT.MAGV
     INNER JOIN dbo.DETAI AS DT ON DT.MADT = TGDT.MADT

-- Xuất ra thông tin các giáo viên nam, bộ môn và khoa mà giáo viên đó giảng dạy
SELECT GV.MAGV,GV.HOTEN,GV.PHAI,BM.TENBM, K.TENKHOA
FROM dbo.BOMON AS BM
     JOIN dbo.GIAOVIEN AS GV ON GV.MABM = BM.MABM
     JOIN dbo.KHOA AS K ON K.MAKHOA = BM.MAKHOA
WHERE GV.PHAI ='NAM'

-- Xuất ra thông tin đề tài (Mã DT, tên DT) và tên giáo viên chủ nhiệm đề tài có ngày kết thúc trước năm 2009
SELECT DT.MADT,DT.TENDT, GV. HOTEN AS N'GV Chủ Nhiệm'
FROM dbo.DETAI AS DT
     INNER JOIN dbo.GIAOVIEN AS GV ON GV.MAGV = DT.GVCNDT
WHERE YEAR(NGAYKT) < 2009