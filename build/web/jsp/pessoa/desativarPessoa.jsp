<%-- 
    Document   : desativarPessoa
    Created on : 01/11/2019, 00:28:44
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
                pesSai = null;

            }

        } else {
            pesSai = null;

        }
    } else {
        pesSai = null;

    }
%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ATIVAR/DESATIVAR PESSOA - WTT</title>
    <body>
        <div class="container"/>
        <h2>ATIVAR/DESATIVAR PESSOA</h2>

        <form class="form-inline" name="FORMBUSCARPESSOA" action="desativarPessoa.jsp" method="post">
            <div class="form-group row">
                <label for="inputIdPessoa" class="col-sm-2 col-form-label">ID Pessoa:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputIdPessoa" placeholder="000" name="inputIdPessoa">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR PESSOA</button>
        </form>        

        <%        if (pesSai != null && endeSai != null && contaSai != null) {%>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">CPF</th>
                    <th scope="col">Login</th>
                    <th scope="col">Senha</th>
                    <th scope="col">Situação</th>
                    <th scope="col">CEP</th>
                    <th scope="col">Numero</th>
                    <th scope="col">Complemento</th>
                    <th scope="col">Telefone - Fixo</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Email</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><%=pesSai.getIdPessoa()%></td>
                    <td><%=pesSai.getNome()%></td>
                    <td><%=pesSai.getCpf()%></td>
                    <td><%=pesSai.getLogin()%></td>
                    <td><%=pesSai.getSenha()%></td>
                    <td><%=pesSai.getSituacao()%></td>
                    <td><%=endeSai.getCep()%></td>
                    <td><%=endeSai.getNumero()%></td>
                    <td><%=endeSai.getComplemento()%></td>
                    <td><%=contaSai.getTelFixo()%></td>
                    <td><%=contaSai.getTelCelular()%></td>
                    <td><%=contaSai.getEmail()%></td>
                </tr>
            </tbody>
        </table>

        <br>
        <br>

        <form name="inseriPessoa" action="validaDesativarPessoa.jsp" method="post">
            <div class="form-group mb-2">
                <label for="staticIdPessoa">ID Pessoa que ira ser alterado</label>
                <input type="text" readonly class="form-control-plaintext" id="staticIdPessoa" name="staticIdPessoa" value="<%=pesSai.getIdPessoa()%>">
            </div>
            
            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-form-label col-sm-2 pt-0">Ativar/Desativar</legend>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gridRadios" id="permFun" value="ATIVO" checked>
                            <label class="form-check-label" for="permFun">
                                Ativar
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gridRadios" id="permCli" value="DESATIVO">
                            <label class="form-check-label" for="permCli">
                                Desativar
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>            
            
            <div class="a">
                <button type="submit" class="btn btn-primary">ATIVAR/DESATIVAR</button>
                <br>
                <br>
            </div>
        </form>                

        <%}%>

    </div>
</body>
</html>
