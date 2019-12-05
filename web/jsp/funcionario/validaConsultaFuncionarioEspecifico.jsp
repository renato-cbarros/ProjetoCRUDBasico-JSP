<%-- 
    Document   : validaConsultaFuncionarioEspecifico
    Created on : 02/11/2019, 18:06:54
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.controle.FuncionarioControle"%>

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
            Funcionario funSai = new Funcionario();
            Pessoa pes = new Pessoa();

            FuncionarioControle funCon = new FuncionarioControle();

            if (!idString.equals("")) {
                id = Long.parseLong(idString);
                funSai = new Funcionario(id, null, id);
                try {
                    funSai = funCon.buscaFuncionario(funSai);
                } catch (Exception e) {
                    funSai = null;
                    System.err.println(e);
                }

            } else {
                funSai = null;
            }

            if (funSai != null) {
                pes = funSai.getIdPessoa();
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
                    <td><%=funSai.getIdFuncionario()%></td>
                    <td><%=funSai.getFuncao()%></td>
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

