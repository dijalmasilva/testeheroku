/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.repository;

import com.recursive.entidades.entidades.Time;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Marcelo Augusto
 */
@Repository
public interface TimeRepository extends CrudRepository<Time, Long>{
    @Query("select t from Time t where t.nome =:nome")
    public Time buscarPorNome(@Param("nome")String nome);
    
}
