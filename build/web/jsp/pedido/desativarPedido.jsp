<%-- 
    Document   : desativarPedido
    Created on : 03/11/2019, 01:39:15
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
    <title>DESATIVAR PEDIDO - WTT</title>
    <body>
        <div class="container"/>
        <h2>DESATIVAR PEDIDO</h2>

        <form class="form-inline" name="FORMBUSCARPESSOA" action="desativarPedido.jsp" method="post">
            <div class="form-group row">
                <label for="inputIdPessoa" class="col-sm-2 col-form-label">ID Pedido:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputIdPessoa" placeholder="000" name="inputIdPessoa">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR PEDIDO</button>
        </form>            

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

            if (idPessStr != null) {
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
            } else {
                pedSai = null;
            }

        %>

        <br>
        <br>

        <%        if (pedSai != null) {%>


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
    </div>
                
       <br>
        <br>

        <form name="inseriPessoa" action="validaDesativarPedido.jsp" method="post">
            <div class="form-group mb-2">
                <label for="staticIdPessoa">ID Pedido que ira ser alterado</label>
                <input type="text" readonly class="form-control-plaintext" id="staticIdPessoa" name="staticIdPessoa" value="<%=pedSai.getIdPedido()%>">
            </div>          
            
            <div class="a">
                <button type="submit" class="btn btn-primary">DESATIVAR</button>
                <br>
                <br>
            </div>
        </form>                
                

    <%}%>
</body>
</html>

