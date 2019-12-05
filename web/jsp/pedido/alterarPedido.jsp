<%-- 
    Document   : alterarPedido
    Created on : 02/11/2019, 23:57:12
    Author     : renat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.modelo.Pedido"%>
<%@page import="concessionariaWtt.modelo.ClientePedido"%>
<%@page import="concessionariaWtt.controle.PedidoControle"%>

<%

    String idCliStr = request.getParameter("inputIdCli");
    //buscar pessoa especifica chamada
    long id = 0;
    Pedido pedSai = new Pedido();
    ClientePedido cliPedSai = new ClientePedido();
    Funcionario funSai = new Funcionario(id, null, null);
    Cliente cliSai = new Cliente(id, null, null);
    Carro carSai = new Carro(id, null, null, null, null, null);

    PedidoControle pedCon = new PedidoControle();

    if (idCliStr != null) {
        if (!idCliStr.equals("")) {
            id = Long.parseLong(idCliStr);
            pedSai = new Pedido(id, null, null, null, null, null, null);
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
            long idn = 0;
            pedSai = new Pedido(id, "", "", "", "", idn, idn);
            cliSai.setIdCliente(idn);
            funSai.setIdFuncionario(idn);
            carSai.setIdCarro(idn);
        }
    } else {
            long idn = 0;
            pedSai = new Pedido(id, "", "", "", "", idn, idn);
            cliSai.setIdCliente(idn);
            funSai.setIdFuncionario(idn);
            carSai.setIdCarro(idn);
    }

    if (cliSai == null) {
            long idn = 0;
            pedSai = new Pedido(id, "", "", "", "", idn, idn);
            cliSai.setIdCliente(idn);
            funSai.setIdFuncionario(idn);
            carSai.setIdCarro(idn);
    }

%>

<!DOCTYPE html>
<html>
    <style>
        h2, h5{
            text-align: center;
        }
        .a{
            text-align: center;            
        }
    </style>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR CLIENTE - WTT</title>
    <body>
        <div class="container">
            <h2>ALTERAR CLIENTE</h2>  

            <form class="form-inline" name="FORMBUSCARPESSOA" action="alterarPedido.jsp" method="post">
                <div class="form-group row">
                    <label for="inputIdCli" class="col-sm-2 col-form-label">ID Pedido:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputIdCli" placeholder="00" name="inputIdCli">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">BUSCAR PEDIDO</button>
            </form>
            <br>
            <br>
            <form name="inseriPessoa" action="validaAlterarPedido.jsp" method="post">
                <div class="form-group mb-2">
                    <label for="staticIdPed">ID Pedido que ira ser alterado</label>
                    <input type="text" readonly class="form-control-plaintext" id="staticIdPed" name="staticIdPed" value="<%=pedSai.getIdPedido()%>">
                </div>
                <div class="form-group">
                    <label for="dt">Data compra</label>
                    <input type="text" class="form-control" id="dt" placeholder="10/10/2019" name="dt" value="<%=pedSai.getDtCompra()%>">
                </div>
                <div class="form-group">
                    <label for="valor">Valor</label>
                    <input type="text" class="form-control" id="valor" placeholder="10.0000" name="valor" value="<%=pedSai.getValor()%>">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="observacao">Observação</label>
                        <input type="text" class="form-control" id="observacao" placeholder="observacao" name="observacao" value="<%=pedSai.getObservacao()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="status">Status</label>
                        <input type="text" class="form-control" id="status" placeholder="status" name="status" value="<%=pedSai.getStatus()%>">
                    </div>
                </div>
                <h5>FUNCIONARIO</h5> 
                <div class="form-group">
                    <label for="funcionario">ID Funcionario</label>
                    <input type="text" class="form-control" id="funcionario" placeholder="00" name="funcionario" value="<%=funSai.getIdFuncionario()%>">
                </div>
                <h5>CLIENTE</h5> 
                <div class="form-group">
                    <label for="cliente">ID Cliente</label>
                    <input type="text" class="form-control" id="cliente" placeholder="00" name="cliente" value="<%=cliSai.getIdCliente()%>">
                </div>
                <h5>CARRO</h5> 
                <div class="form-group">
                    <label for="carro">ID Carro</label>
                    <input type="text" class="form-control" id="carro" placeholder="00" name="carro" value="<%=carSai.getIdCarro()%>">
                </div>

                <div class="a">
                    <button type="submit" class="btn btn-primary">ALTERAR</button>
                    <br>
                    <br>
                </div>
            </form>
        </div>
    </body>
</html>

