<%-- 
    Document   : validaConsultaClienteEspecifico
    Created on : 01/11/2019, 02:14:02
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
    <title>CONSUTAR CLIENTE - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSULTAR CLIENTE ESPECIFICO</h2>
        <%

            String idString = request.getParameter("inputId");
            //buscar pessoa especifica chamada
            long id = 0;
            Cliente cliSai = new Cliente();
            Pessoa pes = new Pessoa();

            ClienteControle cliCon = new ClienteControle();

            if (!idString.equals("")) {
                id = Long.parseLong(idString);
                cliSai = new Cliente(id, null, id);
                try {
                    cliSai = cliCon.buscaCliente(cliSai);
                } catch (Exception e) {
                    cliSai = null;
                    System.err.println(e);
                }

            } else {
                cliSai = null;
            }

            if (cliSai != null) {
                pes = cliSai.getIdPessoa();
        %>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao buscar cliente!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
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
                    <td><%=pes.getIdPessoa()%></td>
                </tr>
            </tbody>
        </table>

        <%} else {%>

        <div class="alert alert-danger" role="alert">
            <strong>Erro ao buscar cliente!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
