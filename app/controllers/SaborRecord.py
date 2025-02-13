from app.models.sabores import Sabores
import json

class SaborRecord():

    def __init__(self):

        self.sabores=[]
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/sabores.json", "r") as arquivo_json:
                sabores_data = json.load(arquivo_json)
                self.sabores = [Sabores(**data) for data in sabores_data]
        except FileNotFoundError:
            self.sabores.append(Sabores(tipo="pizza", listaSabor=["Calabresa"]))

    def book(self, tipo, nome = None, firstparam = None):
        new_model = Sabores(tipo=tipo, nome=nome, listaSabor=[])

        if firstparam:
            new_model.listaSabor.append(firstparam)
        
        self.sabores.append(new_model)
        with open("app/controllers/db/sabores.json", "w") as arquivo_json:
            sabor_data = [vars(sabor) for sabor in self.sabores]
            json.dump(sabor_data, arquivo_json)
    
    def update(self, tipo, paramvalue, nome = None):
        indexo = self.modelExists(tipo, nome)

        print(indexo)
        
        if indexo != False:
            for index, model in enumerate(self.sabores, start=0):
                print(f'{index} -')
                if indexo == index:
                    for taste in model.listaSabor:
                        print(taste)
                    if not self.saborExists(model.listaSabor, paramvalue):
                        model.listaSabor.append(paramvalue)
                        self.save()
                        return True
                    return False
        else:
            self.book(tipo, nome, paramvalue)
            return True
    
    def delete(self, tipo, nome):
        for  model in self.sabores:
            if tipo == model["tipo"]:
                if nome == model["nome"]:
                    for index, sabor in enumerate(model.listaSabor, start=0):
                        model.listaSabor.pop(index)
                        self.save()
                        return True
                    return False
        return False
        
    def save(self):
        with open("app/controllers/db/sabores.json", "w") as arquivo_json:
            sabor_data = [vars(sabor) for sabor in self.sabores]
            json.dump(sabor_data, arquivo_json)

    def modelExists(self, tipo, nome=None):
        for index, model in enumerate(self.sabores, start=0):
            if model.tipo == tipo:
                if nome:
                    if model.nome == nome:
                        return index
                return index
        return False

    def saborExists(self, listaSabor, sabor):
        for taste in listaSabor:
            if taste == sabor:
                return True
        return False
    
    def get_models(self):
        return self.sabores