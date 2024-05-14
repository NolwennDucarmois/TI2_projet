CREATE OR REPLACE FUNCTION delete_instru(int)
RETURNS integer
AS
'
	declare p_id alias for $1;
	declare retour integer;
BEGIN
	delete from instrument where id_instrument=p_id;
	RETURN 1;
END;
' LANGUAGE 'plpgsql';