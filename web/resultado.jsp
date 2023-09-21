<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Resultado</title>

        <link rel="stylesheet" href="./Style/Style_erro_resultado.css">
        <link rel="icon" href="./IMAGENS/pessoa-ico.png" type="image/png">
    </head>
    <body>
        <!-- Link de voltar -->
        <a href="http://localhost:8080/Proj_Cliente/" class="back-link">
            <img src="IMAGENS/casa.png" alt="Voltar" width="50" height="50">
        </a>
        
        <div class="message-box">
            <%  
            // Recupera a mensagem de sucesso da requisição
            String msg = (String) request.getAttribute("message");
            %>
            
            <!-- Exibe a mensagem de sucesso -->
            <h1><% out.println(msg);%> realizado com sucesso.</h1>
        </div>
    </body>
</html>
