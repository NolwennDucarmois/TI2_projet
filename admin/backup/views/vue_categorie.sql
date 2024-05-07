create
or replace view vue_categorie
AS
SELECT categorie.id_categorie,
       categorie.nom_categorie,
       categorie.image_categorie,
       instrument.id_instrument,
       instrument.reference_instrument,
       instrument.nom_instrument,
       instrument.couleur_instrument,
       instrument.prix_instrument,
       instrument.image_instrument,
       instrument.id_marque
FROM categorie
         JOIN instrument ON categorie.id_categorie = instrument.id_categorie;