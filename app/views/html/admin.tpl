<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css?V1.9">
    <title>Admin</title>
</head>
<body>

    <div class="prods">
        <h2>Produtos:</h2>
        <div class="shelf">
            <div class="create">
                <div class="PrCrButtons">
                    <button class="PrCrBtn active" content-id="PrCrBebida">Bebida</button>
                    <button class="PrCrBtn" content-id="PrCrSobremesa">Sobremesa</button>
                </div>

                <div class="PrCrContents">
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
                <div class="PrCrButtons">
                    <button class="PrCrBtn active" content-id="PrCrBebida">Bebida</button>
                    <button class="PrCrBtn" content-id="PrCrSobremesa">Sobremesa</button>
                </div>

                <div class="PrCrContents">
                    <div class="PrCrContent show" id="PrCrBebida">
                        <form action="/addProd" method="post">
                            <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                            <input type="text" id="nomeProd" name="nomeProd" required>
                            <input type="text" id="precoProd" name="precoProd" required>
                            <input type="checkbox" value="alcoolico" id="allcProd" name="allcProd">
                            <button type="submit">Cadastrar</button>
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
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="delete">
                <div class="PrCrButtons">
                    <button class="PrCrBtn active" content-id="PrCrBebida">Bebida</button>
                    <button class="PrCrBtn" content-id="PrCrSobremesa">Sobremesa</button>
                </div>

                <div class="PrCrContents">
                    <div class="PrCrContent show" id="PrCrBebida">
                        <form action="/addProd" method="post">
                            <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                            <input type="text" id="nomeProd" name="nomeProd" required>
                            <input type="text" id="precoProd" name="precoProd" required>
                            <input type="checkbox" value="alcoolico" id="allcProd" name="allcProd">
                            <button type="submit">Cadastrar</button>
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
                                <button type="submit">Cadastrar</button>
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
                <div class="SbButtons">
                    <button class="SbBtn active" content-id="SbPizza">Pizza</button>
                    <button class="SbBtn" content-id="SbBebida">Bebida</button>
                    <button class="SbBtn" content-id="SbSobremesa">Sobremesa</button>
                </div>

                <div class="SbContents">
                    <div class="SbContent show" id="SbPizza">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbBebida">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbSobremesa">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="edit">
                <div class="SbButtons">
                    <button class="SbBtn active" content-id="SbPizza">Pizza</button>
                    <button class="SbBtn" content-id="SbBebida">Bebida</button>
                    <button class="SbBtn" content-id="SbSobremesa">Sobremesa</button>
                </div>

                <div class="SbContents">
                    <div class="SbContent show" id="SbPizza">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbBebida">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbSobremesa">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="delete">
                <div class="SbButtons">
                    <button class="SbBtn active" content-id="SbPizza">Pizza</button>
                    <button class="SbBtn" content-id="SbBebida">Bebida</button>
                    <button class="SbBtn" content-id="SbSobremesa">Sobremesa</button>
                </div>

                <div class="SbContents">
                    <div class="SbContent show" id="SbPizza">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="pizza">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbBebida">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="bebida">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                    <div class="SbContent" id="SbSobremesa">
                        <form action="/addSab" method="post">
                            <div class="inputsleft">
                                <input type="hidden" id="tipoProd" name="tipoProd" value="sobremesa">
                                <div class = "inputs">
                                    <h3>Sabor:</h3>
                                    <input type="text" id="nomeSab" name="nomeSab" required>
                                </div>
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
                            </div>
                            <div class = "inputsbutt">
                                <button type="submit">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src = "../static/js/admin.js?V1.4"></script>
</body>
</html>