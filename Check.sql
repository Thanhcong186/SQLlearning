﻿USE ThanhCong
GO

-- Có thể tạo check y như tạo khóa chính
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT CHECK(Luong > 3000 AND Luong < 9000)
)
GO

INSERT dbo.TestCheck
        ( Luong )
VALUES  ( 3001)

CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT,
	CHECK(Luong > 3000 AND Luong < 9000)
)
GO

CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT,
	CONSTRAINT CK_Luong CHECK(Luong > 3000 AND Luong < 9000)
)
GO

CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT
)
GO

ALTER TABLE dbo.TestCheck ADD CONSTRAINT CK_Luong
CHECK (Luong > 3000 AND Luong < 9000)