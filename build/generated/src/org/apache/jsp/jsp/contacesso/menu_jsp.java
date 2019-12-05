package org.apache.jsp.jsp.contacesso;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import concessionariaWtt.modelo.Carro;
import concessionariaWtt.modelo.ClientePedido;
import concessionariaWtt.modelo.Pedido;
import concessionariaWtt.controle.PedidoControle;
import java.util.List;
import java.util.List;
import concessionariaWtt.modelo.Pessoa;
import concessionariaWtt.controle.PessoaControle;
import concessionariaWtt.modelo.Funcionario;
import concessionariaWtt.controle.FuncionarioControle;
import concessionariaWtt.modelo.Cliente;
import concessionariaWtt.controle.ClienteControle;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/jsp/contacesso/../../inc/materalizeWeb.inc");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <!-- Compiled and minified CSS -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n");
      out.write("    <!-- Compiled and minified JavaScript -->\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("</head>");
      out.write("\n");
      out.write("    <title>MENU </title>\n");
      out.write("    <body>\n");
      out.write("        ");


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
        
      out.write("\n");
      out.write("        <div class=\"alert alert-danger\" role=\"alert\">\n");
      out.write("            Erro ao entrar! <strong>Login ou senha invaliados</strong> <a href=\"login.jsp\" class=\"alert-link\">Tentar novamente</a>\n");
      out.write("        </div> \n");
      out.write("\n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("        <div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n");
      out.write("            <strong>Sucesso ao entrar!</strong>\n");
      out.write("            <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("            </button>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");

            //executa script
            session.setAttribute("UsuarioLogado", pesSai);
            session.setAttribute("FuncionarioLogado", fun);
            session.setAttribute("ClienteLogado", cli);

            if (fun != null && tipo.equals("F")) {

        
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"menu.jsp\">Home</a>\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNavDropdown\" aria-controls=\"navbarNavDropdown\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarNavDropdown\">\n");
      out.write("                    <ul class=\"navbar-nav\">\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../pessoa/consultarPessoa.jsp\" id=\"navbarDropdownMenuLink1\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Pessoas\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink1\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pessoa/consultarPessoa.jsp\">Consultar cadastro</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pessoa/inserirPessoa.jsp\">Inserir cadastro</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pessoa/alterarPessoa.jsp\">Alterar cadastro</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pessoa/desativarPessoa.jsp\">Desativar cadastro</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../cliente/consultarCliente.jsp\" id=\"navbarDropdownMenuLink2\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Cliente\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink2\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../cliente/consultarCliente.jsp\">Consultar</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../cliente/inserirCliente.jsp\">Inserir</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../cliente/alterarCliente.jsp\">Alterar</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        ");
 if (fun.getFuncao().equals("ADM")) { 
      out.write(" \n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../funcionario/consultarFuncionario.jsp\" id=\"navbarDropdownMenuLink3\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Funcionario\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink3\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../funcionario/consultarFuncionario.jsp\">Consultar</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../funcionario/inserirFuncionario.jsp\">Inserir</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../funcionario/alterarFuncionario.jsp\">Alterar</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../carro/consultarCarro.jsp\" id=\"navbarDropdownMenuLink4\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Carro\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink4\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../carro/consultarCarro.jsp\">Consultar</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../carro/inserirCarro.jsp\">Inserir</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../carro/alterarCarro.jsp\">Alterar</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../pedido/consultarPedido.jsp\" id=\"navbarDropdownMenuLink5\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Pedido\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink5\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pedido/consultarPedido.jsp\">Consultar</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pedido/inserirPedido.jsp\">Inserir</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pedido/alterarPedido.jsp\">Alterar</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../pedido/desativarPedido.jsp\">Cancelar</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"../contacesso/login.jsp\" id=\"navbarDropdownMenuLink6\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                Sair\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink6\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"../contacesso/login.jsp\">Sair</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            PedidoControle pedCont = new PedidoControle();
            List<Pedido> pedidos = pedCont.listaPedido();
        
      out.write("\n");
      out.write("\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th scope=\"col\">#</th>\n");
      out.write("                    <th scope=\"col\">ID</th>\n");
      out.write("                    <th scope=\"col\">Data compra</th>\n");
      out.write("                    <th scope=\"col\">Valor</th>\n");
      out.write("                    <th scope=\"col\">Observação</th>\n");
      out.write("                    <th scope=\"col\">Status</th>\n");
      out.write("                    <th scope=\"col\">ID Funcionario</th>\n");
      out.write("                    <th scope=\"col\">ID Cliente</th>\n");
      out.write("                    <th scope=\"col\">ID Carro</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            ");
 if (!(pedidos.isEmpty())) { 
      out.write("    \n");
      out.write("            <tbody>\n");
      out.write("                ");

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

                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <th scope=\"row\">");
      out.print(cont);
      out.write("</th>\n");
      out.write("                    <td>");
      out.print(pedSai.getIdPedido());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(pedSai.getDtCompra());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(pedSai.getValor());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(pedSai.getObservacao());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(pedSai.getStatus());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(funSai.getIdFuncionario());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(cliSai.getIdCliente());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(carSai.getIdCarro());
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("            ");
 }
            }
      out.write("\n");
      out.write("        </table>                         \n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");

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

    pedSai = new Pedido(idPe, null, null, null, null, null, null);
   // try {
        ClientePedido cliPed = pedCon.buscaClientePedido(pedSai, cliSai);
        pedSai = pedCon.buscaPedido(pedSai, funSai);
        funSai = pedSai.getIdFuncionario();
        carSai = pedSai.getIdCarro();
   // } catch (Exception e) {
        pedSai = null;
    //    System.err.println(e);
   // }

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
      out.write("\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<table class=\"table table-striped\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th scope=\"col\">#</th>\n");
      out.write("            <th scope=\"col\">ID</th>\n");
      out.write("            <th scope=\"col\">Data compra</th>\n");
      out.write("            <th scope=\"col\">Valor</th>\n");
      out.write("            <th scope=\"col\">Observação</th>\n");
      out.write("            <th scope=\"col\">Status</th>\n");
      out.write("            <th scope=\"col\">ID Funcionario</th>\n");
      out.write("            <th scope=\"col\">ID Cliente</th>\n");
      out.write("            <th scope=\"col\">ID Carro</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        <tr>\n");
      out.write("            <th scope=\"row\">1</th>\n");
      out.write("            <td>");
      out.print(pedSai.getIdPedido());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(pedSai.getDtCompra());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(pedSai.getValor());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(pedSai.getObservacao());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(pedSai.getStatus());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(funSai.getIdFuncionario());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(cliSai.getIdCliente());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(carSai.getIdCarro());
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("\n");
}

                }

            }
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
