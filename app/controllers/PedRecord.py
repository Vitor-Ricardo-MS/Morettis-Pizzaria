
from app.models.pedido import Pedido
from numpy import random
import json

class PedRecord():

    def __init__(self):

        self.__Pedidos= []
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/pedidos.json", "r") as arquivo_json:
                ped_data = json.load(arquivo_json)
                self.__Pedidos = [Pedido(**data) for data in ped_data]
        except FileNotFoundError:
            self.__Pedidos.append(Pedido('Guest'))

    def book(self, pedido: Pedido):
        new_id = self.getNewId()
        pedido.id = new_id
        self.__Pedidos.append(pedido)
        self.save()

    def getNewId(self):
        new_id = random.randint(0, 1000000000)

        for ped in self.__Pedidos:
            if ped.id == new_id:
                return self.getNewId()
        
        return new_id
    
    def save(self):
        with open("app/controllers/db/pedidos.json", "w") as arquivo_json:
            ped_data = [vars(ped) for ped in self.__Pedidos]
            json.dump(ped_data, arquivo_json)
    
    def getPeds(self):
        ped_data = [vars(ped) for ped in self.__Pedidos]
        return ped_data
    
    def delPed(self, ped: Pedido):
        for index, pedido in enumerate(self.__Pedidos, start=0):
            if pedido.username == ped.username:
                if pedido.id == ped.id:
                    self.__Pedidos.pop(index)
                    self.save()
                    return True
        return False
    
    def delPed(self, usu: str, id: int):
        for index, pedido in enumerate(self.__Pedidos, start=0):
            if pedido.username == usu:
                if pedido.id == id:
                    self.__Pedidos.pop(index)
                    self.save()
                    return True
        return False
