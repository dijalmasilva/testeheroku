/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function removerAposta(id) {
    var aposta = document.getElementById(id);
    document.getElementById("apostas").removeChild(aposta);
    $.get(
            "/removerAposta",
            {idJogo: id},
    function (response) {
        document.getElementById('valorPremio').innerHTML =
                '<b class="h4">Possível retorno <span style="margin-left: 12%" class="label label-default" >R$ ' + response + '</span></b>';
    }
    );
}
function adicionarAposta(idJogo, idCotacaoEscolhida, mandante, visitante, cotacao, valor) {
    $.get(
            "/addAposta",
            {idJogo: idJogo, idCotacao: idCotacaoEscolhida},
    function (response) {
        document.getElementById('valorPremio').innerHTML =
                '<b class="h4">Possível retorno <span style="margin-left: 12%" class="label label-default" >R$ ' + response + '</span></b>';
    }
    );
    document.getElementById("apostas").innerHTML +=
            "<div class='aposta' id='" + idJogo + "'>\n\
                            <a onclick='removerAposta(" + idJogo + ")' class='btn-remover-aposta'>\n\
                            <span class='glyphicon glyphicon-minus-sign'></span></a>\n\
                            <b>" + mandante + " X " + visitante + "</b>\n\
                            <p>" + cotacao + " <b>R$ " + valor + "</b></p>\n\
                        </div>";
}

function alterarValor() {
    $.get(
            '/alterarValorAposta',
            {valor: document.getElementById("inputValor").value},
    function (responseText) {
        document.getElementById('valorPremio').innerHTML = '<b class="h4">Possível retorno <span style="margin-left: 12%" class="label label-default" >R$ ' + responseText + '</span></b>';
    }
    );
}