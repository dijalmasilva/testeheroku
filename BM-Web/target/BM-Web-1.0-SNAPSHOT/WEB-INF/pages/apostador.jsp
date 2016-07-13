<%-- 
    Document   : apostador
    Created on : 03/05/2016, 10:54:59
    Author     : Marcelo Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apostador</title>
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

            <div class="col-md-3" id="infoApostador" >
                <img class="img-responsive" width="300" src="../../imagens/man-icon.png">
                <h4 class="text-center">${apostador.nome}</h4>
                <h5><b>CPF</b> ${apostador.cpf}</h5>
                <h5><b>RG</b> ${apostador.rg}</h5>
                <h5><span class="glyphicon glyphicon-envelope"></span> ${apostador.email}</h5>
                <h5><span class="glyphicon glyphicon-earphone"></span> ${apostador.telefone}</h5>
                <h5><span class="glyphicon glyphicon-map-marker"></span> ${apostador.endereco.rua}</h5>
            </div>

            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Acompanhamento de apostas</h2>
                    </div>
                    <div class="panel-body">
                        Panel content
                    </div>
                </div>
            </div> 

        </div>

    </body>
</html>
