<%-- 
    Document   : validaAlterarCliente
    Created on : 01/11/2019, 03:41:01
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.controle.ClienteControle"%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR CLIENTE</title>
    <body>
        <div class="container"/>
        <h2>ALTERAR</h2>
        <%

            //ALTERAR PESSOA
            String idStri = request.getParameter("staticIdCli");
            long id = Long.parseLong(idStri);
            String nCompra = request.getParameter("nCompra");
            String idPess = request.getParameter("idPess");
            long idPes = Long.parseLong(idPess);

            Pessoa pesSai = new Pessoa();
            Cliente cliEnt = new Cliente(id, nCompra, idPes);
            Cliente cliSai = new Cliente();
            cliSai = null;

            ClienteControle cliCon = new ClienteControle();

            try {
                cliSai = cliCon.alterarCliente(cliEnt);
                pesSai = cliSai.getIdPessoa();
                if (cliSai.getIdCliente() == 0) {
                    cliSai = null;
                }
            } catch (Exception e) {
                cliSai = null;
                System.err.println(e);
            }

            if (cliSai != null) {%>

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
                    <th scope="col">Nivel desconto</th>
                    <th scope="col">ID Pessoa</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=cliSai.getIdCliente()%></td>
                    <td><%=cliSai.getNivelDesconto()%></td>
                    <td><%=pesSai.getIdPessoa()%></td>
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
