/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.repository;

import com.recursive.entidades.entidades.Campeonato;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Marcelo Augusto
 */
@Repository
public interface CampeonatoRepository extends CrudRepository<Campeonato, Long>{

    @Query("Select c from Campeonato c where c.nome =:nome")
    public List<Campeonato> buscarPorNome(@Param("nome") String nome);
    
}
