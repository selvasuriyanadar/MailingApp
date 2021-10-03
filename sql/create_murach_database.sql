/***********************************************************
* Create the database named murach, its tables, and a user
************************************************************/

DROP DATABASE IF EXISTS murach;

CREATE DATABASE murach;

USE murach;

CREATE TABLE User (
  UserID INT NOT NULL AUTO_INCREMENT,
  Email VARCHAR(50),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  
  PRIMARY KEY(UserID) 
);

INSERT INTO User 
  (Email, FirstName, LastName)
VALUES 
  ('jsmith@gmail.com', 'John', 'Smith'),
  ('andi@murach.com', 'Andrea', 'Steelman'), 
  ('joelmurach@yahoo.com', 'Joel', 'Murach');

CREATE TABLE Download (
  DownloadID INT NOT NULL AUTO_INCREMENT,
  UserID INT NOT NULL,
  DownloadDate DATETIME NOT NULL,
  DownloadFilename VARCHAR(30) NOT NULL,
  ProductCode VARCHAR(10) NOT NULL,

  PRIMARY KEY (DownloadID), 
  FOREIGN KEY (UserID) REFERENCES User (UserID)
);

INSERT INTO Download 
  (UserID, DownloadDate, DownloadFilename, ProductCode)
VALUES 
  (1, '2014-02-01', 'jr01_so_long.mp3', 'jr01'), 
  (1, NOW(), 'jr01_filter.mp3', 'jr01'),
  (2, NOW(), 'jr01_filter.mp3', 'jr01'),
  (3, NOW(), 'jr01_so_long.mp3', 'jr01');
  
  
CREATE TABLE UserPass (
  Username varchar(15) NOT NULL PRIMARY KEY,
  Password varchar(15) NOT NULL
);
  
INSERT INTO UserPass VALUES ('andrea', 'sesame'),
                            ('joel', 'sesame'),
                            ('anne', 'sesame');
                          
CREATE TABLE UserRole (   
  Username VARCHAR(15) NOT NULL,
  Rolename VARCHAR(15) NOT NULL,

  PRIMARY KEY (Username, Rolename)
);
  
INSERT INTO UserRole VALUES ('andrea', 'service'),
                            ('andrea', 'programmer'),
                            ('joel', 'programmer');


-- Create murach_user and grant privileges

DELIMITER //
CREATE PROCEDURE drop_user_if_exists()
BEGIN
    DECLARE userCount BIGINT DEFAULT 0 ;

    SELECT COUNT(*) INTO userCount FROM mysql.user
    WHERE User = 'murach_user' and  Host = 'localhost';

    IF userCount > 0 THEN
        DROP USER murach_user@localhost;
    END IF;
END ; //
DELIMITER ;

CALL drop_user_if_exists() ;

CREATE USER murach_user@localhost IDENTIFIED BY 'sesame';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
ON murach.*
TO murach_user@localhost;

