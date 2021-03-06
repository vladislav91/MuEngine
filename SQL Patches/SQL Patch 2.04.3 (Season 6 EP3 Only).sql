-- DONT USE THIS SCRIPT IF:
-- 1. You migrated from other server's database which already supported expanded warehouse
-- 2. You are using Season 6 EP1 and below
USE MuOnline

ALTER TABLE AccountCharacter ADD ExtVault TINYINT NOT NULL DEFAULT 0
GO
-- Original Warehouse
ALTER TABLE  warehouse ALTER COLUMN Items VARBINARY(3840)
GO
DECLARE @i varbinary(3840), 
@x int, 
@acc varchar(10),
@emptyitem varbinary(16);
DECLARE my_cursor CURSOR FOR SELECT Items,AccountId FROM warehouse 
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @i, @acc
WHILE @@FETCH_STATUS = 0 
BEGIN 
	set @x = 120;
	while(@x < 240) 
		begin
			set @x	= @x+1;
			set @emptyitem = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
			set @i=substring(@i, 1, 16*(@x-1))+@emptyitem+substring(@i, 16*(@x)+1, 3840);
		end
	update warehouse set items=@i where accountid=@acc;
	FETCH NEXT FROM my_cursor INTO @i, @acc
END 
CLOSE my_cursor
DEALLOCATE my_cursor
GO
-- Extended Warehouse
ALTER TABLE  CireExWare ALTER COLUMN Items VARBINARY(3840)
GO
DECLARE @i varbinary(3840), 
@x int, 
@acc varchar(10),
@idx int,
@emptyitem varbinary(16);
DECLARE my_cursor CURSOR FOR SELECT Items,AccountId,Idx FROM CireExWare 
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @i, @acc, @idx
WHILE @@FETCH_STATUS = 0 
BEGIN 
	set @x = 120;
	while(@x < 240) 
		begin
			set @x	= @x+1;
			set @emptyitem = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
			set @i=substring(@i, 1, 16*(@x-1))+@emptyitem+substring(@i, 16*(@x)+1, 3840);
		end
	update CireExWare set items=@i where accountid=@acc and Idx=@idx;
	FETCH NEXT FROM my_cursor INTO @i, @acc, @idx
END 
CLOSE my_cursor
DEALLOCATE my_cursor
GO 
-- Guild Vault
ALTER TABLE  GuildExtWare ALTER COLUMN Items VARBINARY(3840)
GO
DECLARE @i varbinary(3840), 
@x int, 
@acc varchar(10),
@idx int,
@emptyitem varbinary(16);
DECLARE my_cursor CURSOR FOR SELECT Items,GuildName,Idx FROM GuildExtWare 
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @i, @acc, @idx
WHILE @@FETCH_STATUS = 0 
BEGIN 
	set @x = 120;
	while(@x < 240) 
		begin
			set @x	= @x+1;
			set @emptyitem = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
			set @i=substring(@i, 1, 16*(@x-1))+@emptyitem+substring(@i, 16*(@x)+1, 3840);
		end
	update GuildExtWare set items=@i where GuildName=@acc and Idx=@idx;
	FETCH NEXT FROM my_cursor INTO @i, @acc, @idx
END 
CLOSE my_cursor
DEALLOCATE my_cursor
