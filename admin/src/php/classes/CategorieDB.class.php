<?php

class CategorieDB extends Categorie
{
    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getAllCategories()
    {
        $query = "select id_categorie,nom_categorie,image_categorie from vue_categorie group by id_categorie, nom_categorie, image_categorie order by nom_categorie";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i) {
                $_array[] = new Categorie($i);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }

    public function getInstrumentByIdCategorie($id)
    {
        $query = "select * from vue_categorie where id_categorie = :id";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindvalue(':id', $id);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i) {
                $_array[] = new Categorie($i);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }
}