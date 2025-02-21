<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/pedadmin.css?V5">
    <script src="/static/js/websocket/socket.io.min.js?V3"></script>
    <title>Admin</title>
</head>
<body>

    <div class="BarraTopo">
        <div class="BarraTopoText">
            <h2>Menu de Administração de Pedidos</h2>
        </div>
        <a href="/admin"><button>Produtos</button></a>
        <a href="/menu/{{current_user.username}}"><button>Menu</button></a>
        <a href="/usuario/{{current_user.username}}"><button>Usuário</button></a>
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

    <div class="DelPopup">
         <div class="popMenu">
            <h2>Deseja realmente encerrar este pedido?</h2>
            <h3 class="DelPopItem"></h3>
            <div class="popButts">
               <button class="Yes" onclick="deletePed()">Sim</button>
               <button class="No" onclick="closeDelPop()">Não</button>
            </div>
         </div>
      </div>

    <script src = "../static/js/pedadmin.js?V1.9"></script>
</body>
</html>