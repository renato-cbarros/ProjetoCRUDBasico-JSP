<%-- 
    Document   : inserirCliente
    Created on : 01/11/2019, 04:06:09
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
    <title>INSERIR CLIENTE - WTT</title>
    <body>
        <div class="container">
            <h2>INSERIR CLIENTE</h2>  
            
            <form name="inseriPessoa" action="validaInserirCliente.jsp" method="post">
                <div class="form-group">
                    <label for="nCompra">Nivel compra</label>
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
