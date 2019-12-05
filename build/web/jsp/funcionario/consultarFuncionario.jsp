<%-- 
    Document   : consultarFuncionario
    Created on : 02/11/2019, 17:43:07
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.controle.FuncionarioControle"%>
<%@page import="java.util.List"%>


<%
        FuncionarioControle funCont = new FuncionarioControle();
        List<Funcionario> funcionarios =(funCont.listaFuncionario());
%>

<!DOCTYPE html>
<html>

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR FUNCIONARIO - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSUTAR FUNCIONARIO</h2>
        <form class="form-inline" name="FORMBUSCARCLIENTE" action="validaConsultaFuncionarioEspecifico.jsp" method="post">
            <div class="form-group row">
                <label for="inputId" class="col-sm-2 col-form-label">ID Funcionario ou ID Pessoa:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputId" placeholder="000" name="inputId">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR FUNCIONARIO ESPECIFICO</button>
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
        <% if (!(funcionarios.isEmpty())) { %>    
        <tbody>
            <%
                int cont = 0;

                for (Funcionario f : funcionarios) {
                    
                    if (f != null) {
                        cont += 1;
                        Pessoa pes = new Pessoa();
                        pes = f.getIdPessoa();

            %>
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=f.getIdFuncionario()%></td>
                <td><%=f.getFuncao()%></td>
                <td><%=pes.getIdPessoa()%></td>
            </tr>
            <% } %>
        </tbody>
        <% }
            }%>
    </table>          

</body>
</html>

