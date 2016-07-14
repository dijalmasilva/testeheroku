/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive;

import com.recursive.core.exceptions.ApostadorNaoEncontradoException;
import com.recursive.core.service.AdminService;
import com.recursive.core.service.ApostadorService;
import com.recursive.entidades.entidades.Aposta;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Bilhete;
import com.recursive.entidades.entidades.Cotacao;
import com.recursive.entidades.entidades.Jogo;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Marcelo Augusto
 */
@Controller
public class ApostadorController {

    @Inject
    private ApostadorService apostadorService;
    @Inject
    private AdminService adminService;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        request.getSession().setAttribute("campeonatos", adminService.listarCampeonatos());
        request.getSession().setAttribute("jogos", apostadorService.listarJogosDisponiveis());
        return "index";
    }
    
    @RequestMapping("/jogosPorCampeonato")
    public String visuzalizarJogosPorCampeonato(HttpServletRequest request){
        long idCampeonato = Long.parseLong(request.getParameter("idCampeonato"));
        List<Jogo> jogos = apostadorService.listarJogosPorCampeonato(idCampeonato);
        request.getSession().setAttribute("jogos", jogos);
        return "index";
    }

    @RequestMapping("/autenticar")
    public String autenticarApostador(HttpServletRequest request) {
        try {
            if (apostadorService.autenticarUsuario(request.getParameter("user"), request.getParameter("password"))) {
                request.getSession().setAttribute("apostador",
                        apostadorService.buscarApostadorPorEmail(request.getParameter("user")));
            }
        } catch (ApostadorNaoEncontradoException ex) {
            request.setAttribute("dadosInvalidos", true);
        }
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute("apostadorLogado", false);
        request.getSession().removeAttribute("apostador");
        return "index";
    }

    @RequestMapping("/partida")
    public String verCotacoesDaPartida(HttpServletRequest request, HttpServletResponse responce) {
        long idJogo = Long.parseLong(request.getParameter("idJogo"));
        Jogo jogo = apostadorService.buscarJogoPorId(idJogo);
        request.setAttribute("jogo", jogo);
        return "partida";
    }

    @RequestMapping("/addAposta")
    @ResponseBody
    public String adicionarAposta(HttpServletRequest request) {
        long idJogo = Long.parseLong(request.getParameter("idJogo"));
        long idCotacao = Long.parseLong(request.getParameter("idCotacao"));

        Aposta aposta = new Aposta();
        aposta.setId(System.currentTimeMillis());
        aposta.setJogo(apostadorService.buscarJogoPorId(idJogo));
        Cotacao cotacao = apostadorService.buscarCotacaoPorId(idCotacao);
        aposta.setCotacaoEscolhida(new Cotacao(cotacao.getNome(), cotacao.getValor()));

        Bilhete bilhete = (Bilhete) request.getSession().getAttribute("bilhete");
        bilhete.addAposta(aposta);
        bilhete.setValorPremio(bilhete.getValorPremio().multiply(aposta.getCotacaoEscolhida().getValor()));

        request.getSession().setAttribute("bilhete", bilhete);
        return bilhete.getValorPremio().toString();
    }

    @RequestMapping("/removerAposta")
    @ResponseBody
    public String removerAposta(HttpServletRequest request) {
        long idJogo = Long.parseLong(request.getParameter("idJogo"));
        Bilhete bilhete = (Bilhete) request.getSession().getAttribute("bilhete");
        Aposta aposta = null;
        for (Aposta a : bilhete.getApostas()) {
            if (a.getJogo().getId() == idJogo) {
                aposta = a;
                break;
            }
        }

        bilhete.removerAposta(aposta);

        if (bilhete.getApostas().size() == 0) {
            bilhete.setValorPremio(BigDecimal.ZERO);
        } else {
            bilhete.setValorPremio(bilhete.getValorPremio().divide(aposta.getCotacaoEscolhida().getValor()));
        }

        request.getSession().setAttribute("bilhete", bilhete);
        return bilhete.getValorPremio().toString();
    }

    @RequestMapping("/alterarValorAposta")
    @ResponseBody
    public String alterarValorAposta(HttpServletRequest request) {
        double valor = Double.parseDouble(request.getParameter("valor"));
        Bilhete bilhete = (Bilhete) request.getSession().getAttribute("bilhete");
        bilhete.setValorPremio(BigDecimal.ZERO);
        bilhete.setValorApostado(new BigDecimal(valor));

        if (bilhete.getApostas().size() > 0) {
            bilhete.setValorPremio(bilhete.getValorApostado());
            for (Aposta a : bilhete.getApostas()) {
                bilhete.setValorPremio(bilhete.getValorPremio().multiply(a.getCotacaoEscolhida().getValor()));
            }
        }

        request.getSession().setAttribute("bilhete", bilhete);
        return bilhete.getValorPremio().toString();
    }

    @RequestMapping("/salvarBilhete")
    public void salvarBilhete(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream out = null;
        try {
            Bilhete bilhete = (Bilhete) request.getSession().getAttribute("bilhete");
            Apostador apostador = (Apostador) request.getSession().getAttribute("apostador");
            bilhete.setCliente(request.getParameter("cliente"));
            bilhete.setId(System.currentTimeMillis());
            bilhete.setOperador(apostador.getNome());
//            apostador.adicionarBilhete(bilhete);
            apostadorService.salvarBilhete(bilhete);
            apostadorService.salvarApostador(apostador);
            request.getSession().setAttribute("bilhete", new Bilhete());
            byte[] bytes = apostadorService.exportarBilheteParaPDF(bilhete);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            out = response.getOutputStream();
            out.write(bytes, 0, bytes.length);
            out.flush();
            out.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        } 
    }

}
