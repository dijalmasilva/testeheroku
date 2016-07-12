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
        <title>Apostadores</title>
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css">
        <link  href="/css/style.css" rel="stylesheet" type="text/css">
        <script src="/assets/js/jquery.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.js" type="text/javascript"></script>    
        <meta name="viewport" content="width=device-width, minimum=scale= 1.0, initial=scale=1, user-scalable=yes"/>      
        <script type="text/javascript">
            $(function () {
                $("#txtBusca").keyup(function () {
                    var texto = $(this).val().toUpperCase();
                    $("#ulItens li").css("display", "block");
                    $("#ulItens li").each(function () {
                        if ($(this).text().toUpperCase().indexOf(texto) < 0)
                            $(this).css("display", "none");
                    });
                });
            });
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
            <div id="" class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="text-center">Apostadores cadastrados</h2>
                        <div>
                            <form role="search" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" id="txtBusca" class="form-control input-sm" placeholder="Pesquisar">
                                        <span class="input-group-addon" id="sizing-addon2">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="panel-body">                                    
                        <c:choose>
                            <c:when test="${apostadores != null}">
                                <ul id="ulItens" style="list-style: none; padding-left: 0px;"> 
                                    <c:forEach var="apostador" items="${apostadores}" >
                                        <li>
                                            <c:if test="${apostador != null}">
                                                <div class="col-md-6 linkHover">
                                                    <div class="thumbnail"id="a">
                                                        <a href="/admin/apostador?id=${apostador.id}" class="linkBlack">
                                                            <div class="media">
                                                                <div class="media-left">
                                                                    <img class="media-object" src="/imagens/man-icon.png" height="85" width="85" >
                                                                </div>
                                                                <div class="media-body">
                                                                    <h4 class="media-heading">${apostador.nome}</h4>
                                                                    <h5><span class="glyphicon glyphicon-envelope"></span> ${apostador.email}</h5>
                                                                    <h5><span class="glyphicon glyphicon-earphone"></span> ${apostador.telefone}</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-danger fade in" style="margin-top:25%; margin-left: 25%; width: 60%;">
                                    <strong>Nenhum apostador cadastrado!</strong>
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                </div>
                            </c:otherwise>
                        </c:choose>	
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>