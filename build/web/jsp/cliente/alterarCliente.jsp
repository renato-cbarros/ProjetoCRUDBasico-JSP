<%-- 
    Document   : alterarCliente
    Created on : 01/11/2019, 02:35:46
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.controle.ClienteControle"%>

<%

    String idCliStr = request.getParameter("inputIdCli");
    //buscar pessoa especifica chamada
    long idCli = 0;
    Cliente cliSai = new Cliente();
    Pessoa pesSai = new Pessoa();

    cliSai = null;

    ClienteControle cliCon = new ClienteControle();

    if (idCliStr != null) {
        if (!idCliStr.equals("")) {
            idCli = Long.parseLong(idCliStr);
            cliSai = new Cliente(idCli, null, null);
            try {
                cliSai = cliCon.buscaCliente(cliSai);
                pesSai = cliSai.getIdPessoa();
            } catch (Exception e) {
                cliSai = null;
                System.err.println(e);
            }
        } else {
            long id = 0;
            cliSai = new Cliente(id, "", id);
            pesSai.setIdPessoa(id);

        }
    } else {
        long id = 0;
        cliSai = new Cliente(id, "", id);
        pesSai.setIdPessoa(id);

    }

    if (cliSai == null) {
        long id = 0;
        cliSai = new Cliente(id, "", id);
        pesSai.setIdPessoa(id);
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

            <form class="form-inline" name="FORMBUSCARPESSOA" action="alterarCliente.jsp" method="post">
                <div class="form-group row">
                    <label for="inputIdCli" class="col-sm-2 col-form-label">ID Cliente:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputIdCli" placeholder="00" name="inputIdCli">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">BUSCAR CLIENTE</button>
            </form>
            <br>
            <br>
            <form name="inseriPessoa" action="validaAlterarCliente.jsp" method="post">
                <div class="form-group mb-2">
                    <label for="staticIdCli">ID Cliente que ira ser alterado</label>
                    <input type="text" readonly class="form-control-plaintext" id="staticIdCli" name="staticIdCli" value="<%=cliSai.getIdCliente()%>">
                </div>
                <div class="form-group">
                    <label for="nCompra">Nivel compra</label>
                    <input type="text" class="form-control" id="nCompra" placeholder="0" name="nCompra" value="<%=cliSai.getNivelDesconto()%>">
                </div>
                <div class="form-group">
                    <label for="idPess">ID Pessoa</label>
                    <input type="text" class="form-control" id="idPess" placeholder="00" name="idPess" value="<%=pesSai.getIdPessoa()%>">
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
