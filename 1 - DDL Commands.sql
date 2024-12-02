CREATE DATABASE IF NOT EXISTS db;
USE db;

-- DATATYPES IN SQL
CREATE TABLE IF NOT EXISTS datatypes(
	-- Numeric Datatypes
    id SMALLINT, -- -2^31 to 2^31 - 1
    age INT, -- -2^15 to 2^15 - 1
    phone BIGINT, -- -2^63 to 2^63 - 1
    new_column TINYINT, -- 0 to 255 
    
    -- Flotting point Numbers
    height FLOAT(10),
    weight REAL,
    
    -- Formatted Numbers -> The numbers which are relatively bigger than INT
    num_1 DECIMAL(5, 3),
    num_2 NUMERIC(6, 3),
    
    -- Character string type
    name CHAR(255),
    address VARCHAR(255),
    
    -- Boolean
    married BOOLEAN,
    
    -- DATE TIME
    birth_date DATE,
    birth_time TIME,
    today_time DATETIME
);

INSERT INTO datatypes VALUES (1, 43, 123456, 5.11, 50, 12.123, 123.123, 'Dexter', 'India', False, '2000-10-23', '05:34:50', '2000-10-23 05:34:50');
SELECT * FROM datatypes;

-- Data Defination Langiage(DDL) Commands 🎯
SHOW TABLES; -- to see all tables in a selected table

-- 1. DESCRIBE
DESCRIBE datatypes; -- another way "DESC TABLE datatypes"

-- 2. CREATE -> DATABASE, TABLE
CREATE DATABASE IF NOT EXISTS bd;
CREATE TABLE IF NOT EXISTS tb(name VARCHAR(255) NOT NULL);

-- 3. ALTER -> ADD, MODIFY, DROP
ALTER TABLE datatypes
ADD new_column_1 INT NOT NULL;

ALTER TABLE datatypes
MODIFY new_column_1 NUMERIC(2,2);

ALTER TABLE datatypes
ADD new_column_2 INT;

ALTER TABLE datatypes
DROP new_column_2;

-- 4. DROP -> Database, Table
DROP TABLE IF EXISTS tb;
DROP DATABASE IF EXISTS db;

-- 5. RENAME
RENAME TABLE datatypes TO new_datatypes;

-- 6. TRUNCATE
TRUNCATE TABLE new_datatypes;
SELECT * FROM new_datatypes;

-- Difference between trucate and drop -> drop will removes the entire data with table but truncate will only deletes the data