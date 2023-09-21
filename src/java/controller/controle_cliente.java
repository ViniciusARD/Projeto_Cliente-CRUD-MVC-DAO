/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;

/**
 *
 * @author vinicius.arado
 */
@WebServlet(name = "controle_cliente", urlPatterns = {"/controle_cliente"})
public class controle_cliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Obtém o valor do parâmetro "op" da requisição
            String op = request.getParameter("op");
            // Instancia o ClienteDAO
            ClienteDAO cdao = new ClienteDAO();
            // Instancia um objeto Cliente
            Cliente c = new Cliente();

            if (op.equals("CADASTRAR")) {
                // Obtém os valores dos parâmetros da requisição
                String cpf = request.getParameter("txtcpf");
                String nome = request.getParameter("txtnome");
                int idade = Integer.parseInt(request.getParameter("txtidade"));
                String sexo = request.getParameter("txtsexo");
                String endereco = request.getParameter("txtendereco");
                String telefone = request.getParameter("txttelefone");
                String email = request.getParameter("txtemail");
                String profissao = request.getParameter("txtprofissao");
                double renda = Double.parseDouble(request.getParameter("txtrenda"));
                String estado_civil = request.getParameter("txtestado_civil");
                String nivel_educacional = request.getParameter("txtnivel_educacional");

                // Define os valores no objeto Cliente
                c.setCpf(cpf);
                c.setNome(nome);
                c.setIdade(idade);
                c.setSexo(sexo);
                c.setEndereco(endereco);
                c.setTelefone(telefone);
                c.setEmail(email);
                c.setProfissao(profissao);
                c.setRenda(renda);
                c.setEstadoCivil(estado_civil);
                c.setNivelEducacional(nivel_educacional);
                String msg = "Cadastrar";
                try {
                    // Chama o método cadastrar do ClienteDAO para realizar o cadastro
                    cdao.cadastrar(c);
                    System.out.println("Cadastrado com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);

                }

            } else if (op.equals("DELETAR")) {
                // Obtém o valor do parâmetro "txtid" da requisição
                int id;
                try {
                    id = Integer.parseInt(request.getParameter("txtid"));
                } catch (NumberFormatException e) {
                    String msg = "ID é um campo obrigatório e deve ser um número válido. ";
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                    return;
                }
                c.setId(id);
                String msg = "Deletar";
                try {
                    // Chama o método deletar do ClienteDAO para realizar a exclusão
                    cdao.deletar(c);
                    System.out.println("Deletar com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }

            } else if (op.equals("CONSULTAR BY ID")) {
                // Obtém o valor do parâmetro "txtid" da requisição
                int id;
                try {
                    id = Integer.parseInt(request.getParameter("txtid"));
                } catch (NumberFormatException e) {
                    String msg = "ID é um campo obrigatório e deve ser um número válido. ";
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                    return;
                }
                c.setId(id);
                try {
                    // Chama o método consultarById do ClienteDAO para obter os dados do cliente pelo ID
                    c = cdao.consultarById(c);
                    request.setAttribute("c", c);
                    request.getRequestDispatcher("resultadoconsultarbyid.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

            } else if (op.equals("CONSULTAR TODOS")) {
                try {
                    // Chama o método consultarTodos do ClienteDAO para obter a lista de todos os clientes
                    List<Cliente> lcli = cdao.consultarTodos();
                    request.setAttribute("lcli", lcli);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

            } else if (op.equals("ATUALIZAR")) {
                // Obtém o valor do parâmetro "txtid" da requisição
                int id;
                try {
                    id = Integer.parseInt(request.getParameter("txtid"));
                } catch (NumberFormatException e) {
                    String msg = "ID é um campo obrigatório e deve ser um número válido. ";
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                    return;
                }
                c.setId(id);
                try {
                    // Chama o método consultarById do ClienteDAO para obter os dados do cliente pelo ID
                    c = cdao.consultarById(c);
                    request.setAttribute("c", c);
                    request.getRequestDispatcher("resultadoconsultaratualizar.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

            } else if (op.equals("EFETIVAR ATUALIZAÇÃO")) {
                // Obtém os valores dos parâmetros da requisição
                int id = Integer.parseInt(request.getParameter("txtid"));
                String cpf = request.getParameter("txtcpf");
                String nome = request.getParameter("txtnome");
                int idade = Integer.parseInt(request.getParameter("txtidade"));
                String sexo = request.getParameter("txtsexo");
                String endereco = request.getParameter("txtendereco");
                String telefone = request.getParameter("txttelefone");
                String email = request.getParameter("txtemail");
                String profissao = request.getParameter("txtprofissao");
                double renda = Double.parseDouble(request.getParameter("txtrenda"));
                String estado_civil = request.getParameter("txtestado_civil");
                String nivel_educacional = request.getParameter("txtnivel_educacional");

                // Define os valores no objeto Cliente
                c.setId(id);
                c.setCpf(cpf);
                c.setNome(nome);
                c.setIdade(idade);
                c.setSexo(sexo);
                c.setEndereco(endereco);
                c.setTelefone(telefone);
                c.setEmail(email);
                c.setProfissao(profissao);
                c.setRenda(renda);
                c.setEstadoCivil(estado_civil);
                c.setNivelEducacional(nivel_educacional);
                String msg = "Atualizar";
                try {
                    // Chama o método atualizar do ClienteDAO para realizar a atualização
                    cdao.atualizar(c);
                    System.out.println("Atuaizado com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
