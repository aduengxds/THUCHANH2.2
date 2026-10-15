
-- 1. Tao co so du lieu
CREATE DATABASE QuanLyDiemThi;
GO

-- 2. Chon co so du lieu
USE QuanLyDiemThi;
GO

-- 3. Tao bang HocSinh
CREATE TABLE HocSinh (
    MaHS VARCHAR(20) PRIMARY KEY,
    TenHS VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);
GO

-- 4. Tao bang GiaoVien
CREATE TABLE GiaoVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(50),
    SDT VARCHAR(10)
);
GO

-- 5. Tao bang MonHoc
CREATE TABLE MonHoc (
    MaMH VARCHAR(50) PRIMARY KEY,
    TenMH VARCHAR(50),
    MaGV VARCHAR(20),
    CONSTRAINT FK_MonHoc_GiaoVien
        FOREIGN KEY (MaGV)
        REFERENCES GiaoVien(MaGV)
);
GO

-- 6. Tao bang BangDiem
CREATE TABLE BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(50),
    DiemThi INT,
    NgayKT DATETIME,

    CONSTRAINT PK_BangDiem
        PRIMARY KEY (MaHS, MaMH),

    CONSTRAINT FK_BangDiem_HocSinh
        FOREIGN KEY (MaHS)
        REFERENCES HocSinh(MaHS),

    CONSTRAINT FK_BangDiem_MonHoc
        FOREIGN KEY (MaMH)
        REFERENCES MonHoc(MaMH)
);
GO

-- 7. Kiem tra cac bang da tao
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- 8. Xem cau truc cac bang
EXEC sp_help 'HocSinh';
EXEC sp_help 'GiaoVien';
EXEC sp_help 'MonHoc';
EXEC sp_help 'BangDiem';
GO

-- 9. Kiem tra cac rang buoc khoa
EXEC sp_helpconstraint 'HocSinh';
EXEC sp_helpconstraint 'GiaoVien';
EXEC sp_helpconstraint 'MonHoc';
EXEC sp_helpconstraint 'BangDiem';
GO
