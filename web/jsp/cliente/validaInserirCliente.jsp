<%-- 
    Document   : validaInserirCliente
    Created on : 01/11/2019, 04:11:36
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
    <title>INSERIR CLIENTE - WTT</title>
    <body>
        <div class="container"/>
        <h2>INSERIR CLIENTE</h2>
        <%

            String nivelDesc = request.getParameter("nCompra");
            String idPess = request.getParameter("idPess");
            long idPessoa = 0;

            if (!idPess.equals("")) {
                idPessoa = Long.parseLong(idPess);
            }

            // inseri cliente
            Cliente cliSai = new Cliente(null, nivelDesc, idPessoa);
            Pessoa pesSai = new Pessoa();
            ClienteControle cliCon = new ClienteControle();

            try {
                cliSai = cliCon.inseriCliente(cliSai);
                pesSai = cliSai.getIdPessoa();
            } catch (Exception e) {
                cliSai = null;
            }

            if (idPessoa == 0) {
                cliSai = null;
            }

            if (cliSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao inserir!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div> 

        <br>
        <br>
        <br>

        <table class="table table-striped">
            <thead>
                <tr>
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
            <strong>Erro ao inserir!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
