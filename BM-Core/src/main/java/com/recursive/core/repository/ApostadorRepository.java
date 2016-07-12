/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.repository;

import com.recursive.entidades.entidades.Administrador;
import com.recursive.entidades.entidades.Apostador;
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
public interface ApostadorRepository extends CrudRepository<Apostador, Long>{
    
    @Query("select a from Apostador a where a.email =:email")
    public List<Apostador> buscarPorEmail(@Param("email")String email);
    
}
