<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
        div.a{
            text-align: center;
        } 
    </style>

    <%@include file="../../inc/materalizeWebLogin.inc" %>
    <title>LOGIN - WTT</title>
    <body>
        <div class="container"/>
        <h2>LOGIN</h2>
        <form name="FORMLOGIN" action="menu.jsp" method="post">
            <div class="form-group row">
                <label for="inputLogin" class="col-sm-2 col-form-label">Login</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputLogin" placeholder="Login" name="inputLogin">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputSenha" class="col-sm-2 col-form-label">Senha</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputSenha" placeholder="Senha" name="inputSenha">
                </div>
            </div>
            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-form-label col-sm-2 pt-0">Permissão</legend>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gridRadios" id="permFun" value="F" checked>
                            <label class="form-check-label" for="permFun">
                                Funcionario
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gridRadios" id="permCli" value="C">
                            <label class="form-check-label" for="permCli">
                                Cliente
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>
            <br>
            <br>
            <div class="form-group row">
                <div class="col-sm-10">
                    <div class="a">
                        <button type="submit" class="btn btn-primary">Entrar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
