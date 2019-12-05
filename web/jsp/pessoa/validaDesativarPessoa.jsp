<%-- 
    Document   : validaDesativarPessoa
    Created on : 01/11/2019, 00:44:48
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Endereco"%>
<%@page import="concessionariaWtt.modelo.Contato"%>
<%@page import="concessionariaWtt.controle.PessoaControle"%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ATIVAR/DESATIVAR PESSOA - WTT</title>
    <body>
        <div class="container"/>
        <h2>ATIVAR/DESATIVAR PESSOA</h2>
        <%

            //DESATIVA PESSOA
            String idStri = request.getParameter("staticIdPessoa");
            String situacao = request.getParameter("gridRadios");
            long idPess = Long.parseLong(idStri);

            Pessoa pesEnt = new Pessoa(idPess, null, null, null, null, situacao);
            Pessoa pesSai = new Pessoa();

            PessoaControle pessCon = new PessoaControle();
            System.err.println(pesEnt.getIdPessoa());

            try {
                pesSai = pessCon.desativarPessoa(pesEnt);
            } catch (Exception e) {
                System.err.println(e);
            }

            if (pesSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao inserir!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div> 

        <br>
        <br>
        <br>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Situação</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=pesSai.getIdPessoa()%></td>
                    <td><%=pesSai.getSituacao()%></td>
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
