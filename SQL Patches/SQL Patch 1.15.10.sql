USE [Me_MuOnline] -- for 2 DB
--USE [MuOnline] -- for 1 DB

ALTER TABLE MEMB_INFO ADD TempCredits INT NOT NULL DEFAULT 0 -- change MEMB_INFO to your credit table
ALTER TABLE MuOnline.dbo.Character ADD TempPcPoints INT NOT NULL DEFAULT 0
