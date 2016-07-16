/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.service;

import com.recursive.core.exceptions.ApostadorNaoEncontradoException;
import com.recursive.core.relatorios.BilheteDataSource;
import com.recursive.core.repository.ApostaRepository;
import com.recursive.core.repository.ApostadorRepository;
import com.recursive.core.repository.BilheteRepository;
import com.recursive.core.repository.CotacaoRepository;
import com.recursive.core.repository.JogoRepository;
import com.recursive.entidades.entidades.Aposta;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Bilhete;
import com.recursive.entidades.entidades.Cotacao;
import com.recursive.entidades.entidades.Jogo;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.inject.Named;
//import net.sf.jasperreports.engine.JasperExportManager;
//import net.sf.jasperreports.engine.JasperFillManager;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperReport;
//import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author Marcelo Augusto
 */
@Named
public class ApostadorServiceImpl implements ApostadorService {

    @Inject
    private JogoRepository daoJogo;
    @Inject
    private ApostadorRepository daoApostador;
    @Inject
    private BilheteRepository daoBilhete;
    @Inject
    private ApostaRepository daoAposta;
    @Inject
    private CotacaoRepository daoCotacao;

    @Override
    public boolean autenticarUsuario(String email, String senha) throws ApostadorNaoEncontradoException {
        try {
            Apostador apostador = daoApostador.buscarPorEmail(email).get(0);
            if (apostador != null && apostador.getSenha().equals(senha)) {
                return true;
            }
        } catch (Exception ex) {
            throw new ApostadorNaoEncontradoException();
        }
        return false;
    }

    @Override
    public Apostador buscarApostadorPorEmail(String email) throws ApostadorNaoEncontradoException {
        try {
            return daoApostador.buscarPorEmail(email).get(0);
        } catch (Exception ex) {
            throw new ApostadorNaoEncontradoException();
        }
    }

    @Override
    public List<Jogo> listarJogosDisponiveis() {
        List<Jogo> jogos = new ArrayList<>();
        for (Jogo jogo : daoJogo.findAll()) {
            if (jogoDisponivel(jogo)) {
                jogos.add(jogo);
            }
        }
        return jogos;
    }

    @Override
    public boolean jogoDisponivel(Jogo jogo) {
        if (jogo.getDataDate().compareTo(new Date()) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Jogo buscarJogoPorId(long idJogo) {
        return daoJogo.findOne(idJogo);
    }

    @Override
    public void salvarBilhete(Bilhete bilhete) {
        daoBilhete.save(bilhete);
    }

    @Override
    public void salvarAposta(Aposta aposta) {
        daoAposta.save(aposta);
    }

    @Override
    public Cotacao buscarCotacaoPorId(long idCotacao) {
        return daoCotacao.findOne(idCotacao);
    }

//    @Override
//    public byte[] exportarBilheteParaPDF(Bilhete bilhete) {
//        try {
//            InputStream inputStream = Files.newInputStream(Paths.get(getClass().getResource("/relatorios/Bilhete.jasper").toURI()));
//            JasperReport jasperReport;
//            jasperReport = (JasperReport) JRLoader.loadObject(inputStream);
//            BilheteDataSource bilheteDataSource = new BilheteDataSource(bilhete.getApostas());
//            Map<String, Object> parametros = new HashMap<>();
//            String cliente = bilhete.getCliente();
//            if(bilhete.getCliente() == null){
//                cliente = "Não informado";
//            }
//            parametros.put("cliente", cliente);
//            parametros.put("valorApostado", String.format("%9.2f", bilhete.getValorApostado()));
//            parametros.put("valorPremio", String.format("%9.2f",bilhete.getValorPremio()));
//            bilhete.setDataAposta(new Date());
//            parametros.put("dataAposta", bilhete.getDataAposta());
//            parametros.put("operador", bilhete.getOperador());
//            parametros.put("qtdJogos", ""+bilhete.getApostas().size());
//            parametros.put("idBilhete", ""+bilhete.getId());
//            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, bilheteDataSource);
//            return JasperExportManager.exportReportToPdf(jasperPrint);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

    @Override
    public void salvarApostador(Apostador apostador) {
        daoApostador.save(apostador);
    }

    @Override
    public List<Jogo> listarJogosPorCampeonato(long idCampeonato) {
        List<Jogo> jogos = new ArrayList<>();
        for (Jogo jogo : daoJogo.buscarPorCampeonato(idCampeonato)) {
            if (jogoDisponivel(jogo)) {
                jogos.add(jogo);
            }
        }
        return jogos;
    }

    @Override
    public byte[] exportarBilheteParaPDF(Bilhete bilhete) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
