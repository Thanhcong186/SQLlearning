USE ThanhCong
GO

DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT
SELECT @SoLuongGiaoVien=COUNT(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh=SUM(Luong)/@SoLuongGiaoVien FROM dbo.GIAOVIEN

DECLARE @MAGV CHAR(10) = '006'
DECLARE @LuongMaGV INT = 0

PRINT @LuongTrungBinh
PRINT @LuongMaGV
IF (@LuongMaGV > @LuongTrungBinh) 
BEGIN
	PRINT @LuongMaGV
	PRINT @LuongTrungBinh
	PRINT N'Lớn hơn'
END
ELSE
BEGIN
	PRINT @LuongMaGV
	PRINT @LuongTrungBinh
	PRINT N'Nhỏ hơn'
END

DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT
SELECT @SoLuongGiaoVien=COUNT(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh=SUM(Luong)/@SoLuongGiaoVien FROM dbo.GIAOVIEN

DECLARE @Luong INT = 1500
IF (@LuongMaGV > @LuongTrungBinh) 
BEGIN
	UPDATE dbo.GIAOVIEN SET LUONG = @Luong
END
ELSE
BEGIN
	UPDATE dbo.GIAOVIEN SET LUONG = @Luong
	WHERE PHAI = N'Nữ'
END