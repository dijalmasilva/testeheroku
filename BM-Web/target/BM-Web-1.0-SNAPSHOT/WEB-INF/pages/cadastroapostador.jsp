<%-- 
    Document   : cadastroalunos
    Created on : 03/03/2016, 20:18:05
    Author     : Marcelo Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de apostador</title>
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css">
        <link  href="/css/style.css" rel="stylesheet" type="text/css">
        <script src="/assets/js/jquery.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.js" type="text/javascript"></script>    
        <meta name="viewport" content="width=device-width, minimum=scale= 1.0, initial=scale=1, user-scalable=yes"/>      
    </head>
    <body id="indexBody">
        <header>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid" >
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-header" >
                        <a class="navbar-brand" href="/admin/">
                            <!--    <img alt="Brand" height="25" width="30" src="/imagens/logo.png"> -->
                            <b >Bets Mundo</b>
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav"> 
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastrar<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="cadastroapostador">Apostador</a></li>
                                    <li><a href="cadastrojogo">Campeonatos, times e jogos</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Visualizar<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="apostadores">Apostadores</a></li>
                                    <li><a href="#">Jogos</a></li>
                                    <li><a href="#">Apostas realizadas</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header> 

        <div class="container">
            <div id="conteudoCadastroTurma" class="col-md-8 col-md-offset-2">            
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="media-heading text-center"><span class="glyphicon glyphicon-user"></span> Cadastrar novo apostador</h2>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="cadastrarApostador">                   
                            <div class="form-group" >
                                <div class="col-md-12">
                                    <label for="nome">Nome completo</label>
                                    <input type="text" name="nome" required="on" class="form-control" id="nomeTurma" placeholder="Nome completo">
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" required="on" class="form-control" id="email" placeholder="Email">
                                </div>
                                <div class="col-md-4">
                                    <label for="telefone">Telefone</label>
                                    <input type="text" name="telefone" required="on" class="form-control" id="telefone" placeholder="Telefone">
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="col-md-4">
                                    <label for="cpf">CPF</label>
                                    <input type="text" name="cpf" required="on" class="form-control" id="cpf" placeholder="CPF" >
                                </div>
                                <div class="col-md-4">
                                    <label for="rg">RG</label>
                                    <input type="text" name="rg" required="on" class="form-control" id="rg" placeholder="RG">
                                </div>
                                <div class="col-md-4">
                                    <label for="estado">Estado</label>
                                    <input type="text" name="estado" required="on" class="form-control" id="estado" placeholder="Estado">
                                </div>
                            </div>                             
                            <div class="form-group" >
                                <div class="col-md-7">
                                    <label for="cidade">Cidade</label>
                                    <input type="text" name="cidade" required="on" class="form-control" id="cidade" placeholder="Cidade">
                                </div>
                                 <div class="col-md-5">
                                    <label for="bairro">Bairro</label>
                                    <input type="text" name="bairro" required="on" class="form-control" id="bairro" placeholder="Bairro">
                                </div>
                            </div> 
                            
                            <div class="form-group" >
                                <div class="col-md-10">
                                    <label for="rua">Rua</label>
                                    <input type="text" name="rua" required="on" class="form-control" id="rua" placeholder="Rua">
                                </div>
                                <div class="col-md-2">
                                    <label for="numero">Número</label>
                                    <input type="text" name="numero" required="on" class="form-control" id="numero" placeholder="Número" >
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="senha">Senha</label>
                                    <input type="password" name="senha" required="on" class="form-control" id="senha" >
                                </div>
                                <div class="col-md-6">
                                    <label for="confirmacao">Confirmar senha</label>
                                    <input type="password" name="confirmacao" required="on" class="form-control" id="confirmacao">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-4">
                                    <button type="submit" class="botaoSalvar btn btn-success btn-lg">
                                        <span class="glyphicon glyphicon-floppy-disk"></span>Adicionar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>