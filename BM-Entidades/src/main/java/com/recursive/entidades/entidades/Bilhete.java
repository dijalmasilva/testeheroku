/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.entidades.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author Marcelo Augusto
 */
@Entity
public class Bilhete implements Serializable{
    @Id
    private long id;
    private String cliente;
    private BigDecimal valorApostado;
    private BigDecimal valorPremio;
    @OneToMany(cascade = CascadeType.ALL)
    private List <Aposta> apostas;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataAposta;
    private String operador;
    
    public Bilhete(){
        this.apostas = new ArrayList<>();
        valorApostado = new BigDecimal(0);
        valorPremio = new BigDecimal(0);
    }

    public void addAposta(Aposta aposta){
        this.apostas.add(aposta);
    }
    
    public void removerAposta(Aposta aposta){
        this.apostas.remove(aposta);
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public BigDecimal getValorApostado() {
        return valorApostado;
    }

    public void setValorApostado(BigDecimal valor) {
        this.valorApostado = valor;
    }

    public BigDecimal getValorPremio() {
        return valorPremio;
    }

    public void setValorPremio(BigDecimal valorPremio) {
        this.valorPremio = valorPremio;
    }

    public List<Aposta> getApostas() {
        return apostas;
    }

    public void setApostas(List<Aposta> apostas) {
        this.apostas = apostas;
    }

    public String getDataAposta() {
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return df.format(dataAposta);
    }

    public void setDataAposta(Date dataAposta) {
        this.dataAposta = dataAposta;
    }

    public String getOperador() {
        return operador;
    }

    public void setOperador(String operador) {
        this.operador = operador;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 97 * hash + Objects.hashCode(this.valorApostado);
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
        final Bilhete other = (Bilhete) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.valorApostado, other.valorApostado)) {
            return false;
        }
        return true;
    }
    
    
}
