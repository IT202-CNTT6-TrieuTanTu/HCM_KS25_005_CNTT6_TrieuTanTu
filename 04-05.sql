CREATE DATABASE ESportsManagement1;
USE ESportsManagement1;

DROP DATABASE ESportsManagement1;



CREATE TABLE Team (
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) UNIQUE NOT NULL,
    Quoc_gia VARCHAR(100),
    Owner VARCHAR(100),
    year_born YEAR
);

CREATE TABLE Player (
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    nickname VARCHAR(100) UNIQUE NOT NULL,
    spot VARCHAR(100)  NOT NULL,
    salary DECIMAL(15,2),
    team_id INT,
    CONSTRAINT FOREIGN KEY (team_id) REFERENCES Team(team_id) ON DELETE CASCADE
);



CREATE TABLE Matchs (
	match_id VARCHAR(100) PRIMARY KEY,
    time DATETIME NOT NULL,
    result VARCHAR(50) NOT NULL
);

CREATE TABLE Match_Statistic (
	player_id INT,
	CONSTRAINT FOREIGN KEY (player_id) REFERENCES Player(player_id) ON DELETE CASCADE,
    match_id VARCHAR(100),
    CONSTRAINT FOREIGN KEY (match_id) REFERENCES Matchs (match_id) ON DELETE CASCADE,
    Kills INT,
	Death INT,
    Assists INT
);

ALTER TABLE Matchs
ADD GiaiThuong DECIMAL(15,2);

ALTER TABLE Team
RENAME COLUMN Quoc_gia TO KhuVuc ;


DROP TABLE Matchs;
DROP TABLE Match_Statistic;

INSERT INTO Team			
VALUE
(1,'T1','Hàn Quốc','t1 telecom',2000),
(2,'Saigon phantom','vietnam','Saigon',2018),
(3,'FPT','vietnam','FPT',2020),
(4,'TeamA',NULL,'t1 telecom',2000),
(5,'TEAMB',NULL,NULL,2000);

INSERT INTO Player 
VALUE 
(1,'levi','levi','jungle',50000000,2),
(2,'Zeros','Zero','top',45000000,2),
(3,'Sofm','Beos','adc',65000000,3),
(4,'Minh beo','Minh','support',43000000,1),
(5,'asgore','idk','mid',25000000,3),
(6,'Faker','notreal','mid',99999999,1);

INSERT INTO Matchs 
VALUE 
('MS_005','2025-02-03 10:00:00',1),
('MS_006','2025-02-04 10:00:00',1),
('MS_007','2025-02-05 10:00:00',1),
('MS_008','2025-02-06 10:00:00',1),
('MS_009','2025-02-07 10:00:00',1);



INSERT INTO match_statistic
VALUE
(6,'MS_006',20,3,22),
(6,'MS_007',8,9,32),
(6,'MS_008',15,7,14),
(6,'MS_009',20,5,12);

SET SQL_SAFE_UPDATES = 0;

UPDATE Player
SET salary = salary +  salary * 0.2
WHERE spot = 'jungle';

DELETE FROM team
WHERE Owner IS NULL;


SELECT * FROM Player
WHERE salary > 50000000 AND salary < 150000000;

SELECT * FROM Matchs
WHERE match_id = 'MS_007';

SELECT nickname AS 'Ten nguoi choi', spot AS 'Vi tri'
FROM Player p, Team t
WHERE p.team_id = t.team_id 
AND t.KhuVuc = 'Vietnam';


