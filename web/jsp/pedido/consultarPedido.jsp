<%-- 
    Document   : consultarPedido
    Created on : 02/11/2019, 21:45:30
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.modelo.Pedido"%>
<%@page import="concessionariaWtt.modelo.ClientePedido"%>
<%@page import="concessionariaWtt.controle.PedidoControle"%>
<%@page import="java.util.List"%>


<%
    PedidoControle pedCont = new PedidoControle();
    List<Pedido> pedidos = pedCont.listaPedido();
%>

<!DOCTYPE html>
<html>

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR PEDIDO - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSUTAR PEDIDO</h2>
        <form class="form-inline" name="FORMBUSCARPESSOA" action="validaConsultaPedidoEspecifica.jsp" method="post">
            <div class="form-group row">
                <label for="inputIdPessoa" class="col-sm-2 col-form-label">ID Pedido:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputIdPessoa" placeholder="000" name="inputIdPessoa">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR PEDIDO ESPECIFICA</button>
        </form>
    </div>

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
        <% if (!(pedidos.isEmpty())) { %>    
        <tbody>
            <%
                int cont = 0;

                for (Pedido p : pedidos) {

                    long idPe = 0;
                    Pedido pedSai = new Pedido();
                    ClientePedido cliPedSai = new ClientePedido();
                    Funcionario funSai = new Funcionario(idPe, null, null);
                    Cliente cliSai = new Cliente(idPe, null, null);
                    Carro carSai = new Carro();

                    PedidoControle pedCon = new PedidoControle();

                    idPe = p.getIdPedido();
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
                    if (pedSai != null && cliPedSai != null) {
                        cont += 1;

            %>
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=pedSai.getIdPedido()%></td>
                <td><%=pedSai.getDtCompra()%></td>
                <td><%=pedSai.getValor()%></td>
                <td><%=pedSai.getObservacao()%></td>
                <td><%=pedSai.getStatus()%></td>
                <td><%=funSai.getIdFuncionario()%></td>
                <td><%=cliSai.getIdCliente()%></td>
                <td><%=carSai.getIdCarro()%></td>
            </tr>
            <% } %>
        </tbody>
        <% }
            }%>
    </table>          

</body>
</html>

