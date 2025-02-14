<!DOCTYPE html>
<html lang="pt-BR">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Página Usuário</title>
   <link rel="stylesheet" type="text/css" href="/static/css/usuario.css?V1.1">
   <script src="/static/js/usuario.js"></script>
</head>
<body>

      <div>
         <h1 class="Title">Usuário</h1>
         <div class="Contents">
            <h3>Username: {{current_user.username}}</h3>
            <h3>Password: {{current_user.password}}</h3>
            <h3>Carrinho: {{current_user.cart}}</h3>
            <a class="Butoes" href="/menu/{{current_user.username}}"><button class="Butoes">Menu</button></a>
            %if current_user.username == "admin":
               <a class="Butoes" href="/admin"><button class="Butoes">Admin</button></a>
            %end
            <form action="/logout" method="post">  <button type="submit">Sair</button>  </form>
         </div>
      </div>

</body>
</html>