create or replace function update_instru(int, text, numeric(15,2))
RETURNS integer
AS
'
	declare p_id alias for $1;
	declare p_couleur alias for $2;
	declare p_prix alias for $3;
	declare id integer;
	declare retour integer;
begin
	select into id id_instrument from instrument where id_instrument = p_id;
	if found 
	then
		update instrument 
		set couleur_instrument = p_couleur, 
		prix_instrument = p_prix
		where id_instrument = p_id;
		select into id id_instrument from instrument where id_instrument = p_id;
		if not found
		then	
	    	retour = -1;  --échec de la requête
	  	else
	    	retour = 1;   -- modification ok
	  	end if;
	else
		retour=0;
	end if;
	return retour;
end;
'language 'plpgsql';