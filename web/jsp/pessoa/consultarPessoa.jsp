<%-- 
    Document   : consultarPessoa
    Created on : 31/10/2019, 21:01:49
    Author     : renat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.modelo.Endereco"%>
<%@page import="concessionariaWtt.modelo.Contato"%>
<%@page import="concessionariaWtt.controle.PessoaControle"%>
<%@page import="java.util.List"%>


<%
    PessoaControle pesCont = new PessoaControle();
    List<Pessoa> pessoas = pesCont.listaPesoa();
%>

<!DOCTYPE html>
<html>

    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSUTAR PESSOA - WTT</title>
    <body>
        <div class="container"/>
        <h2>CONSUTAR PESSOA</h2>
        <form class="form-inline" name="FORMBUSCARPESSOA" action="validaConsultaPessoaEspecifica.jsp" method="post">
            <div class="form-group row">
                <label for="inputIdPessoa" class="col-sm-2 col-form-label">ID Pessoa:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputIdPessoa" placeholder="000" name="inputIdPessoa">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">BUSCAR PESSOA ESPECIFICA</button>
        </form>
    </div>

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
        <% if (!(pessoas.isEmpty())) { %>    
        <tbody>
            <%
                int cont = 0;

                for (Pessoa p : pessoas) {

                    long idPess = p.getIdPessoa();
                    Pessoa pesSai = new Pessoa();
                    Endereco endeSai = new Endereco();
                    Contato contaSai = new Contato();

                    PessoaControle pessCon = new PessoaControle();

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
                    if (pesSai != null && endeSai != null && contaSai != null) {
                        cont += 1;

            %>
            <tr>
                <th scope="row"><%=cont%></th>
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
            <% } %>
        </tbody>
        <% }
            }%>
    </table>          

</body>
</html>
