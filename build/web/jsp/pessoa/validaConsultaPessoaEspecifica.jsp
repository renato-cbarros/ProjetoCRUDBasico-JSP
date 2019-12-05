<%-- 
    Document   : validaConsultaPessoaEspecifica
    Created on : 31/10/2019, 21:28:27
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Endereco"%>
<%@page import="concessionariaWtt.modelo.Contato"%>
<%@page import="concessionariaWtt.controle.PessoaControle"%>

<!DOCTYPE html>
<html>

    <style> 
        h2{
            text-align: center;
        } 
    </style>    

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR PESSOA - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSULTAR PESSOA ESPECIFICA</h2>
        <%

            String idPessStr = request.getParameter("inputIdPessoa");
            //buscar pessoa especifica chamada
            long idPess = 0;
            Pessoa pesSai = new Pessoa();
            Endereco endeSai = new Endereco();
            Contato contaSai = new Contato();

            PessoaControle pessCon = new PessoaControle();

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
            } else {
                pesSai = null;
            }

            if (pesSai != null && endeSai != null && contaSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao buscar pessoa!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div> 

        <br>
        <br>
        <br>

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

        <%} else {%>

        <div class="alert alert-danger" role="alert">
            <strong>Erro ao buscar pessoa!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
