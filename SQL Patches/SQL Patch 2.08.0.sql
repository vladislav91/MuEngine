USE MuOnline
GO
ALTER TABLE dbo.AccountCharacter ADD Ragefighter TINYINT NOT NULL DEFAULT 0
GO
ALTER TABLE dbo.AccountCharacter
	DROP CONSTRAINT DF_AccountCharacter_Summoner
GO
ALTER TABLE dbo.AccountCharacter ADD CONSTRAINT
	DF_AccountCharacter_Summoner DEFAULT ((0)) FOR Summoner
