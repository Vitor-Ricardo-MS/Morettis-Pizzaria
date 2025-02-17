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

    def updateName(self, tipo, nome, newnome):
        for model in self.sabores:
            if model.tipo == tipo:
                if model.nome == nome:
                    model.nome = newnome
                    self.save()
        return False
                
    def add(self, tipo, paramvalue, nome = None):
        indexo = self.modelExists(tipo, nome)
        
        if indexo != False:
            for index, model in enumerate(self.sabores, start=0):
                if (indexo-1) == index:
                    if not self.saborExists(model.listaSabor, paramvalue):
                        model.listaSabor.append(paramvalue)
                        self.save()
                        return True
                    return False
        else:
            self.book(tipo, nome, paramvalue)
            return True
        
    def update(self, tipo, oldval, val, nome):
        for model in self.sabores:
            if model.tipo == tipo:
                if nome:
                    if model.nome == nome:
                        for index, taste in enumerate(model.listaSabor, start=0):
                            if taste == oldval:
                                model.listaSabor[index] = val
                                self.save()
                                return True
                elif tipo == "pizza":
                    for index, taste in enumerate(model.listaSabor, start=0):
                            if taste == oldval:
                                model.listaSabor[index] = val
                                self.save()
                                return True
        return False
    
    def delete(self, tipo, sabor, nome = None):
        for  model in self.sabores:
            if model.tipo == tipo:
                if nome:
                    if model.nome == nome:
                        print(model.nome)
                        for index, taste in enumerate(model.listaSabor, start=0):
                            if taste == sabor:
                                print(taste)
                                model.listaSabor.pop(index)
                                self.save()
                                return True
                elif tipo == "pizza":
                    for index, taste in enumerate(model.listaSabor, start=0):
                            if taste == sabor:
                                print(taste)
                                model.listaSabor.pop(index)
                                self.save()
                                return True           
        return False
        
    def save(self):
        with open("app/controllers/db/sabores.json", "w") as arquivo_json:
            sabor_data = [vars(sabor) for sabor in self.sabores]
            json.dump(sabor_data, arquivo_json)

    def modelExists(self, tipo, nome=None):
        for index, model in enumerate(self.sabores, start=1):
            if model.tipo == tipo:
                if nome:
                    if model.nome == nome:
                        return index
                elif tipo == "pizza":
                    return index
        return False

    def saborExists(self, listaSabor, sabor):
        for taste in listaSabor:
            if taste == sabor:
                return True
        return False
    
    def get_models(self):
        return self.sabores