/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.service;

import com.recursive.core.exceptions.ApostadorNaoEncontradoException;
import com.recursive.entidades.entidades.Aposta;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Bilhete;
import com.recursive.entidades.entidades.Cotacao;
import com.recursive.entidades.entidades.Jogo;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Marcelo Augusto
 */

@Service
public interface ApostadorService {
    
    public boolean autenticarUsuario(String email, String senha)throws ApostadorNaoEncontradoException;

    public List<Jogo> listarJogosDisponiveis();   

    public boolean jogoDisponivel(Jogo jogo);

    public Apostador buscarApostadorPorEmail(String email)throws ApostadorNaoEncontradoException;

    public Jogo buscarJogoPorId(long idJogo);

    public void salvarBilhete(Bilhete bilhete);    

    public void salvarAposta(Aposta aposta);

    public Cotacao buscarCotacaoPorId(long idCotacao);

    public byte[] exportarBilheteParaPDF(Bilhete bilhete);
    
    public void salvarApostador (Apostador apostador);

    public List<Jogo> listarJogosPorCampeonato(long idCampeonato);
    
}
