<%-- 
    Document   : validaInserirPessoa
    Created on : 27/10/2019, 23:43:47
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
    <title>INSEREIR PESSOA</title>
    <body>
        <div class="container"/>
        <h2>INSEREIR</h2>
        <%

            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String situacao = "ATIVO";
            String cep = request.getParameter("cep");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String telFixo = request.getParameter("fixo");
            String telCelular = request.getParameter("celular");
            String email = request.getParameter("email");

            //inseri pessoa
            Pessoa pes = new Pessoa(null, nome, cpf, login, senha, situacao);
            long idPessoa = 0;
            Endereco ende = new Endereco(null, cep, numero, complemento, idPessoa);
            Contato conta = new Contato(null, telFixo, telCelular, email, idPessoa);

            PessoaControle pesCon = new PessoaControle();
            Pessoa pesSai = new Pessoa();
            Endereco endSai = new Endereco();
            Contato conSai = new Contato();

            if (nome.equals("") || telFixo.equals("") || cep.equals("")) {
                pesSai = null;
            } else {
                try {
                    pesSai = pesCon.inseriPessoa(pes, ende, conta);
                    endSai = pesCon.buscaEndereco(pesSai);
                    conSai = pesCon.buscaContato(pesSai);
                } catch (Exception e) {
                    pesSai = null;
                }
            }

            if (pesSai != null) {%>

        <div class="alert alert-success" role="alert">
            <strong>Sucesso ao inserir!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
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
                    <td><%=endSai.getCep()%></td>
                    <td><%=endSai.getNumero()%></td>
                    <td><%=endSai.getComplemento()%></td>
                    <td><%=conSai.getTelFixo()%></td>
                    <td><%=conSai.getTelCelular()%></td>
                    <td><%=conSai.getEmail()%></td>
                </tr>
            </tbody>
        </table>

        <%} else {%>

        <div class="alert alert-danger" role="alert">
            <strong>Erro ao inserir!</strong> <a href="../contacesso/menu.jsp" class="alert-link">Voltar para o menu</a>
        </div>         

        <%}

        %>

    </div>
</body>
</html>
