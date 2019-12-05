<%-- 
    Document   : validaAlterarCarro
    Created on : 02/11/2019, 21:17:49
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.controle.CarroControle"%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR CARRO - WTT</title>
    <body>
        <div class="container"/>
        <h2>ALTERAR</h2>
        <%

            //ALTERAR PESSOA
            String id = request.getParameter("staticIdCli");
            String modelo = request.getParameter("modelo");
            String marca = request.getParameter("marca");
            String ano = request.getParameter("ano");
            String cor = request.getParameter("cor");
            String valor = request.getParameter("valor");
            long idNu = 0;

            if (id != null) {
                idNu = Long.parseLong(id);
            }

            Carro carEnt = new Carro(idNu, modelo, marca, ano, cor, valor);
            Carro carSai = new Carro();
            carSai = null;

            CarroControle carCon = new CarroControle();

            try {
                carSai = carCon.alterarCarro(carEnt);
            } catch (Exception e) {
                carSai = null;
                System.err.println(e);
            }

            if (carSai != null) {%>

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
                    <th scope="col">Modelo</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Ano</th>
                    <th scope="col">Cor</th>
                    <th scope="col">Valor</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=carSai.getIdCarro()%></td>
                    <td><%=carSai.getModelo()%></td>
                    <td><%=carSai.getMarca()%></td>
                    <td><%=carSai.getAno()%></td>
                    <td><%=carSai.getCor()%></td>
                    <td><%=carSai.getValor()%></td>
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
