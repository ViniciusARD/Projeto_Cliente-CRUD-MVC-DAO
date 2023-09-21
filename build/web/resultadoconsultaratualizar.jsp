<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar</title>

        <link rel="stylesheet" href="./Style/Style_consultaratualizar.css">
        <link rel="icon" href="./IMAGENS/pessoa-ico.png" type="image/png">
    </head>
    <body>
        <!-- Link para voltar -->
        <a href="http://localhost:8080/Proj_Cliente/" class="back-link">
            <img src="IMAGENS/casa.png" alt="Voltar" width="50" height="50">
        </a>

        <!-- Contêiner do formulário -->
        <div class="form-container">
            <h1>Atualizar dados do Cliente</h1>
            <% Cliente c = (Cliente) request.getAttribute("c"); %>
            <% if (c.getNome() != null) { %>
            <form name="f1" action="controle_cliente" method="GET">
                <!-- Mostrar o ID do cliente -->
                <p>ID: <% out.print(c.getId()); %></p>
                <input type="hidden" name="txtid" value="<% out.print(c.getId()); %>">
                <!-- Campos para atualização -->
                <p>CPF: <input type="text" name="txtcpf" id="cpfInput" pattern="[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" title="Digite um CPF válido" value="<% out.print(c.getCpf()); %>" required></p>

                <script>
                    // Função para aplicar a máscara no campo do CPF
                    function maskCPF(input) {
                        let value = input.value.replace(/\D/g, ''); // Remove todos os caracteres não numéricos

                        if (value.length > 3) {
                            value = value.replace(/^(\d{3})(\d{3})(\d{3})(\d{2}).*/, '$1.$2.$3-$4'); // Aplica a máscara XXX.XXX.XXX-XX
                        }

                        input.value = value; // Define o valor formatado de volta ao campo
                    }

                    // Obtém a referência para o campo de input do CPF
                    const cpfInput = document.getElementById('cpfInput');

                    // Adiciona um ouvinte de evento para chamar a função de máscara sempre que o valor do campo mudar
                    cpfInput.addEventListener('input', function () {
                        maskCPF(this);
                    });
                </script>

                <p>Nome: <input type="text" name="txtnome" value="<% out.print(c.getNome()); %>" required></p>
                <p>Idade: <input type="text" name="txtidade" pattern="[0-9]+" title="Digite apenas números inteiros" value="<% out.print(c.getIdade()); %>" required></p>
                <p>Sexo:
                    <select name="txtsexo">
                        <!-- Definir a opção selecionada com base no sexo do cliente -->
                        <option value="masculino" <% if (c.getSexo().equals("masculino")) {
                                out.print("selected");
                            } %>>Masculino</option>
                        <option value="feminino" <% if (c.getSexo().equals("feminino")) {
                                out.print("selected");
                            } %>>Feminino</option>
                        <option value="outro" <% if (c.getSexo().equals("outro")) {
                                out.print("selected");
                            } %>>Outro</option>
                    </select>
                </p>
                <p>Endereco: <input type="text" name="txtendereco" value="<% out.print(c.getEndereco()); %>" required></p>

                <p>DDD + Número de Telefone: <input type="text" name="txttelefone" id="telefoneInput" pattern="\(\d{2}\)\d{5}-\d{4}" title="Digite um número de telefone válido" value="<% out.print(c.getTelefone()); %>" required></p>

                <script>
                    // Função para aplicar a máscara no campo do telefone
                    function maskTelefone(input) {
                        let value = input.value.replace(/\D/g, ''); // Remove todos os caracteres não numéricos

                        if (value.length > 2) {
                            value = value.replace(/^(\d{2})(\d{5})(\d{4}).*/, '($1)$2-$3'); // Aplica a máscara (XX)XXXXX-XXXX
                        }

                        input.value = value; // Define o valor formatado de volta ao campo
                    }

                    // Obtém a referência para o campo de input do telefone
                    const telefoneInput = document.getElementById('telefoneInput');

                    // Adiciona um ouvinte de evento para chamar a função de máscara sempre que o valor do campo mudar
                    telefoneInput.addEventListener('input', function () {
                        maskTelefone(this);
                    });
                </script>

                <p>Email: <input type="text" name="txtemail" value="<% out.print(c.getEmail()); %>" required></p>
                <p>Profissão: <input type="text" name="txtprofissao" value="<% out.print(c.getProfissao()); %>" required></p>
                <p>Renda Mensal: <input type="text" name="txtrenda" pattern="[0-9]+(\.[0-9]+)?" title="Digite apenas números válidos" value="<% out.print(c.getRenda()); %>" required></p>
                <p>Estado Civil:
                    <select name="txtestado_civil">
                        <!-- Definir a opção selecionada com base no estado civil do cliente -->
                        <option value="solteiro" <% if (c.getEstadoCivil().equals("solteiro")) {
                                out.print("selected");
                            } %>>Solteiro</option>
                        <option value="casado" <% if (c.getEstadoCivil().equals("casado")) {
                                out.print("selected");
                            } %>>Casado</option>
                        <option value="divorciado" <% if (c.getEstadoCivil().equals("divorciado")) {
                                out.print("selected");
                            } %>>Divorciado</option>
                        <option value="viuvo" <% if (c.getEstadoCivil().equals("viuvo")) {
                                out.print("selected");
                            } %>>Viúvo</option>
                        <option value="outro" <% if (c.getEstadoCivil().equals("outro")) {
                                out.print("selected");
                            } %>>Outro</option>
                    </select>
                </p>

                <p>Nível Educacional:
                    <select name="txtnivel_educacional">
                        <!-- Definir a opção selecionada com base no nível educacional do cliente -->
                        <option value="fundamental" <% if (c.getNivelEducacional().equals("fundamental")) {
                                out.print("selected");
                            } %>>Ensino Fundamental</option>
                        <option value="medio" <% if (c.getNivelEducacional().equals("medio")) {
                                out.print("selected");
                            } %>>Ensino Médio</option>
                        <option value="superior" <% if (c.getNivelEducacional().equals("superior")) {
                                out.print("selected");
                            } %>>Ensino Superior</option>
                        <option value="pos-graduacao" <% if (c.getNivelEducacional().equals("pos-graduacao")) {
                                out.print("selected");
                            } %>>Pós-graduação</option>
                        <option value="outro" <% if (c.getNivelEducacional().equals("outro")) {
                                out.print("selected");
                            } %>>Outro</option>
                    </select>
                </p>

                <!-- Botão de envio do formulário -->
                <div class="button-container">
                    <input type="submit" name="op" value="EFETIVAR ATUALIZAÇÃO">
                </div>
            </form>

            <% } else { %>
            <!-- Exibir mensagem de cliente não encontrado -->
            <h2>Cliente não encontrado.</h2>
            <% }%>
        </div>
    </body>
</html>
