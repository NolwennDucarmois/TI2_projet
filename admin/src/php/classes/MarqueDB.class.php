<?php
class MarqueDB extends Marque{
    private $_bd;
    private $_array = array();
    public function __construct($cnx){
        $this->_bd = $cnx;
    }
    public function getAllMarques(){
        $query = "select id_marque, nom_marque from vue_marque group by id_marque, nom_marque order by nom_marque";
        try{
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i){
                $_array[] = new Marque($i);
            }
            return $_array;
            $this->_bd->commit();
        }catch (PDOException $e){
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }
    public function getAllTous(){
        $query = "select id_marque, nom_marque from marque order by nom_marque";
        try{
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i){
                $_array[] = new Marque($i);
            }
            return $_array;
            $this->_bd->commit();
        }catch (PDOException $e){
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }
    public function getInstrumentByIdMarque($id){
        $query = "select * from vue_marque where id_marque = :id";
        try{
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindvalue(':id', $id);
            $resultset->execute();
            $data = $resultset->fetchAll();
            foreach ($data as $i) {
                $_array[] = new Marque($i);
            }
            return $_array;
            $this->_bd->commit();
        }catch (PDOException $e){
            $this->_bd->rollback();
            print "Echec de la requête : " . $e->getMessage();
        }
    }
}