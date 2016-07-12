/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.repository;

import com.recursive.entidades.entidades.Jogo;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Marcelo Augusto
 */
@Repository
public interface JogoRepository extends CrudRepository<Jogo, Long>{
    
    @Query("SELECT j FROM Jogo j WHERE j.campeonato.id =:idCampeonato")
    public List<Jogo> buscarPorCampeonato(@Param("idCampeonato") long idCampeonato); 
    
    
}
