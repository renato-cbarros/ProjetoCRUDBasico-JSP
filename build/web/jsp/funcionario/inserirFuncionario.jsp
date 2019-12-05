<%-- 
    Document   : inserirFuncionario
    Created on : 02/11/2019, 18:30:46
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <title>INSERIR FUNCIONARIO - WTT</title>
    <body>
        <div class="container">
            <h2>INSERIR FUNCIONARIO</h2>  
            
            <form name="inseriPessoa" action="validaInserirFuncionario.jsp" method="post">
                <div class="form-group">
                    <label for="nCompra">Função</label>
                    <input type="text" class="form-control" id="nCompra" placeholder="0" name="nCompra">
                </div>
                <div class="form-group">
                    <label for="idPess">ID Pessoa</label>
                    <input type="text" class="form-control" id="idPess" placeholder="00" name="idPess">
                </div>

                <div class="a">
                    <button type="submit" class="btn btn-primary">INSERIR</button>
                    <br>
                    <br>
                </div>
            </form>
        </div>
    </body>
</html>
