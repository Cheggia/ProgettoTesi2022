USE db;

DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255),
   email VARCHAR(255)
) ENGINE=INNODB;

INSERT INTO user (name, email)
VALUES 
   ("Yuna", "yu@gmail.com"),
   ("Rikku", "ri@gmail.com"),
   ("Lulu", "lu@gmail.com"),
   ("Payne", "pa@gmail.com");
