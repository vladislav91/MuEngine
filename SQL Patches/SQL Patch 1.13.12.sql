USE [Me_MuOnline] -- for 2 DB
--USE [MuOnline] -- for 1 DB

TRUNCATE TABLE MuLogEx

ALTER TABLE MuLogEx ALTER COLUMN TimeIn VARCHAR(50) NULL
ALTER TABLE MuLogEx ALTER COLUMN TimeOut VARCHAR(50) NULL