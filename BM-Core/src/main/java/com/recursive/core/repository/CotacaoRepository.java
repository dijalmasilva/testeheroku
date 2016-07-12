/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.repository;

import com.recursive.entidades.entidades.Cotacao;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Marcelo Augusto
 */
@Repository
public interface CotacaoRepository extends CrudRepository<Cotacao, Long>{
    
}
