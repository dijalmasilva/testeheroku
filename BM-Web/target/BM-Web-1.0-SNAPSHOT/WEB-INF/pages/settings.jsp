<%-- 
    Document   : settings
    Created on : 09/07/2016, 10:39:28
    Author     : Marcelo Augusto
--%>

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
        <div id="modalStatus" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">${contentHeader}</h4>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-success">
                            <strong>${statusOperacao}</strong>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${statusOperacao != null}">
            <script language='JavaScript'>
                $("#modalStatus").modal('show');
            </script>
        </c:if>

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

            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>Configurações da conta</b>
                    </div>
                    <div class="panel-body">
                        <form action="alterarDadosDeAdmin" class="form-horizontal" method="post">
                            <input type="hidden" name="id" value="${admin.id}">
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" value="${admin.login}" class="form-control" id="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="senha" class="col-sm-2 control-label">Senha atual</label>
                                <div class="col-sm-10">
                                    <input type="password" name="senhaAtual" class="form-control" id="senha" placeholder="Senha">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="novaSenha" class="col-sm-2 control-label">Nova senha</label>
                                <div class="col-sm-10">
                                    <input type="password" name="novaSenha" class="form-control" id="novaSenha" placeholder="Nova senha">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirmarSenha" class="col-sm-2 control-label">Confirmar nova senha</label>
                                <div class="col-sm-10">
                                    <input type="password" name="confirmarSenha" class="form-control" id="confirmarSenha" placeholder="Nova senha">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-success">Salvar alterações</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

