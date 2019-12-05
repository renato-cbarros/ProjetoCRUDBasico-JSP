<%-- 
    Document   : alterarPessoa
    Created on : 31/10/2019, 22:55:44
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Endereco"%>
<%@page import="concessionariaWtt.modelo.Contato"%>
<%@page import="concessionariaWtt.controle.PessoaControle"%>

<%

    String idPessStr = request.getParameter("inputIdPessoa");
    //buscar pessoa especifica chamada
    long idPess = 0;
    Pessoa pesSai = new Pessoa();
    Endereco endeSai = new Endereco();
    Contato contaSai = new Contato();

    PessoaControle pessCon = new PessoaControle();

    if (idPessStr != null) {
        if (!idPessStr.equals("")) {
            idPess = Long.parseLong(idPessStr);
            pesSai = new Pessoa(idPess, null, null, null, null, null);
            try {
                pesSai = pessCon.buscaPessoa(pesSai);
            } catch (Exception e) {
                pesSai = null;
                System.err.println(e);
            }

            if (pesSai != null) {
                try {
                    endeSai.setPessoa(pesSai);
                    endeSai = pessCon.buscaEndereco(pesSai);
                    if (endeSai != null) {
                        contaSai.setPessoa(pesSai);
                        contaSai = pessCon.buscaContato(pesSai);
                        if (contaSai != null) {
                            System.out.println("Busca de pessoa bem sucedida + Valor: " + pesSai.toString() + " ende " + endeSai.toString() + " conta " + contaSai.toString());

                        } else {
                            contaSai = null;
                        }
                    } else {
                        endeSai = null;
                    }
                } catch (Exception e) {
                    pesSai = null;
                    System.err.println(e);
                }
            }

            if (pesSai == null || endeSai == null || contaSai == null) {
                long idPessoa = 0;
                pesSai = new Pessoa(idPessoa, "", "", "", "", "");
                endeSai = new Endereco(idPessoa, "", "", "", idPessoa);
                contaSai = new Contato(idPessoa, "", "", "", idPessoa);

            }

        } else {
            long idPessoa = 0;
            pesSai = new Pessoa(idPessoa, "", "", "", "", "");
            endeSai = new Endereco(idPessoa, "", "", "", idPessoa);
            contaSai = new Contato(idPessoa, "", "", "", idPessoa);
        }
    } else {
        long idPessoa = 0;
        pesSai = new Pessoa(idPessoa, "", "", "", "", "");
        endeSai = new Endereco(idPessoa, "", "", "", idPessoa);
        contaSai = new Contato(idPessoa, "", "", "", idPessoa);
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
    <title>ALTERAR PESSOA</title>
    <body>
        <div class="container">
            <h2>ALTERAR PESSOA</h2>  

            <form class="form-inline" name="FORMBUSCARPESSOA" action="alterarPessoa.jsp" method="post">
                <div class="form-group row">
                    <label for="inputIdPessoa" class="col-sm-2 col-form-label">ID Pessoa:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputIdPessoa" placeholder="000" name="inputIdPessoa">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">BUSCAR PESSOA</button>
            </form>
            <br>
            <br>
            <form name="inseriPessoa" action="validaAlterarPessoa.jsp" method="post">
                <div class="form-group mb-2">
                    <label for="staticIdPessoa">ID Pessoa que ira ser alterado</label>
                    <input type="text" readonly class="form-control-plaintext" id="staticIdPessoa" name="staticIdPessoa" value="<%=pesSai.getIdPessoa()%>">
                </div>
                <div class="form-group">
                    <label for="nome">Nome completo</label>
                    <input type="text" class="form-control" id="nome" placeholder="Nome Sobrenome" name="nome" value="<%=pesSai.getNome()%>">
                </div>
                <div class="form-group">
                    <label for="cpf">CPF</label>
                    <input type="text" class="form-control" id="cpf" placeholder="12345678" name="cpf" value="<%=pesSai.getCpf()%>">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login" placeholder="Login" name="login" value="<%=pesSai.getLogin()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" placeholder="Senha" name="senha" value="<%=pesSai.getSenha()%>">
                    </div>
                </div>
                <h5>ENDEREÇO</h5> 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cep">CEP</label>
                        <input type="text" class="form-control" id="cep" placeholder="00000-000" name="cep" value="<%=endeSai.getCep()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="numero">Numero</label>
                        <input type="text" class="form-control" id="numero" placeholder="100" name="numero" value="<%=endeSai.getNumero()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="complemento">Complemento</label>
                    <input type="text" class="form-control" id="complemento" placeholder="1234 Main St" name="complemento" value="<%=endeSai.getComplemento()%>">
                </div>
                <h5>CONTATOS</h5> 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control" id="celular" placeholder="(11) 9 5555-5555" name="celular" value="<%=contaSai.getTelCelular()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fixo">Telefone - Fixo</label>
                        <input type="text" class="form-control" id="fixo" placeholder="(11) 5555-5555" name="fixo" value="<%=contaSai.getTelFixo()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" placeholder="email@email.email" name="email" value="<%=contaSai.getEmail()%>">
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
