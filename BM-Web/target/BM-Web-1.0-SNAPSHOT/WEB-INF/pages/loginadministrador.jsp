<%-- 
    Document   : loginadministrador
    Created on : 13/05/2016, 10:58:08
    Author     : Marcelo Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <a class="navbar-brand" href="../../">
                            <!--    <img alt="Brand" height="25" width="30" src="/imagens/logo.png"> -->
                            <b >Bets Mundo</b>
                        </a>
                    </div>                    
                </div>
            </nav>
        </header> 

        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2" id="alertLogin">
                    <c:if test="${dadosInvalidos == true}">
                        <div class="alert alert-danger fade in">
                            <strong>Usuário ou senha inválidos!</strong>
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-xs-12 col-md-offset-3" id="formularioLogin">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="media-heading text-center" >Login de administrador</h2>                            
                        </div>
                        <form class="form-horizontal" action="/admin/autenticar" method="post">
                            <div class="panel-body">
                                <div >
                                    <label class="col-md-offset-1">Email</label>
                                    <div class="form-group">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">
                                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                                </span>
                                                <input type="email" name="email" class="form-control" id="inputUser" placeholder="Email" required="on">
                                            </div>
                                        </div>
                                    </div>
                                    <label class="col-md-offset-1">Senha</label>
                                    <div class="form-group">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">
                                                    <img src="../../imagens/locked.png" height="15">
                                                </span>
                                                <input type="password" name="senha" class="form-control" id="inputSenhaLogin" placeholder="Senha" required="on">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group" id="checkLembrar">
                                        <div class="col-md-7 col-md-offset-1">
                                            <div class="checkbox">
                                                <label><input type="checkbox">Lembrar-me</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-1">
                                        <button type="submit" id="btEntrar" class="btn btn-lg btn-success">Entrar</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
