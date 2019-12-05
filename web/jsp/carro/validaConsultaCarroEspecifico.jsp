<%-- 
    Document   : validaConsultaCarroEspecifico
    Created on : 02/11/2019, 20:17:18
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
        <title>CONSUTAR CARRO - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSULTAR CARRO ESPECIFICO</h2>
        <%

            String idString = request.getParameter("inputId");
            //buscar pessoa especifica chamada
            long id = 0;
            Carro carSai = new Carro();

            CarroControle carCon = new CarroControle();

            if (!idString.equals("")) {
                id = Long.parseLong(idString);
                carSai = new Carro(id, null, null, null, null, null);
                try {
                    carSai = carCon.buscaCarro(carSai);
                } catch (Exception e) {
                    carSai = null;
                    System.err.println(e);
                }

            } else {
                carSai = null;
            }

            if (carSai != null) {
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
            <strong>Erro ao buscar cliente!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
