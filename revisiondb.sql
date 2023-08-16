CREATE database lifechoices2;
USE lifechoices2;

CREATE TABLE college(
id int primary key auto_increment,
collegeName varchar(20),
collegeAddress TEXT
);
-- Student table
CREATE TABLE Student(
	studID INT PRIMARY KEY AUTO_INCREMENT,
    studName VARCHAR(30),
    studSurname VARCHAR(30),
    studDOB DATE,
    studAdd TEXT,
    collegeID INT,
    CONSTRAINT college_student FOREIGN KEY(collegeID)
    REFERENCES College(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
-- Subject table
CREATE TABLE Subjects(
	subID INT PRIMARY KEY AUTO_INCREMENT,
    subjectName VARCHAR(25)
);
-- Create a bridge table => Registered table
CREATE TABLE Registered (
	regID INT PRIMARY KEY AUTO_INCREMENT,
    studID INT,
    subID INT,
    subMarks DOUBLE,
    CONSTRAINT student_register FOREIGN KEY(studID)
    REFERENCES Student(studID),
    CONSTRAINT subject_register FOREIGN KEY(subID)
    REFERENCES Subjects(subID)
);

INSERT INTO College(collegeName, collegeAddress)
VALUES('Life choices', '314 Imam Road Haron road'),
	('School Of IT', '14 Main Road Somerset West');
    
    -- mysql date

INSERT INTO Student
VALUES(100, 'Matthew', 'Thomas', '1991-12-12', '12 Main road claremont', 1),
	(DEFAULT, 'Nabila', 'Samsodien', '2000-05-04', '16 Peterson road', 1),
    (DEFAULT, 'John', 'Cena', '1960-01-15', '18 Peter road, Washington DC', 2);
    
select * from student;
INSERT INTO Subjects
VALUES(700, 'HTML'),
(DEFAULT, 'CSS3'),
(DEFAULT, 'JS'),
(DEFAULT, 'VueJS'),
(DEFAULT, 'MySQL');
INSERT INTO Registered(studID, subID, subMarks)
VALUES(100, 700, 80),
	(100, 701, 80),
    (100, 702, 80),
    (100, 703, 80),
    (100, 704, 80),
    (101, 702, 80),
	(101, 704, 80),
    (102, 704, 79);
    
    CREATE VIEW retrieveStudentData AS
	SELECT  studName, studSurname, studDOB, studAdd
    FROM Student;
-- Run view
SELECT *
FROM retrieveStudentData;


-- -- select * from COLLEGE;

-- INSERT INTO College(collegeName, collegeAddress)
-- values('codespace','12 main rd cbd');
--  select c.college ,c.collegeAddress,s.studName,s.studSurname,s.studDOB,s.studAddress
--  from college c
--  left join student s
--  on c.id=s.collegeID;
SELECT *
FROM college 
WHERE collegeName LIKE 'c%o%';

-- creating a user

CREATE USER 'joel'@'localhost' IDENTIFIED BY '12345';
GRANT  CREATE ,SELECT,INSERT ON lifechoices2.* TO
'joel'@'localhost';

FLUSH PRIVILEGES;









