<%@page import="java.util.List"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Início da página HTML -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado Consultar Todos</title>

        <!-- Importação do arquivo de estilo CSS -->
        <link rel="stylesheet" href="./Style/Style_consultartodos.css">
        
        <!-- Ícone da página -->
        <link rel="icon" href="./IMAGENS/pessoa-ico.png" type="image/png">
    </head>
    <body>

        <!-- Link de voltar -->
        <a href="http://localhost:8080/Proj_Cliente/" class="back-link">
            <img src="IMAGENS/casa.png" alt="Voltar" width="50" height="50">
        </a>

        <!-- Título principal -->
        <h1>Todos os Clientes</h1>

        <% List<Cliente> lcli = (List<Cliente>) request.getAttribute("lcli"); %>

        <!-- Tabela de clientes -->
        <table class="customer-table">
            <!-- Cabeçalhos da tabela -->
            <tr>
                <th>ID</th>
                <th>CPF</th>
                <th>Nome</th>
                <th>Idade</th>
                <th>Sexo</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Profissão</th>
                <th>Renda Mensal</th>
                <th>Estado Civil</th>
                <th>Nível Educacional</th>
                <th>Remover</th>
                <th>Editar</th>
            </tr>

            <% for (Cliente c : lcli) { %>
            <!-- Linha de dados para cada cliente -->
            <tr>
                <td><% out.print(c.getId()); %></td>
                <td><% out.print(c.getCpf()); %></td>
                <td><% out.print(c.getNome()); %></td>
                <td><% out.print(c.getIdade()); %></td>
                <td><% out.print(c.getSexo()); %></td>
                <td><% out.print(c.getEndereco()); %></td>
                <td><% out.print(c.getTelefone()); %></td>
                <td><% out.print(c.getEmail()); %></td>
                <td><% out.print(c.getProfissao()); %></td>
                <td><% out.print(c.getRenda()); %></td>
                <td><% out.print(c.getEstadoCivil()); %></td>
                <td><% out.print(c.getNivelEducacional()); %></td>
                <td style="text-align: center;">
                    <a href="http://localhost:8080/Proj_Cliente/controle_cliente?op=DELETAR&txtid=<%out.print(c.getId());%>">
                        <img src="IMAGENS/lixeira.png" width="30" height="30"></a>
                </td>
                <td style="text-align: center;">
                    <a href="http://localhost:8080/Proj_Cliente/controle_cliente?txtid=<%out.print(c.getId());%>&txtrg=<%out.print(c.getCpf());%>&txtnome=<%out.print(c.getNome());%>&txtidade=<%out.print(c.getIdade());%>&txtsexo=<%out.print(c.getSexo());%>&txtendereco=<%out.print(c.getEndereco());%>&txttelefone=<%out.print(c.getTelefone());%>&txtemail=<%out.print(c.getEmail());%>&txtprofissao=<%out.print(c.getProfissao());%>&txtrenda=<%out.print(c.getRenda());%>&txtestado_civil=<%out.print(c.getEstadoCivil());%>&txtnivel_educacional=<%out.print(c.getNivelEducacional());%>&op=ATUALIZAR">
                        <img src="IMAGENS/editar.png" width="27" height="27"></a>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
