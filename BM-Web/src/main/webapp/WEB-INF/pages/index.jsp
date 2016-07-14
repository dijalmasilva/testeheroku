<%-- 
    Document   : index
    Created on : 28/05/2016, 15:13:00
    Author     : Marcelo Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bets Mundo</title>
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css">
        <link  href="/css/style.css" rel="stylesheet" type="text/css">
        <script src="/assets/js/jquery.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.js" type="text/javascript"></script>    
        <script src="/assets/js/apostaController.js" type="text/javascript"></script>
        <link href="/imagens/logo.png" type="image/png" rel="icon"/>
        <meta name="viewport" content="width=device-width, minimum=scale= 1.0, initial=scale=1, user-scalable=yes"/>
    </head>
    <body id="indexBody"> 
        <c:if test="${bilhete == null}">
            <jsp:useBean id="bilhete" scope="session" class="com.recursive.entidades.entidades.Bilhete"></jsp:useBean>
        </c:if>
        <div id="modalApostadorNaoLogado" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Operador não logado</h4>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger">
                            <strong>Para continuar é necessário efetura o login!</strong>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                    </div>
                </div>
            </div>
        </div>
        <header>
            <c:choose>
                <c:when test="${apostador == null}">
                    <%@include file="include-apostador-nao-logado.jsp" %>
                </c:when>
                <c:otherwise>
                    <%@include file="include-apostador-logado.jsp" %>
                </c:otherwise>
            </c:choose>                      
        </header>
        <div class="container">
            <div class="col-md-2" style="padding: 0px;">
                <ul class="list-group">
                    <li class="list-group-item active">Campeonatos</li>
                    <li class="list-group-item">
                            <a href="/">Todos os jogos</a>
                        </li>    
                    <c:forEach var="campeonato" items="${campeonatos}">
                        <li class="list-group-item">
                            <a href="/jogosPorCampeonato?idCampeonato=${campeonato.id}">${campeonato.nome}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-7">
                <ul class="list-group">
                    <li class="list-group-item active">
                        <p class="h3" style="margin: 0px;">
                            <span><img src="../../imagens/ball.png" height="25"></span> Próximos jogos
                        </p>
                    </li>
                    <c:forEach var="jogo" items="${jogos}">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a href="/partida?idJogo=${jogo.id}">
                                        <p class="h4">${jogo.mandante.nome} X ${jogo.visitante.nome}</p> 
                                    </a>
                                    <p class="h5"><span class="glyphicon glyphicon-calendar"></span> ${jogo.data}</p> 
                                </div>
                                <div class="col-md-5">
                                    <p class="h5 text-right" style="margin-top: 0px;"><span class="label label-default">${jogo.campeonato.nome}</span>
                                    <div class="col-md-4" style="padding: 2px">
                                        <button onclick="adicionarAposta('${jogo.id}', '${jogo.cotacaoCasa.id}', '${jogo.mandante.nome}', '${jogo.visitante.nome}', '${jogo.cotacaoCasa.nome}', '${jogo.cotacaoCasa.valor}')" 
                                                style="width: 100%;" type="button" class="btn btn-info">${jogo.cotacaoCasa.valor}
                                        </button>
                                    </div>
                                    <div class="col-md-4" style="padding: 2px">
                                        <button onclick="adicionarAposta('${jogo.id}', '${jogo.cotacaoEmpate.id}', '${jogo.mandante.nome}', '${jogo.visitante.nome}', '${jogo.cotacaoEmpate.nome}', '${jogo.cotacaoEmpate.valor}')" 
                                                style="width: 100%;" type="button" class="btn btn-info">${jogo.cotacaoEmpate.valor}
                                        </button>
                                    </div>
                                    <div class="col-md-4" style="padding: 2px">
                                        <button onclick="adicionarAposta('${jogo.id}', '${jogo.cotacaoFora.id}', '${jogo.mandante.nome}', '${jogo.visitante.nome}', '${jogo.cotacaoFora.nome}', '${jogo.cotacaoFora.valor}')" 
                                                style="width: 100%;" type="button" class="btn btn-info">${jogo.cotacaoFora.valor}</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-3" id="col-apostas">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="margin-top-botom-0"><span><img src="../../imagens/ticket.png" height="25"></span> Cupons de apostas</h4>
                    </div>
                    <div class="panel-body">
                        <div id="apostas">
                            <c:forEach items="${bilhete.apostas}" var="aposta">
                                <div class='aposta' id="${aposta.jogo.id}">
                                    <a onclick="removerAposta('${aposta.jogo.id}')" class="btn-remover-aposta">
                                        <span class='glyphicon glyphicon-minus-sign'></span></a>
                                    <b>${aposta.jogo.mandante.nome} X ${aposta.jogo.visitante.nome}</b>
                                    <p>${aposta.cotacaoEscolhida.nome}<b> R$ ${aposta.cotacaoEscolhida.valor}</b></p>
                                </div>
                            </c:forEach>
                        </div>
                        <form action="/salvarBilhete" method="post">
                            <label class="col-md-12 padding-left-right-0">Valor</label>                    
                            <div class="col-md-6 padding-left-right-0">
                                <input onchange="alterarValor()" type="text" class="form-control" id="inputValor" placeholder="valor">
                            </div>
                            <label class="col-md-12 padding-left-right-0 margin-top-15">Cliente</label>
                            <div class="col-md-12 padding-left-right-0">
                                <input type="text" name="cliente" class="form-control"  placeholder="Cliente">
                            </div>
                            <br>
                            <div class="col-md-12 padding-left-right-0" style="margin-top: 10px;" id="valorPremio">
                                <b class="h4">Possível retorno <span style="margin-left: 12%" class="label label-default" >R$ ${bilhete.valorPremio}</span></b> 
                            </div>
                            <c:choose>
                                <c:when test="${apostador == null}">
                                    <button type="button" data-toggle="modal" data-target="#modalApostadorNaoLogado" class="btn btn-success margin-top-15"style="width: 100%" >
                                        Confirmar aposta
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" target="_blank" href="/salvarBilhete" class="btn btn-success margin-top-15"style="width: 100%" >
                                        Confimar aposta
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
