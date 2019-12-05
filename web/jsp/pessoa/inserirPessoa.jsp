<%-- 
    Document   : inserirPessoa
    Created on : 27/10/2019, 23:03:07
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
    <title>INSERIR PESSOA - WTT</title>
    <body>
        <div class="container">
            <h2>CADASTRAR PESSOA</h2>            
            <form name="inseriPessoa" action="validaInserirPessoa.jsp" method="post">
                <div class="form-group">
                    <label for="nome">Nome completo</label>
                    <input type="text" class="form-control" id="nome" placeholder="Nome Sobrenome" name="nome">
                </div>
                <div class="form-group">
                    <label for="cpf">CPF</label>
                    <input type="text" class="form-control" id="cpf" placeholder="12345678" name="cpf">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login" placeholder="Login" name="login">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" placeholder="Senha" name="senha">
                    </div>
                </div>
                <h5>ENDEREÇO</h5> 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cep">CEP</label>
                        <input type="text" class="form-control" id="cep" placeholder="00000-000" name="cep">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="numero">Numero</label>
                        <input type="text" class="form-control" id="numero" placeholder="100" name="numero">
                    </div>
                </div>
                <div class="form-group">
                    <label for="complemento">Complemento</label>
                    <input type="text" class="form-control" id="complemento" placeholder="1234 Main St" name="complemento">
                </div>
                <h5>CONTATOS</h5> 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control" id="celular" placeholder="(11) 9 5555-5555" name="celular">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fixo">Telefone - Fixo</label>
                        <input type="text" class="form-control" id="fixo" placeholder="(11) 5555-5555" name="fixo">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" placeholder="email@email.email" name="email">
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
