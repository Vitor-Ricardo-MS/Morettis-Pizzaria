<!DOCTYPE html>
<html lang="pt-BR">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Página Usuário</title>
   <link rel="stylesheet" type="text/css" href="/static/css/usuario.css?V3">
   <script src="/static/js/websocket/socket.io.min.js?V3"></script>
</head>
<body>

      <div class="barraTopo">
         <div class="BarraTopoLeft">
            <h1>Página de Usuário</h1>
         </div>
         <div class="userInfo">
            <input class="username" type="hidden" id="username" name="username" value="{{current_user.username}}">
            <h3>Username: {{current_user.username}}</h3>
            <h3>Password: {{current_user.password}}</h3>
         </div>
         <div class="BarraTopoRight">
            <a class="Butoes" href="/menu/{{current_user.username}}"><button class="Butoes">Menu</button></a>
            %if current_user.username == "admin":
               <a class="Butoes" href="/admin"><button class="Butoes">Admin</button></a>
            %end
            <form action="/logout" method="post">  <button type="submit">Sair</button>  </form>
         </div>
      </div>

      <div class="Menu">
         <div class="Cart">
               <div class="CartTopo">
                  <h3>Carrinho</h3>
               </div>
               <div class="CartContents">
               </div>
               <div class="CartBott">
                  <h3 class=PrecTot></h3>
                  <button class="EnvPedBtn">Enviar Pedido</button>
               </div>
         </div>
         <div class="Peds">
            <div class="PedsTopo">
               <h3>Pedidos</h3>
            </div>
            <div class="PedsContents">
            </div>
            <div class="PedsBott">
            </div>
         </div>
      </div>

      <div class="EnvPopup">
         <div class="popMenu">
            <h2>Deseja realmente enviar o pedido?</h2>
            <div class="popButts">
               <button class="Yes" onclick="sendPedido()">Sim</button>
               <button class="No" onclick="closeEnvPop()">Não</button>
            </div>
         </div>
      </div>

      <div class="DelPopup">
         <div class="popMenu">
            <h2>Deseja realmente remover este item do carrinho?</h2>
            <h3 class="DelPopItem"></h3>
            <div class="popButts">
               <button class="Yes" onclick="deleteItem()">Sim</button>
               <button class="No" onclick="closeDelPop()">Não</button>
            </div>
         </div>
      </div>

   <script src="/static/js/usuario.js?V1.4"></script>
</body>
</html>