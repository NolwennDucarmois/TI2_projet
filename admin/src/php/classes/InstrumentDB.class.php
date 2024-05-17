<?php

class InstrumentDB extends Instrument
{
    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getAllInstru()
    {
        $query = "select * from instrument order by nom_instrument";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i) {
                $_array[] = new Instrument($i);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }

    public function getInstrumentById($id)
    {
        $query = "select * from vue_instruments where id_instrument = :id";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindvalue(':id', $id);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i) {
                $_array[] = new Instrument($i);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }

    public function getAllInstruments()
    {
        try {
            $query = "select * from vue_instruments order by nom_instrument";
            $res = $this->_bd->prepare($query);
            $res->execute();
            $data = $res->fetchAll();
            if (!empty($data)) {
                foreach ($data as $d) {
                    $_array[] = new Instrument($d);
                }
                return $_array;
            } else {
                return null;
            }
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function ajout_instru($reference, $nom, $couleur, $prix, $id_marque, $id_categorie, $image)
    {
        try {
            $query = "select ajout_instru(:reference,:nom,:couleur,:prix,:id_marque,:id_categorie,:image)";
            $res = $this->_bd->prepare($query);
            $res->bindValue(':reference', $reference);
            $res->bindValue(':nom', $nom);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix);
            $res->bindValue(':id_marque', $id_marque);
            $res->bindValue(':id_categorie', $id_categorie);
            $res->bindValue(':image', $image);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec : " . $e->getMessage();
        }
    }

    public function delete_instru($id)
    {
        $query = "select delete_instru(:id)";
        try {
            $this->_bd->beginTransaction();
            $res = $this->_bd->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec : " . $e->getMessage();
        }
    }

    public function update_instru($id, $couleur, $prix)
    {
        $query = "select update_instru(:id, :couleur, :prix)";
        try {
            $this->_bd->beginTransaction();
            $res = $this->_bd->prepare($query);
            $res->bindValue(':id', $id);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix);
            $res->execute();
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec : " . $e->getMessage();
        }
    }
}