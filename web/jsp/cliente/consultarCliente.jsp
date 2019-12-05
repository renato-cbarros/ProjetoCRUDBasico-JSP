<%-- 
    Document   : consultarCliente
    Created on : 01/11/2019, 01:55:33
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.controle.ClienteControle"%>
<%@page import="java.util.List"%>


<%
        ClienteControle cliCont = new ClienteControle();
        List<Cliente> clientes =(cliCont.listaCliente());
%>

<!DOCTYPE html>
<html>

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR CLIENTE - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSUTAR CLIENTE</h2>
        <form class="form-inline" name="FORMBUSCARCLIENTE" action="validaConsultaClienteEspecifico.jsp" method="post">
            <div class="form-group row">
                <label for="inputId" class="col-sm-2 col-form-label">ID Cliente ou ID Pessoa:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputId" placeholder="000" name="inputId">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR CLIENTE ESPECIFICO</button>
        </form>
    </div>

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
        <% if (!(clientes.isEmpty())) { %>    
        <tbody>
            <%
                int cont = 0;

                for (Cliente c : clientes) {
                    
                    if (c != null) {
                        cont += 1;
                        Pessoa pes = new Pessoa();
                        pes = c.getIdPessoa();

            %>
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=c.getIdCliente()%></td>
                <td><%=c.getNivelDesconto()%></td>
                <td><%=pes.getIdPessoa()%></td>
            </tr>
            <% } %>
        </tbody>
        <% }
            }%>
    </table>          

</body>
</html>
