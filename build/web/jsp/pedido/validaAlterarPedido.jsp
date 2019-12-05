<%-- 
    Document   : validaAlterarPedido
    Created on : 03/11/2019, 00:27:15
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
    <title>ALTERAR PEDIDO - WTT</title>
    <body>
        <div class="container"/>
        <h2>ALTERAR</h2>
        <%
            String idAl = request.getParameter("staticIdPed");
            String dt = request.getParameter("dt");
            String valor = request.getParameter("valor");
            String observacao = request.getParameter("observacao");
            String status = request.getParameter("status");
            String funcionario = request.getParameter("funcionario");
            String cliente = request.getParameter("cliente");
            String carro = request.getParameter("carro");
            long idCli = 0;
            long idFunc = 0;
            long idCar = 0;

            if (!funcionario.equals("") && !cliente.equals("") && !carro.equals("")) {
                idCli = Long.parseLong(cliente);
                idFunc = Long.parseLong(funcionario);
                idCar = Long.parseLong(carro);
            }

            Pedido pedSai = new Pedido(null, dt, valor, observacao, status, idCar, idFunc);
            PedidoControle pedCon = new PedidoControle();
            ClientePedido cliPed = new ClientePedido();
            Funcionario funSai = new Funcionario();
            Cliente cliSai = new Cliente();
            Carro carSai = new Carro();

            funSai.setIdFuncionario(idFunc);
            cliSai.setIdCliente(idCli);
            carSai.setIdCarro(idCar);

           try {
                pedSai.setIdPedido(Long.parseLong(idAl));
                cliSai.setIdCliente(Long.parseLong(cliente));
                funSai.setIdFuncionario(Long.parseLong(funcionario));
                carSai.setIdCarro(Long.parseLong(carro));
                pedSai = pedCon.alteraPedido(pedSai, cliSai, funSai, carSai);
                carSai = pedSai.getIdCarro();
                funSai = pedSai.getIdFuncionario();
                cliPed = pedCon.buscaClientePedido(pedSai, cliSai);
                cliSai = cliPed.getIdCliente();
            } catch (Exception e) {
                pedSai = null;
            }

            if (pedSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao alterar!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
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
            <strong>Erro ao alterar!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
