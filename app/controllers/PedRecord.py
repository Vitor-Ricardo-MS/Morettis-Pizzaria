
from app.models.pedido import Pedido
import json

class PedRecord():

    def __init__(self):

        self.__Pedidos= []
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/pedidos.json", "r") as arquivo_json:
                ped_data = json.load(arquivo_json)
                self.__user_accounts = [Pedido(**data) for data in ped_data]
        except FileNotFoundError:
            self.__user_accounts.append(Pedido('Guest'))

    def book(self, pedido: Pedido):
        self.__Pedidos.append(pedido)
        self.save()

    def save(self):
        with open("app/controllers/db/pedidos.json", "w") as arquivo_json:
            ped_data = [vars(ped) for ped in self.__Pedidos]
            json.dump(ped_data, arquivo_json)
    
    def delPed(self, ped: Pedido):
        for index, pedido in enumerate(self.__Pedidos, start=0):
            if pedido.username == ped.username:
                if pedido.items == ped.items:
                    self.__Pedidos.pop(index)
                    self.save()
                    return True
        return False
