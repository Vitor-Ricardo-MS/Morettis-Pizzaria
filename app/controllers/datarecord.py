
from app.models.user_account import UserAccount
import json
import uuid

class DataRecord():

    def __init__(self):

        self.__user_accounts= []
        self.__authenticated_users = {}
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/user_accounts.json", "r") as arquivo_json:
                user_data = json.load(arquivo_json)
                self.__user_accounts = [UserAccount(**data) for data in user_data]
        except FileNotFoundError:
            self.__user_accounts.append(UserAccount('Guest', '12345'))

    def book(self,username,password):
        new_user = UserAccount(username,password)
        self.__user_accounts.append(new_user)
        self.save()

    def save(self):
        with open("app/controllers/db/user_accounts.json", "w") as arquivo_json:
            model_data = [vars(model) for model in self.__user_accounts]
            json.dump(model_data, arquivo_json)

    def usernameFree(self, username):
        for user in self.__user_accounts:
            if user.username == username:
                return False
        return True

    def getCurrentUser(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id]
        else:
            return None

    def getUserName(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id].username
        else:
            return None

    def getUserSessionId(self, username):
        for session_id in self.__authenticated_users:
            if username == self.__authenticated_users[session_id].username:
                return session_id
        return None

    def checkUser(self, username, password):
        for user in self.__user_accounts:
            if user.username == username and user.password == password:
                session_id = str(uuid.uuid4())
                self.__authenticated_users[session_id] = user
                return session_id
        return None

    def logout(self, session_id):
        if session_id in self.__authenticated_users:
            del self.__authenticated_users[session_id]

    def addToCart(self, usuario, produto):
        prod_data = vars(produto)
        for model in self.__user_accounts:
            if model.username == usuario.username:
                model.cart.append(prod_data)
                self.save()
                return True
        return False
    
    def delCartItem(self, usuario, tipo, nome, sab, tam):
        if tipo == "pizza":
            for model in self.__user_accounts:
                if model.username == usuario.username:
                    for index, item in enumerate(model.cart, start=0):
                        if item["tipo"] == tipo:
                            if item["tamanho"] == tam:
                                if item["sabor"] == sab:
                                    model.cart.pop(index)
                                    self.save()
                                    return True
            return False
        else:
            for model in self.__user_accounts:
                if model.username == usuario.username:
                    for index, item in enumerate(model.cart, start=0):
                        if item["tipo"] == tipo:
                            if item["nome"] == nome:
                                if item["sabor"] == sab:
                                    model.cart.pop(index)
                                    self.save()
                                    return True
            return False
    
    def getUserCart(self, username):
        for user in self.__user_accounts:
            if user.username == username:
                return user.cart
        return False
    
    def delCart(self, username):
        for user in self.__user_accounts:
            if user.username == username:
                user.cart = []
                self.save()
                return True
        return False
    
    def addToPed(self, pedido):
        ped_data = vars(pedido)
        for user in self.__user_accounts:
            if user.username == pedido.username:
                user.pedidos.append(ped_data)
                self.save()
                return True
        return False
