<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css?V45">
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
                            <div class="caixaNome">
                                <div class="nomeitem">
                                    <h2>Pizza</h2>
                                </div>
                                <h2>_</h2>
                                <div class="tamanho">
                                    <h2>Grande</h2>
                                </div>
                            </div>
                            <div class="info">
                                <h3>A maior</h3>
                            </div>
                            <div class="caixaPreço">
                                <h3>R$</h3>
                                <div class="preço">
                                    <h3>29.99</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                        <div class="itemInfo">
                            <div class="caixaNome">
                                <div class="nomeitem">
                                    <h2>Pizza</h2>
                                </div>
                                <h2>_</h2>
                                <div class="tamanho">
                                    <h2>Média</h2>
                                </div>
                            </div>
                            <div class="info">
                                <h3>A média</h3>
                            </div>
                            <div class="caixaPreço">
                                <h3>R$</h3>
                                <div class="preço">
                                    <h3>24.99</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                        <div class="itemInfo">
                            <div class="caixaNome">
                                <div class="nomeitem">
                                    <h2>Pizza</h2>
                                </div>
                                <h2>_</h2>
                                <div class="tamanho">
                                    <h2>Pequena</h2>
                                </div>
                            </div>
                            <div class="info">
                                <h3>A menor</h3>
                            </div>
                            <div class="caixaPreço">
                                <h3>R$</h3>
                                <div class="preço">
                                    <h3>19.99</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content" id="bebidas">
                %for model in Allprodutos:
                    %if model.tipo == "bebida":
                        %if model.alcoolico == False:
                            <div class="item">
                                <div class="itemImg"><img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/></div>
                                <div class="itemInfo">
                                    <div class="caixaNome">
                                        <div class="nomeitem">
                                            <h2>{{model.nome}}</h2>
                                        </div>
                                    </div>
                                    <div class="info">
                                        <h3>Info: alcoolico? {{model.alcoolico}}</h3>
                                    </div>
                                    <div class="caixaPreço">
                                        <h3>R$</h3>
                                        <div class="preço">
                                            <h3>{{model.preco}}</h3>
                                        </div>
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
                                    <div class="caixaNome">
                                        <div class="nomeitem">
                                            <h2>{{model.nome}}</h2>
                                        </div>
                                    </div>
                                    <div class="info">
                                        <h3>Info: alcoolico? {{model.alcoolico}}</h3>
                                    </div>
                                    <div class="caixaPreço">
                                        <h3>R$</h3>
                                        <div class="preço">
                                            <h3>{{model.preco}}</h3>
                                        </div>
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
                                <div class="caixaNome">
                                    <div class="nomeitem">
                                        <h2>{{model.nome}}</h2>
                                    </div>
                                </div>
                                <div class="info">
                                    <h3>Info: {{model.sabor}}</h3>
                                </div>
                                <div class="caixaPreço">
                                    <h3>R$</h3>
                                    <div class="preço">
                                        <h3>{{model.preco}}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    %end
                %end
                </div>
            </div>
        </div>
        
        <div id="popup" class="popup">
            <div class="popupImg">
                <img class='img' src={{'../static/img/Piizzaa.png?V1.1'}}/>
            </div>
            <div class="popupContent">
                <div class="popupHead">
                    <button id="exitPopup" onclick="closePopup()">X</button>
                </div>
                <div class="popupText">
                    <input type="hidden" id="tipoProd" name="tipoProd" value="">
                    <div class="inputs nome" id="Nome">
                        <h2>Produto:</h2>
                        <input class="nomeProd" type="text" id="nomeProd" name="nomeProd" value="" required disabled>
                    </div>
                    <div class="inputs tam" id="Tam">
                        <h2>Tamanho:</h2>
                        <input class="tamProd" type="text" id="tamProd" name="tamProd" value="" required disabled>
                    </div>
                    <div class="inputs prec" id="prec">
                        <h2>Preço:</h2>
                        <input class="precProd" type="text" id="precProd" name="precProd" value="" required disabled>
                    </div>
                    <div class="inputs prec" id="prec">
                        <h2>Sabor:</h2>
                        <select name="sabores" id="sabores">
                            %for model in Allsabores:
                                %if model.tipo == :
                                    %for sabor in model.listaSabor:
                                        <option value={{sabor}}>{{sabor}}</option>
                                    %end
                                %end
                            %end
                        </select>
                    </div>

                    
                </div>
            </div>
        </div>

        <script>
            const Item = document.querySelectorAll(".item");

            Item.forEach(item => item.addEventListener('click', () => ItemClicked(item)));

            const ItemClicked = (item) => {
                const Popup = document.querySelector(".popup");
                    
                const nomepop = Popup.querySelector(".nomeProd");
                const tampop = Popup.querySelector(".tamProd");
                const precpop = Popup.querySelector(".precProd");

                const itemNome = item.querySelector(".nomeitem").innerText;
                const itemTamBox = item.querySelector(".tamanho");
                const itemPrec = item.querySelector(".preço").innerText;
                
                nomepop.setAttribute("value", itemNome)
                precpop.setAttribute("value", itemPrec)
                
                if(itemTamBox != null){
                    const itemTam = itemTamBox.innerText;

                    tampop.setAttribute("value", itemTam)
                    const lol = Popup.querySelector(".inputs.tam")
                    lol.setAttribute("style", "Display: flex;")
                }else{

                    tampop.setAttribute("value", "")
                    const lol = Popup.querySelector(".inputs.tam")
                    lol.setAttribute("style", "Display: none;")
                }
            }

            function closePopup(){
                Popup.classList.remove('open-popup')
            }
        </script>



        <script src = "../static/js/menu.js?V1.6"></script>
</body>
</html>