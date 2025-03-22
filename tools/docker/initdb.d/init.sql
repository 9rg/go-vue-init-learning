/*
# init.sql
## responsibility
- Perform initial operations on the database simultaneously with the container startup.
*/

-- create database
BEGIN TRY
  CREATE DATABASE go_vue_init_learning;
END TRY

BEGIN CATCH
  PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
  PRINT 'Error Message: ' + ERROR_MESSAGE();
END CATCH

-- Polling
DECLARE @MaxRetries INT = 30;
DECLARE @RetryCount INT = 0;
DECLARE @DatabaseExists BIT = 0;

-- Start Polling
WHILE @RetryCount < @MaxRetries AND @DatabaseExists = 0
BEGIN
  -- check
  IF EXISTS (SELECT name FROM sys.databases WHERE name = 'go_vue_init_learning')
  BEGIN
    SET @DatabaseExists = 1;
    PRINT 'database "go_vue_init_learning" exists and is ready for use.';
  END
  ELSE
  BEGIN
    -- wait for 1 second
    PRINT 'Database not found. Retrying...';
    WAITFOR DELAY '00:00:01';
    SET @RetryCount = @RetryCount + 1;
  END
END

IF @DatabaseExists = 1
BEGIN
  PRINT 'Proceeding with table creation and data insertion...';
  -- create table and insert datas
  BEGIN TRY
    USE go_vue_init_learning;
　
  　CREATE TABLE m_user(
        UserID INT PRIMARY KEY,
        UserName NVARCHAR(100)
    );

    INSERT INTO m_user(UserID, UserName)
    VALUES (1, 'hogetaro'), (2, 'fugajiro');

  END TRY

  BEGIN CATCH
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
  END CATCH
END
ELSE
BEGIN
  PRINT 'Failed to create the database.';
END

