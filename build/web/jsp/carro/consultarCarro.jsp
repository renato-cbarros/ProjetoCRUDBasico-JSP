<%-- 
    Document   : consultarCarro
    Created on : 02/11/2019, 20:12:20
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.controle.CarroControle"%>
<%@page import="java.util.List"%>


<%
    CarroControle carCon = new CarroControle();
    List<Carro> carros = (carCon.listaCarro());
%>

<!DOCTYPE html>
<html>

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR CARRO - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSUTAR CARRO</h2>
        <form class="form-inline" name="FORMBUSCARCLIENTE" action="validaConsultaCarroEspecifico.jsp" method="post">
            <div class="form-group row">
                <label for="inputId" class="col-sm-2 col-form-label">ID Carro:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputId" placeholder="000" name="inputId">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR CARRO ESPECIFICO</button>
        </form>
    </div>

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
        <% if (!(carros.isEmpty())) { %>    
        <tbody>
            <%
                int cont = 0;

                for (Carro c : carros) {

                    if (c != null) {
                        cont += 1;
            %>
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=c.getIdCarro()%></td>
                <td><%=c.getModelo()%></td>
                <td><%=c.getMarca()%></td>
                <td><%=c.getAno()%></td>
                <td><%=c.getCor()%></td>
                <td><%=c.getValor()%></td>
            </tr>
            <% } %>
        </tbody>
        <% }
            }%>
    </table>          

</body>
</html>

