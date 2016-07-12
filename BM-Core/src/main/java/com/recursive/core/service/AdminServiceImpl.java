/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.service;

import com.google.common.collect.Lists;
import com.recursive.core.repository.AdministradorRepository;
import com.recursive.core.repository.ApostadorRepository;
import com.recursive.core.repository.CampeonatoRepository;
import com.recursive.core.repository.JogoRepository;
import com.recursive.core.repository.TimeRepository;
import com.recursive.entidades.entidades.Administrador;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Campeonato;
import com.recursive.entidades.entidades.Jogo;
import com.recursive.entidades.entidades.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Marcelo Augusto
 */
@Named
public class AdminServiceImpl implements AdminService {

    @Inject
    private CampeonatoRepository daoCampeonato;
    @Inject
    private JogoRepository daoJogo;
    @Inject
    private TimeRepository daoTime;
    @Inject
    private ApostadorRepository daoApostador;
    @Inject
    private AdministradorRepository daoAdministrador;

    @Override
    public Administrador autenticarUsuario(String email, String senha) {
        Administrador administrador = null;
        try {
            administrador = daoAdministrador.buscarPorEmail().get(0);
        } catch (IndexOutOfBoundsException e) {
            administrador = new Administrador();
            administrador.setLogin("admin@email.com");
            administrador.setSenha("123456");
            daoAdministrador.save(administrador);
        }
        if (!email.equals(administrador.getLogin()) && !senha.equals(administrador.getSenha())) {
            return null;
        }
        return administrador;
    }

    @Override
    public void salvarApostador(Apostador apostador) {
        daoApostador.save(apostador);
    }

    @Override
    public List<Apostador> getApostadores() {
        return Lists.newArrayList(daoApostador.findAll());
    }

    @Override
    public void salvarCampeonato(Campeonato campeonato) {
        daoCampeonato.save(campeonato);
    }

    @Override
    public List<Campeonato> listarCampeonatos() {
        return Lists.newArrayList(daoCampeonato.findAll());
    }

    @Override
    public Campeonato buscarCampeonato(String nome) {
        return daoCampeonato.buscarPorNome(nome).get(0);
    }

    @Override
    public void salvarJogo(Jogo jogo) {
        daoJogo.save(jogo);
    }

    @Override
    public List<Jogo> listarJogos() {
        return Lists.newArrayList(daoJogo.findAll());
    }

    @Override
    public void salvarTime(Time time) {
        daoTime.save(time);
    }

    @Override
    public List<Time> listarTimes() {
        return Lists.newArrayList(daoTime.findAll());
    }

    @Override
    public Time buscarTimePorNome(String mandante) {
        return daoTime.buscarPorNome(mandante);
    }

    @Override
    public List<Apostador> listarApostadores() {
        return Lists.newArrayList(daoApostador.findAll());
    }

    @Override
    public Apostador buscarApostador(long id) {
        return daoApostador.findOne(id);
    }

    @Override
    public Date coverterData(String data) {
        String d = data.substring(0, 10);
        String h = data.substring(11, 16);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            return format.parse(d + " " + h);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Jogo buscarJogo(long id) {
        return daoJogo.findOne(id);
    }

    @Override
    public Administrador buscarAdministrador(long id) {
        return daoAdministrador.findOne(id);
    }

    @Override
    public void salvarAdministrador(Administrador administrador) {
        daoAdministrador.save(administrador);
    }

}
