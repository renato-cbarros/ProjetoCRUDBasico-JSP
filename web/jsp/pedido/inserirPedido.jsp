<%-- 
    Document   : inserirPedido
    Created on : 02/11/2019, 23:02:12
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>INSERIR PEDIDO - WTT</title>
    <body>
        <div class="container">
            <h2>INSERIR PEDIDO</h2>            
            <form name="inseriPessoa" action="validaInserirPedido.jsp" method="post">
                <div class="form-group">
                    <label for="dt">Data compra</label>
                    <input type="text" class="form-control" id="dt" placeholder="10/10/2019" name="dt">
                </div>
                <div class="form-group">
                    <label for="valor">Valor</label>
                    <input type="text" class="form-control" id="valor" placeholder="10.0000" name="valor">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="observacao">Observação</label>
                        <input type="text" class="form-control" id="observacao" placeholder="observacao" name="observacao">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="status">Status</label>
                        <input type="text" class="form-control" id="status" placeholder="status" name="status">
                    </div>
                </div>
                <h5>FUNCIONARIO</h5> 
                <div class="form-group">
                    <label for="funcionario">ID Funcionario</label>
                    <input type="text" class="form-control" id="funcionario" placeholder="00" name="funcionario">
                </div>
                <h5>CLIENTE</h5> 
                <div class="form-group">
                    <label for="cliente">ID Cliente</label>
                    <input type="text" class="form-control" id="cliente" placeholder="00" name="cliente">
                </div>
                <h5>CARRO</h5> 
                <div class="form-group">
                    <label for="carro">ID Carro</label>
                    <input type="text" class="form-control" id="carro" placeholder="00" name="carro">
                </div>
                <div class="a">
                    <button type="submit" class="btn btn-primary">CADASTRAR</button>
                    <br>
                    <br>
                </div>
            </form>
        </div>
    </body>
</html>

