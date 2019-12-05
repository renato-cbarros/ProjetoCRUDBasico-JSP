<%-- 
    Document   : alterarFuncionario
    Created on : 02/11/2019, 18:47:22
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.controle.FuncionarioControle"%>

<%

    String idCliStr = request.getParameter("inputIdCli");
    //buscar pessoa especifica chamada
    long idCli = 0;
    Funcionario funSai = new Funcionario();
    Pessoa pesSai = new Pessoa();

    funSai = null;

    FuncionarioControle funCon = new FuncionarioControle();

    if (idCliStr != null) {
        if (!idCliStr.equals("")) {
            idCli = Long.parseLong(idCliStr);
            funSai = new Funcionario(idCli, null, null);
            try {
                funSai = funCon.buscaFuncionario(funSai);
                pesSai = funSai.getIdPessoa();
            } catch (Exception e) {
                funSai = null;
                System.err.println(e);
            }
        } else {
            long id = 0;
            funSai = new Funcionario(id, "", id);
            pesSai.setIdPessoa(id);

        }
    } else {
        long id = 0;
        funSai = new Funcionario(id, "", id);
        pesSai.setIdPessoa(id);

    }

    if (funSai == null) {
        long id = 0;
        funSai = new Funcionario(id, "", id);
        pesSai.setIdPessoa(id);
    }

%>

<!DOCTYPE html>
<html>
    <style>
        h2, h5{
            text-align: center;
        }
        .a{
            text-align: center;            
        }
    </style>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR FUNCIONARIO - WTT</title>
    <body>
        <div class="container">
            <h2>ALTERAR FUNCIONARIO</h2>  

            <form class="form-inline" name="FORMBUSCARPESSOA" action="alterarFuncionario.jsp" method="post">
                <div class="form-group row">
                    <label for="inputIdCli" class="col-sm-2 col-form-label">ID Cliente:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputIdCli" placeholder="00" name="inputIdCli">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">BUSCAR FUNCIONARIO</button>
            </form>
            <br>
            <br>
            <form name="inseriPessoa" action="validaAlterarFuncionario.jsp" method="post">
                <div class="form-group mb-2">
                    <label for="staticIdCli">ID Cliente que ira ser alterado</label>
                    <input type="text" readonly class="form-control-plaintext" id="staticIdCli" name="staticIdCli" value="<%=funSai.getIdFuncionario()%>">
                </div>
                <div class="form-group">
                    <label for="nCompra">Função</label>
                    <input type="text" class="form-control" id="nCompra" placeholder="0" name="nCompra" value="<%=funSai.getFuncao()%>">
                </div>
                <div class="form-group">
                    <label for="idPess">ID Pessoa</label>
                    <input type="text" class="form-control" id="idPess" placeholder="00" name="idPess" value="<%=pesSai.getIdPessoa()%>">
                </div>

                <div class="a">
                    <button type="submit" class="btn btn-primary">ALTERAR</button>
                    <br>
                    <br>
                </div>
            </form>
        </div>
    </body>
</html>

