<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado Consultar Por ID</title>

        <!-- Inclui o link para o arquivo de estilo CSS -->
        <link rel="stylesheet" href="./Style/Style_consultarbyid.css">
        <!-- Inclui o ícone da página -->
        <link rel="icon" href="./IMAGENS/pessoa-ico.png" type="image/png">
    </head>
    <body>
        <!-- Cria um link para voltar à página inicial -->
        <a href="http://localhost:8080/Proj_Cliente/" class="back-link">
            <img src="IMAGENS/casa.png" alt="Voltar" width="50" height="50">
        </a>

        <!-- Container para exibir o resultado da consulta -->
        <div class="result-container">
            <!-- Título da página -->
            <h1>Resultado Consultar Por ID</h1>
            
            <% Cliente c = (Cliente) request.getAttribute("c"); %>
            
            <% if (c.getNome() != null) { %>
                <!-- Exibe as informações do cliente -->
                <p>ID: <% out.print(c.getId()); %></p>
                <p>RG: <% out.print(c.getCpf()); %></p>
                <p>NOME: <% out.print(c.getNome()); %></p>
                <p>IDADE: <% out.print(c.getIdade()); %></p>
                <p>SEXO: <% out.print(c.getSexo()); %></p>
                <p>ENDEREÇO: <% out.print(c.getEndereco()); %></p>
                <p>TELEFONE: <% out.print(c.getTelefone()); %></p>
                <p>EMAIL: <% out.print(c.getEmail()); %></p>
                <p>PROFISSÃO: <% out.print(c.getProfissao()); %></p>
                <p>RENDA: <% out.print(c.getRenda()); %></p>
                <p>ESTADO CIVIL: <% out.print(c.getEstadoCivil()); %></p>
                <p>NÍVEL EDUCACIONAL: <% out.print(c.getNivelEducacional()); %></p>
            <% } else { %>
                <!-- Exibe mensagem se o cliente não for encontrado -->
                <h2>Cliente não encontrado.</h2>
            <% }%>
        </div>
    </body>
</html>
