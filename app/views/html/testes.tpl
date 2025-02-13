<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css?V1.0.1">
    <title>Menu</title>
</head>
<body>
    <h1>People List</h1>
    
    {% for caa in Allsabores %}
        <div class="person-div">
            <h2>{{ caa.nome }}</h2>
            <p>Age: {{ caa.tipo }}</p>
            <p>City: {{ caa.listaSabor }}</p>
        </div>
    {% endfor %}


    <div class="item">
                            <div class="itemImg">
                                <img class='img' src={{model.img}} alt="Caralho"/>
                            </div>
                        </div>

</body>
</html>
</html>