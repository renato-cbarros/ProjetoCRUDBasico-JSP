<%-- 
    Document   : validaInserirFuncionario
    Created on : 02/11/2019, 18:32:58
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
    <title>INSERIR FUNCIONARIO - WTT</title>
    <body>
        <div class="container"/>
        <h2>INSERIR FUNCIONARIO</h2>
        <%

            String nivelDesc = request.getParameter("nCompra");
            String idPess = request.getParameter("idPess");
            long idPessoa = 0;

            if (!idPess.equals("")) {
                idPessoa = Long.parseLong(idPess);
            }

            // inseri cliente
            Funcionario funSai = new Funcionario(null, nivelDesc, idPessoa);
            Pessoa pesSai = new Pessoa();
            FuncionarioControle funCon = new FuncionarioControle();

            try {
                funSai = funCon.inseriFuncionario(funSai);
                pesSai = funSai.getIdPessoa();
            } catch (Exception e) {
                funSai = null;
            }

            if (idPessoa == 0) {
                funSai = null;
            }

            if (funSai != null) {%>

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
                    <th scope="col">Função</th>
                    <th scope="col">ID Pessoa</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=funSai.getIdFuncionario()%></td>
                    <td><%=funSai.getFuncao()%></td>
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
