<%-- 
    Document   : alterarCarro
    Created on : 02/11/2019, 20:55:42
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.controle.CarroControle"%>

<%

    String idCliStr = request.getParameter("inputIdCli");
    //buscar pessoa especifica chamada
    long idCli = 0;
    Carro carSai = new Carro();

    carSai = null;

    CarroControle carCon = new CarroControle();

    if (idCliStr != null) {
        if (!idCliStr.equals("")) {
            idCli = Long.parseLong(idCliStr);
            carSai = new Carro(idCli, null, null, null, null, null);
            try {
                carSai = carCon.buscaCarro(carSai);
            } catch (Exception e) {
                carSai = null;
                System.err.println(e);
            }
        } else {
            long id = 0;
            carSai = new Carro(id, "", "", "", "", "");

        }
    } else {
        long id = 0;
        carSai = new Carro(id, "", "", "", "", "");
    }

    if (carSai == null) {
        long id = 0;
        carSai = new Carro(id, "", "", "", "", "");
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
    <title>ALTERAR CARRO - WTT</title>
    <body>
        <div class="container">
            <h2>ALTERAR CARRO</h2>  

            <form class="form-inline" name="FORMBUSCARPESSOA" action="alterarCarro.jsp" method="post">
                <div class="form-group row">
                    <label for="inputIdCli" class="col-sm-2 col-form-label">ID Carro:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputIdCli" placeholder="00" name="inputIdCli">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">BUSCAR CARRO</button>
            </form>
            <br>
            <br>
            <form name="inseriPessoa" action="validaAlterarCarro.jsp" method="post">
                <div class="form-group mb-2">
                    <label for="staticIdCli">ID Carro que ira ser alterado</label>
                    <input type="text" readonly class="form-control-plaintext" id="staticIdCli" name="staticIdCli" value="<%=carSai.getIdCarro()%>">
                </div>
                <div class="form-group">
                    <label for="modelo">Modelo</label>
                    <input type="text" class="form-control" id="modelo" placeholder="modelo" name="modelo" value="<%=carSai.getModelo()%>">
                </div>
                <div class="form-group">
                    <label for="marca">Marca</label>
                    <input type="text" class="form-control" id="marca" placeholder="marca" name="marca" value="<%=carSai.getMarca()%>">
                </div>
                <div class="form-group">
                    <label for="ano">Ano</label>
                    <input type="text" class="form-control" id="ano" placeholder="2000" name="ano" value="<%=carSai.getAno()%>">
                </div>
                <div class="form-group">
                    <label for="cor">Cor</label>
                    <input type="text" class="form-control" id="cor" placeholder="cor" name="cor" value="<%=carSai.getCor()%>">
                </div>    
                <div class="form-group">
                    <label for="valor">Valor</label>
                    <input type="text" class="form-control" id="valor" placeholder="10000" name="valor"  value="<%=carSai.getValor()%>">
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

