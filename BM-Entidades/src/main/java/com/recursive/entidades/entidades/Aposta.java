/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.entidades.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author Marcelo Augusto
 */
@Entity
public class Aposta implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne
    private Jogo jogo;
    @OneToOne(cascade = CascadeType.ALL)
    private Cotacao cotacaoEscolhida;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Jogo getJogo() {
        return jogo;
    }

    public void setJogo(Jogo jogo) {
        this.jogo = jogo;
    }

    public Cotacao getCotacaoEscolhida() {
        return cotacaoEscolhida;
    }

    public void setCotacaoEscolhida(Cotacao cotacaoEscolhida) {
        this.cotacaoEscolhida = cotacaoEscolhida;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 73 * hash + Objects.hashCode(this.jogo);
        hash = 73 * hash + Objects.hashCode(this.cotacaoEscolhida);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Aposta other = (Aposta) obj;
        if (!Objects.equals(this.jogo, other.jogo)) {
            return false;
        }
        if (!Objects.equals(this.cotacaoEscolhida, other.cotacaoEscolhida)) {
            return false;
        }
        return true;
    }
    
    
}
