-- db 생성 
create database hotel; 

-- 목록 확인 
show databases;

-- 사용할 db 선택 
use hotel;

-- 테이블 생성 
CREATE TABLE Reservation
( 
	ID INT,
	Name VARCHAR(30),
	ReserveDate DATE,
	RoomNum INT 
);

describe reservation;
-- 바꿔보기 
ALTER TABLE Reservation ADD Phone INT;
ALTER TABLE Reservation DROP RoomNum;
ALTER TABLE Reservation MODIFY COLUMN ReserveDate VARCHAR(20);
ALTER TABLE Reservation change Phone cellphone INT;

-- 삭제 
DROP DATABASE Hotel;
DROP TABLE Reservation;
-- 내용만 삭제 
TRUNCATE TABLE Reservation;
-- 존재할때만 삭제 
DROP DATABASE IF EXISTS Hotel;
DROP TABLE IF EXISTS Reservation; 

-- insert 
INSERT INTO Reservation(ID, Name, ReserveDate, RoomNum) 
VALUES(5, 'Tom', '2016-02-16', 1108);
INSERT INTO Reservation(ID, Name)
VALUES(6, 'Mary');

TRUNCATE TABLE Reservation;
INSERT INTO Reservation(ID, Name, ReserveDate, RoomNum) 
VALUES(1, 'Tom', '2016-02-16', 1108);
INSERT INTO Reservation(ID, Name, ReserveDate, RoomNum)
VALUES(2, 'Mary', '2016-02-12', 918);
INSERT INTO Reservation(ID, Name, ReserveDate, RoomNum) 
VALUES(3, 'John', '2016-01-16', 1208);
INSERT INTO Reservation(ID, Name, ReserveDate, RoomNum)
VALUES(4, 'Tom', '2016-03-17', 504);

-- update 
UPDATE Reservation
SET RoomNum = 2002
WHERE Name = 'Tom';

-- where 조건이 없을 때  
UPDATE Reservation
SET RoomNum = 2002;

-- delete(where 없으면 테이블의 모든 데이터 삭제)
DELETE FROM Reservation
WHERE Name  = 'Tom';

-- select
SELECT *
FROM Reservation;

SELECT *
FROM Reservation
WHERE Name = 'Tom'; 

SELECT *
FROM Reservation
WHERE ID <= 3 AND ReserveDate > '2016-02-01';

SELECT Name, RoomNum
FROM Reservation;

SELECT DISTINCT Name
FROM Reservation;

SELECT *
FROM Reservation
ORDER BY ReserveDate;

SELECT *
FROM Reservation
ORDER BY ReserveDate DESC;

SELECT ReserveDate, CONCAT(RoomNum, " : ", Name) AS ReserveInfo 
FROM Reservation;

DROP TABLE Reservation;
-- NOT NULL
CREATE TABLE Reservation
(
   ID INT NOT NULL,
   Name VARCHAR(30),
   ReserveDate DATE,
   RoomNum INT 
);
describe reservation;

ALTER TABLE Reservation
MODIFY COLUMN Name VARCHAR(30) NOT NULL; 

-- UNIQUE
CREATE TABLE Reservation
(
   ID INT UNIQUE,
   Name VARCHAR(30),
   ReserveDate DATE,
   RoomNum INT 
);

ALTER TABLE Reservation
ADD CONSTRAINT reservedRoom UNIQUE (RoomNum); 

-- primary key
CREATE TABLE Reservation
(
   ID INT PRIMARY KEY,
   Name VARCHAR(30),
   ReserveDate DATE,
   RoomNum INT 
);

ALTER TABLE Reservation
ADD CONSTRAINT CustomerID PRIMARY KEY (ID);

ALTER TABLE Reservation
DROP PRIMARY KEY;

describe reservation;
