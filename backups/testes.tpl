<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css?V1.0.1">
    <title>Menu</title>
</head>
<body>

    <select name="cars" id="cars">
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
    </select> 

    for model in self.sabores:
            if tipo == model["tipo"]:
                if nome:
                    if nome == model["nome"]:
                        if not self.saborExists(model.listaSabor, paramvalue):
                            model.listaSabor.append(paramvalue)
                            return 
                        return False
                    return False
                else:
                    if not self.saborExists(model.listaSabor, paramvalue):
                        model.listaSabor.append(paramvalue)
                        return True
                    return False
            return False

</body>
</html>