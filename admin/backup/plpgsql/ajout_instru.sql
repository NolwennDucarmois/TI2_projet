create or replace function ajout_instru(text,text,text,numeric(15,2),integer, integer) returns integer as
'
  declare p_reference alias for $1;
  declare p_nom alias for $2;
  declare p_couleur alias for $3;
  declare p_prix alias for $4;
  declare p_id_marque alias for $5;
  declare p_id_categorie alias for $6;
  declare id integer;
  declare retour integer;
  
begin
	select into id id_instrument from instrument where reference_instrument = p_reference;
	if not found
	then
	  insert into instrument (reference_instrument,nom_instrument,couleur_instrument,prix_instrument,id_marque, id_categorie) values
	    (p_reference,p_nom,p_couleur,p_prix,p_id_marque,p_id_categorie);
		select into id id_instrument from instrument where reference_instrument = p_reference;
	  if not found
	  then	
	    retour = -1;  --échec de la requête
	  else
	    retour = 1;   -- insertion ok
	  end if;
	else
	  retour = 0;      -- déjà en BD
	end if;
 return retour;
 end;
 ' LANGUAGE 'plpgsql';