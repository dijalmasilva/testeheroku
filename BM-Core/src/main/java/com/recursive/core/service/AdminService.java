/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.service;

import com.recursive.entidades.entidades.Administrador;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Campeonato;
import com.recursive.entidades.entidades.Jogo;
import com.recursive.entidades.entidades.Time;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Marcelo Augusto
 */
@Service
public interface AdminService {
    
    public Administrador autenticarUsuario(String email, String senha);
    
    public void salvarCampeonato(Campeonato campeonato);
   
    public List<Campeonato> listarCampeonatos();
   
    public void salvarJogo(Jogo jogo);
   
    public List<Jogo> listarJogos();  
  
    public void salvarTime(Time time);
   
    public List<Time> listarTimes();
   
    public Time buscarTimePorNome(String mandante);
   
    public Date coverterData(String data);
    
    public List<Apostador> listarApostadores();

    public Apostador buscarApostador(long id);

    public Campeonato buscarCampeonato(String nome);

    public Jogo buscarJogo(long id);
    
    public void salvarApostador(Apostador apostador);
    
    public List<Apostador> getApostadores();

    public Administrador buscarAdministrador(long id);

    public void salvarAdministrador(Administrador administrador);
    
}
