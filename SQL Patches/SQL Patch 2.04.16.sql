USE MUONLINE
ALTER TABLE Lottery_Info ADD WinningTicket VARCHAR(13) NULL
ALTER TABLE Lottery_Winners ADD Taken TINYINT NOT NULL DEFAULT 0