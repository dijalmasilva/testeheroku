<%-- 
    Document   : cadastrocampeonato
    Created on : 14/03/2016, 22:47:39
    Author     : Marcelo Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de campeonato</title>
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css">
        <link  href="/css/style.css" rel="stylesheet" type="text/css">
        <script src="/assets/js/jquery.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.js" type="text/javascript"></script>    
        <meta name="viewport" content="width=device-width, minimum=scale= 1.0, initial=scale=1, user-scalable=yes"/>      
        <script>
            function addCotacao() {
                var nome = document.getElementById('nomeCotacao').value;
                var valor = document.getElementById('valor').value;
                document.getElementById("cotacoesExtras").innerHTML += '<div class="col-md-3"><label>' + nome +
                        '</label><input type="number" value="' + valor + '" name="valor' + nome + '" required="on" class="form-control" ' +
                        ' placeholder="valor R$"><input type="hidden" name="' + nome + '" value="' + nome + '"></div>';
            }
        </script>
        <script>
            function submeterForm(){
                document.getElementById("formCadastrarJogo").submit();
            }
        </script>
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
                            <b>Bets Mundo</b>
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
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="media-heading text-center"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Cadastrar nova partida</h2>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="/admin/cadastrarJogo" id="formCadastrarJogo">  
                            <fieldset>
                                <legend>Informações da partida</legend>
                                <label for="campeonato">Campeonato</label>
                                <div class="form-group" >
                                    <div class="col-md-12">
                                        <input type="text" name="campeonato" required="on" class="form-control" id="campeonato" placeholder="Campeonato" list="campeonatos">
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <div class="col-md-6">
                                        <label for="mandante">Mandante</label>
                                        <input type="text" name="mandante" required="on" class="form-control" id="mandante" placeholder="Time mandante" list="times">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="visitante">Visitante</label>
                                        <input type="text" name="visitante" required="on" class="form-control" id="visitante" placeholder="Time visitante" list="times">
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <div class="col-md-6">
                                        <label for="data">Data e horário da partida</label>
                                        <input type="datetime-local" name="data" required="on" class="form-control" id="data" placeholder="Data e horário da partida">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="local">Local da partida (opcional)</label>
                                        <input type="text" name="local" required="on" class="form-control" id="local" placeholder="Local da partida">
                                    </div>                      
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Cotações para esta partida</legend>
                                <div class="form-group" >
                                    <div class="col-md-3">
                                        <label for="mandante">Casa</label>
                                        <input type="hidden" name="Casa" value="Casa">
                                        <input type="number" name="valorCasa" required="on" class="form-control" id="mandante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Empate</label>
                                        <input type="hidden" name="Empate" value="Empate">
                                        <input type="number" name="valorEmpate" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="fora">Fora</label>
                                        <input type="hidden" name="Fora" value="Fora">
                                        <input type="number" name="valorFora" required="on" class="form-control" id="fora" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Casa 1.5</label>
                                        <input type="hidden" name="Casa1.5" value="Casa 1.5">
                                        <input type="number" name="valorCasa1.5" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <label for="mandante">Fora 1.5</label>
                                        <input type="hidden" name="Fora1.5" value="Fora 1.5">
                                        <input type="number" name="valorFora1.5" required="on" class="form-control" id="mandante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Casa X2</label>
                                        <input type="hidden" name="CasaX2" value="Casa X2">
                                        <input type="number" name="valorCasaX2" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Visitante X2</label>
                                        <input type="hidden" name="VisitanteX2" value="Visitante X2">
                                        <input type="number" name="valorVisitanteX2" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Ambos</label>
                                        <input type="hidden" name="Ambos" value="Ambos">
                                        <input type="number" name="valorAmbos" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <label for="mandante">Jogo acima 2.5</label>
                                        <input type="hidden" name="JogoAcima2.5" value="Jogo acima 2.5">
                                        <input type="number" name="valorJogoAcima2.5" required="on" class="form-control" id="mandante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Jogo abaixo 2.5</label>
                                        <input type="hidden" name="JogoAbaixo2.5" value="Jogo abaixo 2.5">
                                        <input type="number" name="valorJogoAbaixo2.5" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="visitante">Apenas 1 marca</label>
                                        <input type="hidden" name="Apenas1Marca" value="Apenas 1 marca">
                                        <input type="number" name="valorApenas1Marca" required="on" class="form-control" id="visitante" placeholder="valor R$">
                                    </div>
                                    <div id="cotacoesExtras"></div>
                                </div>
                            </fieldset>
                        </form>
                        <fieldset>
                            <legend>Cotações extras (opcional)</legend>
                            <div class="form-inline">
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <label class="control-label" for="nomeCotacao">Nome da cotação</label>
                                        <input type="text" name="nomeCotacao" class="form-control" id="nomeCotacao" placeholder="Nome da cotação">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="valor">Valor</label>
                                        <input type="number" name="valor" class="form-control" id="valor" placeholder="valor R$">
                                    </div>
                                    <div class="col-md-4">
                                        <br> 
                                        <button style="width: 100%;"  onclick="addCotacao()" type="button" class="btn btn-default">
                                            <span class="glyphicon glyphicon-plus"></span> Adicionar cotação
                                        </button>
                                    </div>
                                </div>
                            </div> 
                        </fieldset>
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 0px">
                            <br> 
                            <button type="button" onclick="submeterForm()" style="width: 100%"class="btn btn-success">
                                <span class="glyphicon glyphicon-ok"></span> Salvar partida
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 " style="margin-top: 0px;" >
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Cadastrar novo campeonato</h4>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="/admin/cadastrarCampeonato">  
                            <label for="nome">Nome do campeonato</label>
                            <div class="form-group" >
                                <div class="col-md-12">
                                    <input type="text" name="nome" required="on" class="form-control" id="nome" placeholder="Nome do campeonato">
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-md-6">
                                    <button type="submit" style=""class="btn btn-default">Adicionar campeonato</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Cadastrar novo time</h4>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="/admin/cadastrarTime">  
                            <label for="nome">Nome do time</label>
                            <div class="form-group" >
                                <div class="col-md-12">
                                    <input type="text" name="nome" required="on" class="form-control" id="nome" placeholder="Nome do time">
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-md-6">
                                    <button type="submit" style=""class="btn btn-default">Adicionar time</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <datalist id="campeonatos">
            <c:forEach items="${campeonatos}" var="campeonato">
                <option value="${campeonato.nome}"></option>
            </c:forEach>
        </datalist>
        <datalist id="times">
            <c:forEach items="${times}" var="time">
                <option value="${time.nome}"></option>
            </c:forEach>
        </datalist>
    </body>
</html>
