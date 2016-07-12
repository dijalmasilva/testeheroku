<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <header >
            <nav class="navbar navbar-inverse">
                <div class="container-fluid" >
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-header" >
                        <a class="navbar-brand" href="/">
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
                            <li><a href="settings"><span class="glyphicon glyphicon-cog"></span></a></li>
                            <li><a href="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header> 

        <div class="container">
            <!--            <div class="col-md-4 col-md-offset-4">
                            <img src="/imagens/logo1.png" height="250">
                        </div>-->
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="media-heading text-center"><span class="glyphicon glyphicon-list-alt"></span> Próximos jogos</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered text-center">
                            <tr class="negrito success">
                                <td class="lg-20-p">Campeonato</td>
                                <td class="lg-20-p">Mandante</td>
                                <td class="lg-20-p">Visitante</td>
                                <td class="lg-20-p">Data - horário</td>
                                <td class="lg-20-p">Cotação</td>
                            </tr>
                            <c:forEach var="campeonato" items="${campeonatos}">
                                <c:forEach var="jogo" items="${campeonato.jogos}">
                                    <tr>
                                        <td>${campeonato.nome}</td>
                                        <td colspan="2">${jogo.mandante.nome} X ${jogo.visitante.nome}</td>
                                        <td>${jogo.data}</td>
                                        <td>
                                            <a href="jogo?id=${jogo.id}">Detalhes (${jogo.qtdCotacoes})</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
