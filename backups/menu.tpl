<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css?V1.61">
    <title>Menu</title>
</head>
<body>

        <div class="BarraTopo">
                <div class= "BarraTopoLeft">
                    <img class='Logo' src={{'../static/img/Piizzaa.png?V1.1'}}/>
                    <h1 class="Title">Moretti's Pizzaria</h1>
                </div>
                <div>
                    <a href="/usuario"><button>Carrinho</button></a>
                </div>
        </div>

        <div class="MenuPart">
            <div class="tab-buttons">
                <button class="tab-btn active" content-id="pizzas">Pizzas</button>
                <button class="tab-btn" content-id="bebidas">Bebidas</button>
                <button class="tab-btn" content-id="sobremesas">Sobremesas</button>
            </div>

            <div class="tab-contents">
                <div class="content show" id="pizzas">
                    <div class="item">
                        <h3>Pizza Grande</h3>
                        <p>$ 30,00</p>
                        <select name="sabores" id="sabores">
                            {{Allsabores}}
                        </select> 
                    </div>
                </div>
                <div class="content" id="bebidas">
                    %prods = Allprodutos.get_models()
                    %for model in prods:
                        %if model.tipo == "bebida":
                            <div class="item">
                                <div class="nomeitem">
                                    <h2>{{model.nome}}</h2>
                                </div>
                                <div class="info">
                                    <h3>Sabor = {{model.sabor}}</h3>
                                </div>
                                <div class="preço">
                                    <h3>R$ {{model.preço}}</h3>
                                </div>
                            </div>
                </div>
                <div class="content" id="sobremesas">
                    %for model in Allprodutos.get_models():
                        %if model.tipo == "sobremesa":
                            <div class="item">
                                <div class="nomeitem">
                                    <h2>{{model.nome}}</h2>
                                </div>
                                <div class="info">
                                    <h3>Sabor = {{model.sabor}}</h3>
                                </div>
                                <div class="preço">
                                    <h3>R$ {{model.preço}}</h3>
                                </div>
                            </div>
                </div>
            </div>
        </div>

        <script src = "../static/js/menu.js?V1.3"></script>
</body>
</html>