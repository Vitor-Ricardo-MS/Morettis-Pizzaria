
from app.models.bebida import Bebida
from app.models.sobremesa import Sobremesa
import json

class BSRecord():

    def __init__(self):

        self.models= []
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/bs.json", "r") as arquivo_json:
                model_data = json.load(arquivo_json)
                for data in model_data:
                    if data["tipo"] == "bebida":
                        self.models.append(Bebida(**data))
                    elif data["tipo"] == "sobremesa":
                        self.models.append(Sobremesa(**data))

        except FileNotFoundError:
            self.models.append(Bebida("bebida", 5.00, "Água", False))

    def book(self, tipo, preco, nome, alcoolico=None, sabor = None):
        
        if tipo == "bebida":
            new_model = Bebida(tipo, preco, nome, alcoolico, sabor)
            print(new_model)
        elif tipo == "sobremesa":
            new_model = Sobremesa(tipo, preco, nome, sabor)
        else:
            print(f'wtf')
            return 0

        self.models.append(new_model)
        with open("app/controllers/db/bs.json", "w") as arquivo_json:
            model_data = [vars(model) for model in self.models]
            json.dump(model_data, arquivo_json)
    
    def update(self, tipo, nome, paramname, paramvalue):
        self.mudarParamAuto = {
           "Tipo" : 'tipo',
           "Preco" : 'preco',
           "Sabor" : 'sabor',
           "Imagem" : 'img',
           "Nome" : 'nome',
           "Alcoolico" : 'alcoolico'
        }

        for model in self.models:
            if tipo == model["tipo"]:
                if nome == model["nome"]:
                    param = self.mudarParamAuto.get(paramname, "nada")
                    if(param != "nada"):
                        model.update({param : paramvalue})
                        self.save()
                        return True
                    return False
        return False
    
    def delete(self, tipo, nome):
        for index, model in enumerate(self.models, start=0):
            if tipo == model["tipo"]:
                if nome == model["nome"]:
                    self.models.pop(index)
                    self.save()
                    return True
        return False
        
    def save(self):
        with open("app/controllers/db/bs.json", "w") as arquivo_json:
            model_data = [vars(model) for model in self.models]
            json.dump(model_data, arquivo_json)

    def get_models(self):
        return self.models