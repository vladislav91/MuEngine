-- Purge useless transaction log data
-- Can be performed while DB / Serverfiles are online
DBCC SHRINKDATABASE([muonline],2)
BACKUP LOG [muonline] WITH TRUNCATE_ONLY
DBCC SHRINKDATABASE([muonline],2)
