/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.entidades.entidades;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author Marcelo Augusto
 */
@Entity
public class Jogo implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne
    private Time mandante;
    @OneToOne
    private Time visitante;
    @ManyToOne
    private Campeonato campeonato;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Cotacao> cotacoes;
    private String local;
    @Temporal(TemporalType.TIMESTAMP)
    private Date data;
    @Transient
    private int qtdCotacoes;
    @Transient
    private Cotacao cotacaoCasa;
    @Transient
    private Cotacao cotacaoEmpate;
    @Transient
    private Cotacao cotacaoFora;
    
    public Jogo(){
        this.cotacoes = new ArrayList<>();
    }
    
    public void addCotacao(Cotacao cotacao){
        this.cotacoes.add(cotacao);
    }

    public void removerCotacao(Cotacao cotacao){
        this.cotacoes.remove(cotacao);
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Campeonato getCampeonato() {
        return campeonato;
    }

    public void setCampeonato(Campeonato campeonato) {
        this.campeonato = campeonato;
    }

    public Time getMandante() {
        return mandante;
    }

    public void setMandante(Time mandante) {
        this.mandante = mandante;
    }

    public Time getVisitante() {
        return visitante;
    }

    public void setVisitante(Time visitante) {
        this.visitante = visitante;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getData() {
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return df.format(data);
    }
    
    public Date getDataDate(){
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public List<Cotacao> getCotacoes() {
        return cotacoes;
    }

    public void setCotacoes(List<Cotacao> contacoes) {
        this.cotacoes = contacoes;
    }

    public int getQtdCotacoes() {
        return cotacoes.size();
    }

    public void setQtdCotacoes(int qtdCotacoes) {
        this.qtdCotacoes = qtdCotacoes;
    }

    public Cotacao getCotacaoCasa() {
        Cotacao cotacao = null;
        for(Cotacao c : cotacoes){
            if(c.getNome().equals("Casa")){
                cotacao = c;
                break;
            }
        }
        return cotacao;
    }

    public void setCotacaoCasa(Cotacao cotacaoCasa) {
        this.cotacaoCasa = cotacaoCasa;
    }

    public Cotacao getCotacaoEmpate() {
        Cotacao cotacao = null;
        for(Cotacao c : cotacoes){
            if(c.getNome().equals("Empate")){
                cotacao = c;
                break;
            }
        }
        return cotacao;
    }

    public void setCotacaoEmpate(Cotacao cotacaoEmpate) {
        this.cotacaoEmpate = cotacaoEmpate;
    }

    public Cotacao getCotacaoFora() {
        Cotacao cotacao = null;
        for(Cotacao c : cotacoes){
            if(c.getNome().equals("Fora")){
                cotacao = c;
                break;
            }
        }
        return cotacao;
    }

    public void setCotacaoFora(Cotacao cotacaoFora) {
        this.cotacaoFora = cotacaoFora;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 89 * hash + Objects.hashCode(this.data);
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
        final Jogo other = (Jogo) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.data, other.data)) {
            return false;
        }
        return true;
    }
    
    
    
}
