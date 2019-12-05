<%-- 
    Document   : validaDesativarPedido
    Created on : 03/11/2019, 02:30:56
    Author     : renat

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.modelo.Pedido"%>
<%@page import="concessionariaWtt.modelo.ClientePedido"%>
<%@page import="concessionariaWtt.controle.PedidoControle"%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ATIVAR/DESATIVAR PESSOA - WTT</title>
    <body>
        <div class="container"/>
        <h2>ATIVAR/DESATIVAR PESSOA</h2>
        <%

            //DESATIVA PESSOA
            String idStri = request.getParameter("staticIdPessoa");
            String situacao = request.getParameter("gridRadios");
            long idPess = Long.parseLong(idStri);

            Pedido pedEnt = new Pedido(idPess, null, null, null, null, null, null);
            Pedido pedSai = new Pedido();

            PedidoControle pedCon = new PedidoControle();

           try {
                pedSai = pedCon.excluiPedido(pedEnt);
           } catch (Exception e) {
                pedSai = null;
                //System.err.println(e);
           }

            if (pedSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao desativar!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div> 


        <%} else {%>

        <div class="alert alert-danger" role="alert">
            <strong>Erro ao desativar!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
