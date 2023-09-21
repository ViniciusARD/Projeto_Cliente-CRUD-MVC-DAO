<html>
<head>
    <title>Cadastro de Cliente</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Inclusão do arquivo de estilo externo -->
    <link rel="stylesheet" href="./Style/Style_idpage.css">
    
    <!-- Definição do ícone da página -->
    <link rel="icon" href="./IMAGENS/pessoa-ico.png" type="image/png">
    
    <!-- Script JavaScript para redirecionar ao consultar todos -->
    <script type="text/javascript">
        function carregarconsultartodos() {
            window.location = "/Proj_Cliente/controle_cliente?op=CONSULTAR TODOS";
        }
    </script>
</head>

<body>
    <!-- Link para voltar -->
        <a href="http://localhost:8080/Proj_Cliente/" class="back-link">
            <img src="IMAGENS/casa.png" alt="Voltar" width="50" height="50">
        </a>
    
    <!-- Formulário de cadastro de cliente -->
    <form name="f1" action="controle_cliente" method="GET">
        <h1>CLIENTE</h1> 
        <!-- Segunda lista de perguntas -->
        <ul class="question-list">    
            <li>
                <label>ID do Cliente:</label>
                <input type="text" name="txtid" pattern="[0-9]+" title="Digite apenas números inteiros">
            </li>
        </ul>
        
        <!-- Botões de ação -->
        <div class="button-container">
            <input type="submit" name="op" value="ATUALIZAR">
            <input type="submit" name="op" value="DELETAR">
            <input type="submit" name="op" value="CONSULTAR BY ID">
            <input type="submit" name="op" value="CONSULTAR TODOS">
        </div>  
    </form>
</body>
</html>
