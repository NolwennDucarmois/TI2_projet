create or replace view vue_marque
AS
SELECT 
	marque.id_marque,
	marque.nom_marque,
    instrument.id_instrument,
    instrument.reference_instrument,
    instrument.nom_instrument,
    instrument.couleur_instrument,
    instrument.prix_instrument,
    instrument.image_instrument,
    instrument.id_categorie
FROM
	marque
JOIN
	instrument ON instrument.id_marque = marque.id_marque;