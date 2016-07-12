/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive;

import com.recursive.core.service.AdminService;
import com.recursive.entidades.entidades.Administrador;
import com.recursive.entidades.entidades.Apostador;
import com.recursive.entidades.entidades.Campeonato;
import com.recursive.entidades.entidades.Cotacao;
import com.recursive.entidades.entidades.Endereco;
import com.recursive.entidades.entidades.Jogo;
import com.recursive.entidades.entidades.Time;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Marcelo Augusto
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Inject
    private AdminService adminService;

    @RequestMapping("/login")
    public String loginAdministrador() {
        return "loginadministrador";
    }

    @RequestMapping("/autenticar")
    public String autenticarAdministrador(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(request.getParameter("email") + request.getParameter("senha"));
        Administrador administrador = adminService.autenticarUsuario(request.getParameter("email"), request.getParameter("senha"));
        if (administrador != null) {
            request.getSession().setAttribute("admin", administrador);
            request.getSession().setAttribute("campeonatos", adminService.listarCampeonatos());
            return "welcome";
        } else {
            request.setAttribute("dadosInvalidos", true);
            return "loginadministrador";
        }
    }

    @RequestMapping("/logout")
    public String logoutAdministrador(HttpServletRequest request) {
        request.getSession().invalidate();
        return "loginadministrador";
    }

    @RequestMapping("/")
    public String admin(HttpServletRequest request) {
        return "welcome";
    }

    @RequestMapping("/cadastroapostador")
    public String cadastrarApostador() {
        return "cadastroapostador";
    }

    @RequestMapping("/cadastrojogo")
    public String cadastroJogo() {
        return "cadastrojogo";
    }

    @RequestMapping("/apostadores")
    public String carregarApostadores(HttpServletRequest request) {
        List<Apostador> apostadores = adminService.listarApostadores();
        request.setAttribute("apostadores", apostadores);
        return "apostadores";
    }

    @RequestMapping("/apostador")
    public String visualizarApostador(HttpServletRequest request) {
        long id = Long.parseLong(request.getParameter("id"));
        Apostador apostador = adminService.buscarApostador(id);
        request.setAttribute("apostador", apostador);
        return "apostador";
    }

    @RequestMapping("/jogo")
    public String visualizarJogo(HttpServletRequest request) {
        long id = Long.parseLong(request.getParameter("id"));
        Jogo jogo = adminService.buscarJogo(id);
        request.setAttribute("jogo", jogo);
        return "jogo";
    }

    @RequestMapping("/cadastrarJogo")
    public String cadastrarJogo(HttpServletRequest request, HttpServletResponse reponse) {

        Map<String, String> valoresParametros = new HashMap<String, String>();
        Enumeration<String> parameterNames = request.getParameterNames();
        for (; parameterNames.hasMoreElements();) {
            String nome = parameterNames.nextElement();
            valoresParametros.put(nome, request.getParameter(nome));
        }
        Jogo jogo = new Jogo();
        jogo.setMandante(adminService.buscarTimePorNome(valoresParametros.get("mandante")));
        jogo.setVisitante(adminService.buscarTimePorNome(valoresParametros.get("visitante")));
        jogo.setLocal(valoresParametros.get("local"));
        jogo.setData(adminService.coverterData(valoresParametros.get("data")));

        for (String chave : valoresParametros.keySet()) {
            if (!chave.equals("mandante") && !chave.equals("visitante") && !chave.equals("campeonato")
                    && !chave.equals("local") && !chave.equals("data") && !chave.contains("valor")) {
                Cotacao cotacao = new Cotacao();
                cotacao.setNome(valoresParametros.get(chave));
                cotacao.setValor(new BigDecimal(Double.parseDouble(valoresParametros.get("valor" + chave))));
                jogo.addCotacao(cotacao);
            }
        }

        Campeonato campeonato = adminService.buscarCampeonato(valoresParametros.get("campeonato"));
        jogo.setCampeonato(campeonato);
        adminService.salvarJogo(jogo);
        campeonato.addJogo(jogo);
        adminService.salvarCampeonato(campeonato);
//        request.getSession().setAttribute("campeonatos", adminService.listarCampeonatos());
        return "cadastrojogo";
    }

    @RequestMapping("/cadastrarCampeonato")
    public String cadastrarCampeonato(Campeonato campeonato, HttpServletRequest request, HttpServletResponse response) {
        adminService.salvarCampeonato(campeonato);
        return "/cadastrojogo";
    }

    @RequestMapping("/cadastrarTime")
    public String cadastrarTime(Time time, HttpServletRequest request, HttpServletResponse response) {
        adminService.salvarTime(time);
        request.setAttribute("times", adminService.listarTimes());
        return "/cadastrojogo";
    }

    @RequestMapping("/cadastrarApostador")
    public String salvar(Apostador apostador, Endereco endereco, String confirmacao, HttpServletRequest request) {
        if (apostador.getSenha().equals(confirmacao)) {
            apostador.setEndereco(endereco);
            adminService.salvarApostador(apostador);
            request.getSession().setAttribute("apostadores", adminService.getApostadores());
            return "/cadastroapostador";
        }
        request.setAttribute("senhavalida", false);
        return "/cadastroapostador";
    }

    @RequestMapping("/settings")
    public String configuracoesDeConta() {
        return "settings";
    }

    @RequestMapping("/alterarDadosDeAdmin")
    public String alterarDadosDeAdmin(HttpServletRequest request) {
        Administrador administrador = adminService.buscarAdministrador(Long.parseLong(request.getParameter("id")));
        String status = "Dados alterados com sucesso!";
        if (administrador.getSenha().equals(request.getParameter("senhaAtual"))) {
            String novaSenha = request.getParameter("novaSenha");
            String confirmarSenha = request.getParameter("confirmarSenha");
            if (novaSenha.equals(confirmarSenha)) {
                administrador.setLogin(request.getParameter("email"));
                administrador.setSenha(novaSenha);
                adminService.salvarAdministrador(administrador);
            }else{
                status = "A nova senha e a confirmação devem estar iguais!";
            }
        }else{
            status = "Senha incorreta!";
        }
        request.setAttribute("statusOperacao", status);
        return "settings";
    }

}
