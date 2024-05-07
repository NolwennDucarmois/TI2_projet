create or replace view vue_instruments
AS
SELECT instrument.id_instrument,
       instrument.reference_instrument,
       instrument.nom_instrument,
       instrument.couleur_instrument,
       instrument.prix_instrument,
       instrument.image_instrument,
       marque.id_marque,
	   marque.nom_marque,
	   categorie.id_categorie,
	   categorie.nom_categorie
FROM instrument
JOIN categorie ON categorie.id_categorie = instrument.id_categorie
JOIN marque ON marque.id_marque = instrument.id_marque;