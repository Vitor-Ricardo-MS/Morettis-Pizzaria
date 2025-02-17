
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
        elif tipo == "sobremesa":
            new_model = Sobremesa(tipo, preco, nome, sabor)
        else:
            return 0

        self.models.append(new_model)
        with open("app/controllers/db/bs.json", "w") as arquivo_json:
            model_data = [vars(model) for model in self.models]
            json.dump(model_data, arquivo_json)
    
    def update(self, tipo, nome, paramname, paramvalue):
        with open("app/controllers/db/bs.json", "w") as arquivo_json:
            model_data = [vars(model) for model in self.models]
            for model in model_data:
                if model["tipo"] == tipo:
                    if model["nome"] == nome:
                        model[paramname] = paramvalue
            json.dump(model_data, arquivo_json)
    
    def delete(self, tipo, nome):
        for index, model in enumerate(self.models, start=0):
            if model.tipo == tipo:
                if model.nome == nome:
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