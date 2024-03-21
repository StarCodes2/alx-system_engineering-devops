-- Creates a database hbnb_dev_db, user 'hbnb_dev' and sets the user's privileges
CREATE DATABASE IF NOT EXISTS tyrell_corp;
-- USE tyrell_corp;
-- CREATE TABLE IF NOT EXISTS nexus6 (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(256));
-- INSERT INTO nexus6 (name) VALUES ("Leon");
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
-- GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
