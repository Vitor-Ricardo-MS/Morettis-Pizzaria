<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css?V2.5">
    <title>Admin</title>
</head>
<body>

    <div class="BarraTopo">
        <div class="BarraTopoText">
            <h2>Menu de Administração de Produtos</h2>
        </div>
        <a href="/pedadmin"><button>Pedidos</button></a>
        <a href="/menu/{{current_user.username}}"><button>Menu</button></a>
        <a href="/usuario/{{current_user.username}}"><button>Usuário</button></a>
    </div>

    <div class="prods">
        <h2>Produtos:</h2>
        <div class="shelf">
            <div class="create">
                <div class="TabButtons">
                    <button class="PrCrBtn active" content-id="PrCrBebida">Bebida</button>
                    <button class="PrCrBtn" content-id="PrCrSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="PrCrContent show" id="PrCrBebida">
                        <form action="/addProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <input type="text" id="nomeProd" name="nomeProd" required>
                                </div>
                                <div class = "inputs">
                                    <h3>Preço:</h3>
                                    <input type="text" id="precoProd" name="precoProd" required>
                                </div>
                                <div class = "inputs">
                                    <h3>Alcool?</h3>
                                    <input type="checkbox" value="alcoolico" id="allcProd" name="allcProd">
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Criar</button>
                            </div>
                        </form>
                    </div>
                    <div class="PrCrContent" id="PrCrSobremesa">
                        <form action="/addProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <input type="text" id="nomeProd" name="nomeProd" required>
                                </div>
                                <div class = "inputs">
                                    <h3>Preço:</h3>
                                    <input type="text" id="precoProd" name="precoProd" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Criar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="edit">
                <div class="TabButtons">
                    <button class="PrEdBtn active" content-id="PrEdBebida">Bebida</button>
                    <button class="PrEdBtn" content-id="PrEdSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="PrEdContent show" id="PrEdBebida">
                       <form action="/editProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "bebida":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Parâmetro:</h3>
                                    <select id="paramProd" name="paramProd">
                                        <option value="nome">Nome</option>
                                        <option value="preco">Preço</option>
                                        <option value="alcoolico">Alcoolico</option>
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Novo_Valor:</h3>
                                    <input type="text" id="valueProd" name="valueProd" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Editar</button>
                            </div>
                        </form>
                    </div>
                    <div class="PrEdContent" id="PrEdSobremesa">
                        <form action="/editProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "sobremesa":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Parâmetro:</h3>
                                    <select id="paramProd" name="paramProd">
                                        <option value="nome">Nome</option>
                                        <option value="preco">Preço</option>
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Novo_Valor:</h3>
                                    <input type="text" id="valueProd" name="valueProd" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Editar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="delete">
                <div class="TabButtons">
                    <button class="PrDeBtn active" content-id="PrDeBebida">Bebida</button>
                    <button class="PrDeBtn" content-id="PrDeSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="PrDeContent show" id="PrDeBebida">
                        <form action="/dellProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "bebida":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Confirmar:</h3>
                                    <input type="checkbox" value="conf" id="confDeProd" name="confDeProd">
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Deletar</button>
                            </div>
                        </form>
                    </div>
                    <div class="PrDeContent" id="PrDeSobremesa">
                        <form action="/dellProd" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "sobremesa":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Confirmar:</h3>
                                    <input type="checkbox" value="conf" id="confDeProd" name="confDeProd">
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Deletar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>






    <div class="saborss">
        <h2>Sabores:</h2>
        <div class="shelf">
            <div class="create">
                <div class="TabButtons">
                    <button class="SbCrBtn active" content-id="SbCrPizza">Pizza</button>
                    <button class="SbCrBtn" content-id="SbCrBebida">Bebida</button>
                    <button class="SbCrBtn" content-id="SbCrSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="SbCrContent show" id="SbCrPizza">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Adicionar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbCrContent" id="SbCrBebida">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "bebida":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Adicionar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbCrContent" id="SbCrSobremesa">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "sobremesa":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Adicionar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="edit">
                <div class="TabButtons">
                    <button class="SbEdBtn active" content-id="SbEdPizza">Pizza</button>
                    <button class="SbEdBtn" content-id="SbEdBebida">Bebida</button>
                    <button class="SbEdBtn" content-id="SbEdSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="SbEdContent show" id="SbEdPizza">
                        <form action="/editSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Parâmetro:</h3>
                                    <select id="nomeParam" name="nomeParam">
                                    %for model in Allsabores:
                                        %if model.tipo == "pizza":
                                            %for sabor in model.listaSabor:
                                                <option value={{sabor}}>{{sabor}}</option>
                                            %end
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Novo_Valor:</h3>
                                    <input type="text" id="valueSab" name="valueSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Editar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbEdContent" id="SbEdBebida">
                        <form action="/editSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select class="SbEdProd" id="nomeProd" name="nomeProd">
                                    %for model in Allsabores:
                                        %if model.tipo == "bebida":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Parâmetro:</h3>
                                    <input type="text" id="nomeParam" name="nomeParam" required>
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Novo_Valor:</h3>
                                    <input type="text" id="valueSab" name="valueSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Editar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbEdContent" id="SbEdSobremesa">
                        <form action="/editSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select class="SbEdProd" id="nomeProd" name="nomeProd">
                                    %for model in Allsabores:
                                        %if model.tipo == "sobremesa":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Parâmetro:</h3>
                                    <input type="text" id="nomeParam" name="nomeParam" required>
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Novo_Valor:</h3>
                                    <input type="text" id="valueSab" name="valueSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Editar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="delete">
                <div class="TabButtons">
                    <button class="SbDeBtn active" content-id="SbDePizza">Pizza</button>
                    <button class="SbDeBtn" content-id="SbDeBebida">Bebida</button>
                    <button class="SbDeBtn" content-id="SbDeSobremesa">Sobremesa</button>
                </div>

                <div class="TabContents">
                    <div class="SbDeContent show" id="SbDePizza">
                        <form action="/dellSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Deletar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbDeContent" id="SbDeBebida">
                        <form action="/dellSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allprodutos:
                                        %if model.tipo == "bebida":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Deletar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbDeContent" id="SbDeSobremesa">
                        <form action="/dellSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Produto:</h3>
                                    <select id="nomeProd" name="nomeProd">
                                    %for model in Allsabores:
                                        %if model.tipo == "sobremesa":
                                                <option value={{model.nome}}>{{model.nome}}</option>
                                        %end
                                    %end
                                    </select>
                                </div>
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Deletar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src = "../static/js/admin.js?V1.5"></script>
</body>
</html>