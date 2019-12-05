<%-- 
    Document   : validaConsultaPedidoEspecifica
    Created on : 02/11/2019, 22:43:15
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
    <title>CONSUTAR PEDIDO - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSULTAR PEDIDO ESPECIFICA</h2>
        <%

            String idPessStr = request.getParameter("inputIdPessoa");
            //buscar pessoa especifica chamada
            long idPe = 0;

            Pedido pedSai = new Pedido();
            ClientePedido cliPedSai = new ClientePedido();
            Funcionario funSai = new Funcionario(idPe, null, null);
            Cliente cliSai = new Cliente(idPe, null, null);
            Carro carSai = new Carro();

            PedidoControle pedCon = new PedidoControle();

            pedSai = new Pedido(idPe, null, null, null, null, null, null);

            if (!idPessStr.equals("")) {
                idPe = Long.parseLong(idPessStr);
                pedSai = new Pedido(idPe, null, null, null, null, null, null);
                try {
                    pedSai = pedCon.buscaPedido(pedSai, funSai);
                    funSai = pedSai.getIdFuncionario();
                    carSai = pedSai.getIdCarro();
                } catch (Exception e) {
                    pedSai = null;
                    System.err.println(e);
                }

                if (pedSai != null) {
                    try {
                        cliPedSai.setIdPedido(pedSai);
                        cliPedSai = pedCon.buscaClientePedido(pedSai, cliSai);
                        cliSai = cliPedSai.getIdCliente();
                    } catch (Exception e) {
                        pedSai = null;
                        System.err.println(e);
                    }
                }
            } else {
                pedSai = null;
            }

            if (pedSai != null && cliPedSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao buscar pessoa!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div> 

        <br>
        <br>
        <br>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Data compra</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Observação</th>
                    <th scope="col">Status</th>
                    <th scope="col">ID Funcionario</th>
                    <th scope="col">ID Cliente</th>
                    <th scope="col">ID Carro</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=pedSai.getIdPedido()%></td>
                    <td><%=pedSai.getDtCompra()%></td>
                    <td><%=pedSai.getValor()%></td>
                    <td><%=pedSai.getObservacao()%></td>
                    <td><%=pedSai.getStatus()%></td>
                    <td><%=funSai.getIdFuncionario()%></td>
                    <td><%=cliSai.getIdCliente()%></td>
                    <td><%=carSai.getIdCarro()%></td>
                </tr>
            </tbody>
        </table>

        <%} else {%>

        <div class="alert alert-danger" role="alert">
            <strong>Erro ao buscar pessoa!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>

