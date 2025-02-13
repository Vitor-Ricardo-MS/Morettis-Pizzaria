
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/login.css?V1.1">
    <title>Login</title>
</head>
<body>

    <div class="Tela">
        <h1 class="Title">Login</h1>
        <form class="Form1" action="/login" method="post">
            <label for="username">Nome</label><br>
            <input id="username" name="username" type="text" required /><br>

            <label for="password">Senha</label><br>
            <input id="password" name="password" type="password" required /><br>

            <button type="submit" />Login</button>
        </form>
        <form action="/logout" method="post">
            <button type="submit">Sair</button>
        </form>
    </div>

</body>
</html>