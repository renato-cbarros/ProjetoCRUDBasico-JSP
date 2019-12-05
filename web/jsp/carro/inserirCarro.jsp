<%-- 
    Document   : inserirCarro
    Created on : 02/11/2019, 20:32:24
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
    <title>INSERIR CARRO - WTT</title>
    <body>
        <div class="container">
            <h2>INSERIR CARRO</h2>  
            
            <form name="inseriPessoa" action="validaInserirCarro.jsp" method="post">
                <div class="form-group">
                    <label for="modelo">Modelo</label>
                    <input type="text" class="form-control" id="modelo" placeholder="modelo" name="modelo">
                </div>
                <div class="form-group">
                    <label for="marca">Marca</label>
                    <input type="text" class="form-control" id="marca" placeholder="marca" name="marca">
                </div>
                <div class="form-group">
                    <label for="ano">Ano</label>
                    <input type="text" class="form-control" id="ano" placeholder="2000" name="ano">
                </div>
                <div class="form-group">
                    <label for="cor">Cor</label>
                    <input type="text" class="form-control" id="cor" placeholder="cor" name="cor">
                </div>    
                <div class="form-group">
                    <label for="valor">Valor</label>
                    <input type="text" class="form-control" id="valor" placeholder="10000" name="valor">
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

