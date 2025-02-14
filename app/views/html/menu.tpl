<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css?V32">
    <title>Menu</title>
</head>
<body>

        <div class="BarraTopo">
                <div class= "BarraTopoLeft">
                    <img class='Logo' src={{'../static/img/Piizzaa.png?V1.1'}}/>
                    <h1 class="Title">Moretti's Pizzaria</h1>
                </div>
                <div class= "BarraTopoRight">
                %if current_user:
                    <h2 class= "Usu">Usuário: {{current_user.username}}</h2>
                    <a href="/usuario/{{current_user.username}}"><button>Usuário</button></a>
                %else:
                    <h2 class= "Usu">Usuário: Nenhum</h2>
                    <a href="/login"><button>Login</button></a>
                %end
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
                        <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                        <div class="itemInfo">
                            <div class="nomeitem">
                                <h2>Pizza Grande</h2>
                            </div>
                            <div class="info">
                                <h3>A maior</h3>
                            </div>
                            <div class="preço">
                                <h3>R$ 29.99</h3>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                        <div class="itemInfo">
                            <div class="nomeitem">
                                <h2>Pizza Média</h2>
                            </div>
                            <div class="info">
                                <h3>A média</h3>
                            </div>
                            <div class="preço">
                                <h3>R$ 24.99</h3>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                        <div class="itemInfo">
                            <div class="nomeitem">
                                <h2>Pizza Pequena</h2>
                            </div>
                            <div class="info">
                                <h3>A menor</h3>
                            </div>
                            <div class="preço">
                                <h3>R$ 19.99</h3>
                            </div>
                        </div>
                    </div>
                        <select name="sabores" id="sabores">
                        %for model in Allsabores:
                            %if model.tipo == "pizza":
                                %for sabor in model.listaSabor:
                                    <option value={{sabor}}>{{sabor}}</option>
                                %end
                            %end
                        %end
                        </select> 
                </div>
                <div class="content" id="bebidas">
                %for model in Allprodutos:
                    %if model.tipo == "bebida":
                        %if model.alcoolico == False:
                            <div class="item">
                                <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                                <div class="itemInfo">
                                    <div class="nomeitem">
                                        <h2>{{model.nome}}</h2>
                                    </div>
                                    <div class="info">
                                        <h3>Info: alcoolico? {{model.alcoolico}}</h3>
                                    </div>
                                    <div class="preço">
                                        <h3>R$ {{model.preco}}</h3>
                                    </div>
                                </div>
                            </div>
                        %end
                    %end
                %end
                %for model in Allprodutos:
                    %if model.tipo == "bebida":
                        %if model.alcoolico == True:
                            <div class="item">
                                <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                                <div class="itemInfo">
                                    <div class="nomeitem">
                                        <h2>{{model.nome}}</h2>
                                    </div>
                                    <div class="info">
                                        <h3>Info: alcoolico? {{model.alcoolico}}</h3>
                                    </div>
                                    <div class="preço">
                                        <h3>R$ {{model.preco}}</h3>
                                    </div>
                                </div>
                            </div>
                        %end
                    %end
                %end
                </div>
                <div class="content" id="sobremesas">
                %for model in Allprodutos:
                    %if model.tipo == "sobremesa":
                        <div class="item">
                            <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                            <div class="itemInfo">
                                <div class="nomeitem">
                                    <h2>{{model.nome}}</h2>
                                </div>
                                <div class="info">
                                    <h3>Info: {{model.sabor}}</h3>
                                </div>
                                <div class="preço">
                                    <h3>R$ {{model.preco}}</h3>
                                </div>
                            </div>
                        </div>
                    %end
                %end
                </div>
            </div>
        </div>

        <script src = "../static/js/menu.js?V1.3"></script>
</body>
</html>