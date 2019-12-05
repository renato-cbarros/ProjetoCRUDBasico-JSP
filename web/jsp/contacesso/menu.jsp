<%@page import="concessionariaWtt.modelo.Carro"%>
<%@page import="concessionariaWtt.modelo.ClientePedido"%>
<%@page import="concessionariaWtt.modelo.Pedido"%>
<%@page import="concessionariaWtt.controle.PedidoControle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="concessionariaWtt.modelo.Pessoa"%>
<%@page import="concessionariaWtt.controle.PessoaControle"%>
<%@page import="concessionariaWtt.modelo.Funcionario"%>
<%@page import="concessionariaWtt.controle.FuncionarioControle"%>
<%@page import="concessionariaWtt.modelo.Cliente"%>
<%@page import="concessionariaWtt.controle.ClienteControle"%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>MENU </title>
    <body>
        <%

            String login = request.getParameter("inputLogin");
            String senha = request.getParameter("inputSenha");
            String tipo = request.getParameter("gridRadios");

            Pessoa pesEnt = new Pessoa(null, null, null, login, senha, null);
            PessoaControle pesCon = new PessoaControle();
            Pessoa pesSai = new Pessoa();

            Funcionario fun = new Funcionario();
            FuncionarioControle funCon = new FuncionarioControle();
            Cliente cli = new Cliente();
            ClienteControle cliCon = new ClienteControle();

            try {
                pesSai = pesCon.validaLogin(pesEnt, tipo);

                fun.setIdPessoa(pesSai);
                cli.setIdPessoa(pesSai);

                if (tipo.equals("F")) {
                    fun = funCon.buscaFuncionario(fun);
                } else {
                    fun = null;
                }
                if (tipo.equals("C")) {
                    cli = cliCon.buscaCliente(cli);
                } else {
                    cli = null;
                }

            } catch (Exception e) {
                /*
                 =e
                 */
                pesSai = null;
            }

            if ((Pessoa) session.getAttribute("UsuarioLogado") != null) {
                pesSai = (Pessoa) session.getAttribute("UsuarioLogado");
                fun = (Funcionario) session.getAttribute("FuncionarioLogado");
                cli = (Cliente) session.getAttribute("ClienteLogado");

                if (fun != null) {
                    tipo = "F";
                } else if (cli != null) {
                    tipo = "C";
                }
            }

            if (pesSai == null) {
                //exibe alerta de erro
        %>
        <div class="alert alert-danger" role="alert">
            Erro ao entrar! <strong>Login ou senha invaliados</strong> <a href="login.jsp" class="alert-link">Tentar novamente</a>
        </div> 

        <% } else { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Sucesso ao entrar!</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <%
            //executa script
            session.setAttribute("UsuarioLogado", pesSai);
            session.setAttribute("FuncionarioLogado", fun);
            session.setAttribute("ClienteLogado", cli);

            if (fun != null && tipo.equals("F")) {

        %>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="menu.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../pessoa/consultarPessoa.jsp" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Pessoas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1">
                                <a class="dropdown-item" href="../pessoa/consultarPessoa.jsp">Consultar cadastro</a>
                                <a class="dropdown-item" href="../pessoa/inserirPessoa.jsp">Inserir cadastro</a>
                                <a class="dropdown-item" href="../pessoa/alterarPessoa.jsp">Alterar cadastro</a>
                                <a class="dropdown-item" href="../pessoa/desativarPessoa.jsp">Desativar cadastro</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../cliente/consultarCliente.jsp" id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Cliente
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                                <a class="dropdown-item" href="../cliente/consultarCliente.jsp">Consultar</a>
                                <a class="dropdown-item" href="../cliente/inserirCliente.jsp">Inserir</a>
                                <a class="dropdown-item" href="../cliente/alterarCliente.jsp">Alterar</a>
                            </div>
                        </li>

                        <% if (fun.getFuncao().equals("ADM")) { %> 
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../funcionario/consultarFuncionario.jsp" id="navbarDropdownMenuLink3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Funcionario
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink3">
                                <a class="dropdown-item" href="../funcionario/consultarFuncionario.jsp">Consultar</a>
                                <a class="dropdown-item" href="../funcionario/inserirFuncionario.jsp">Inserir</a>
                                <a class="dropdown-item" href="../funcionario/alterarFuncionario.jsp">Alterar</a>
                            </div>
                        </li>
                        <%}%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../carro/consultarCarro.jsp" id="navbarDropdownMenuLink4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Carro
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink4">
                                <a class="dropdown-item" href="../carro/consultarCarro.jsp">Consultar</a>
                                <a class="dropdown-item" href="../carro/inserirCarro.jsp">Inserir</a>
                                <a class="dropdown-item" href="../carro/alterarCarro.jsp">Alterar</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../pedido/consultarPedido.jsp" id="navbarDropdownMenuLink5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Pedido
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink5">
                                <a class="dropdown-item" href="../pedido/consultarPedido.jsp">Consultar</a>
                                <a class="dropdown-item" href="../pedido/inserirPedido.jsp">Inserir</a>
                                <a class="dropdown-item" href="../pedido/alterarPedido.jsp">Alterar</a>
                                <a class="dropdown-item" href="../pedido/desativarPedido.jsp">Cancelar</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="../contacesso/login.jsp" id="navbarDropdownMenuLink6" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Sair
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink6">
                                <a class="dropdown-item" href="../contacesso/login.jsp">Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>


        <%
            PedidoControle pedCont = new PedidoControle();
            List<Pedido> pedidos = pedCont.listaPedido();
        %>

        <br>
        <br>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Data compra</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Observação</th>
                    <th scope="col">Status</th>
                    <th scope="col">ID Funcionario</th>
                    <th scope="col">ID Cliente</th>
                    <th scope="col">ID Carro</th>
                </tr>
            </thead>
            <% if (!(pedidos.isEmpty())) { %>    
            <tbody>
                <%
                    int cont = 0;

                    for (Pedido p : pedidos) {

                        long idPe = 0;
                        Pedido pedSai = new Pedido();
                        ClientePedido cliPedSai = new ClientePedido();
                        Funcionario funSai = new Funcionario(idPe, null, null);
                        Cliente cliSai = new Cliente(idPe, null, null);
                        Carro carSai = new Carro();

                        PedidoControle pedCon = new PedidoControle();

                        idPe = p.getIdPedido();
                        pedSai = new Pedido(idPe, null, null, null, null, null, null);
                        try {
                            pedSai = pedCon.buscaPedido(pedSai, funSai);
                            funSai = pedSai.getIdFuncionario();
                            carSai = pedSai.getIdCarro();
                        } catch (Exception e) {
                            pedSai = null;
                            System.err.println(e);
                        }

                        if (pedSai != null) {
                            try {
                                cliPedSai.setIdPedido(pedSai);
                                cliPedSai = pedCon.buscaClientePedido(pedSai, cliSai);
                                cliSai = cliPedSai.getIdCliente();
                            } catch (Exception e) {
                                pedSai = null;
                                System.err.println(e);
                            }
                        }
                        if (pedSai != null && cliPedSai != null) {
                            cont += 1;

                %>
                <tr>
                    <th scope="row"><%=cont%></th>
                    <td><%=pedSai.getIdPedido()%></td>
                    <td><%=pedSai.getDtCompra()%></td>
                    <td><%=pedSai.getValor()%></td>
                    <td><%=pedSai.getObservacao()%></td>
                    <td><%=pedSai.getStatus()%></td>
                    <td><%=funSai.getIdFuncionario()%></td>
                    <td><%=cliSai.getIdCliente()%></td>
                    <td><%=carSai.getIdCarro()%></td>
                </tr>
                <% } %>
            </tbody>
            <% }
                }%>
        </table>                         


    </body>
</html>
<%
} else if (cli != null) {

    //buscar pessoa especifica chamada
    long idPe = cli.getIdCliente();

    Pedido pedSai = new Pedido();
    ClientePedido cliPedSai = new ClientePedido();
    Funcionario funSai = new Funcionario(idPe, null, null);
    Cliente cliSai = new Cliente(idPe, null, null);
    Carro carSai = new Carro();

    PedidoControle pedCon = new PedidoControle();

    pedSai = new Pedido(idPe, null, null, null, null, null, null);


    try {
        cliPedSai.setIdPedido(pedSai);
        cliPedSai = pedCon.buscaClientePedido(pedSai, cliSai);
        cliSai = cliPedSai.getIdCliente();
        pedSai = cliPedSai.getIdPedido();
    } catch (Exception e) {
        pedSai = null;
        ///System.err.println(e);
    }

    if (pedSai != null) {
        try {
            pedSai = pedCon.buscaPedido(pedSai, funSai);
            funSai = pedSai.getIdFuncionario();
            carSai = pedSai.getIdCarro();
        } catch (Exception e) {
            pedSai = null;
            System.err.println(e);
        }
    }

    if (pedSai != null && cliPedSai != null) {%>

<br>
<br>
<br>

<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">ID</th>
            <th scope="col">Data compra</th>
            <th scope="col">Valor</th>
            <th scope="col">Observação</th>
            <th scope="col">Status</th>
            <th scope="col">ID Funcionario</th>
            <th scope="col">ID Cliente</th>
            <th scope="col">ID Carro</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td><%=pedSai.getIdPedido()%></td>
            <td><%=pedSai.getDtCompra()%></td>
            <td><%=pedSai.getValor()%></td>
            <td><%=pedSai.getObservacao()%></td>
            <td><%=pedSai.getStatus()%></td>
            <td><%=funSai.getIdFuncionario()%></td>
            <td><%=cliSai.getIdCliente()%></td>
            <td><%=carSai.getIdCarro()%></td>
        </tr>
    </tbody>
</table>

<%}

        }

    }%>