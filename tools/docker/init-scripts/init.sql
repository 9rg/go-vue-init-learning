/*
# init.sql

## responsibility

- Perform initial operations on the database simultaneously with the container startup.
*/


USE master;
GO

CREATE DATABASE go-vue-init-learning;
GO

USE go-vue-init-learning;
GO

CREATE TABLE m_user(
    UserID INT PRIMARY KEY,
    UserName NVARCHAR(100)
);
GO

INSERT INTO Users (UserID, UserName)
VALUES (1, 'hoge太郎'), (2, 'fuga次郎');
GO

