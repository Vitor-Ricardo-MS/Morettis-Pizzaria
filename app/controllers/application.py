from app.controllers.datarecord import DataRecord
from app.controllers.BSRecord import BSRecord
from app.controllers.SaborRecord import SaborRecord
from app.controllers.PedRecord import PedRecord
from app.models.bebida import Bebida
from app.models.pizza import Pizza
from app.models.sobremesa import Sobremesa
from app.models.pedido import Pedido
from bottle import template, redirect, request
import json


class Application():

    def __init__(self):

        self.pages = {
            'usuario': self.usuario,
            'tela_inicial' : self.tela_inicial,
            'login' : self.login,
            'signup' : self.signup,
            'menu' : self.menu,
            'admin': self.admin,
            'pedadmin': self.pedadmin
        }

        self.__model= DataRecord()
        self.sabores = SaborRecord()
        self.produtos = BSRecord()
        self.__pedidos = PedRecord()
        self.__current_username= None

# Page Funcs

    def render(self,page,parameter=None):
        content = self.pages.get(page, self.tela_inicial)
        if not parameter:
            return content()
        else:
            return content(parameter)

    def get_session_id(self):
        return request.get_cookie('session_id')
    
    def login(self):
        return template('app/views/html/login')
    
    def signup(self):
        return template('app/views/html/signup')
    
    def tela_inicial(self):
        return template('app/views/html/tela_inicial')
    
    def admin(self):
        session_id = self.get_session_id()
        user = self.__model.getCurrentUser(session_id)
        if user:
            if user.username == "admin":
                return template('app/views/html/admin', current_user=user, Allprodutos = self.produtos.models, Allsabores = self.sabores.sabores)
            return redirect(f'/usuario/{user.username}')
        return redirect('/login')
    
    def pedadmin(self):
        session_id = self.get_session_id()
        user = self.__model.getCurrentUser(session_id)
        if user:
            if user.username == "admin":
                return template('app/views/html/pedadmin', current_user=user)
            return redirect(f'/usuario/{user.username}')
        return redirect('/login')
    
    def menu(self, username=None):
        if username:
            if self.is_authenticated(username):
                session_id = self.get_session_id()
                user = self.__model.getCurrentUser(session_id)
                return template('app/views/html/menu', current_user=user, Allprodutos = self.produtos.models, Allsabores = self.sabores.sabores)
            else:
                return template('app/views/html/menu', current_user=None, Allprodutos = self.produtos.models, Allsabores = self.sabores.sabores)
        return template('app/views/html/menu', current_user=None, Allprodutos = self.produtos.models, Allsabores = self.sabores.sabores)
    
    def usuario(self,username=None):
        if username:
            if self.is_authenticated(username):
                session_id = self.get_session_id()
                user = self.__model.getCurrentUser(session_id)
                return template('app/views/html/usuario', current_user=user)
            else:
                return redirect('/login')
        return redirect('/login')
        
    def is_authenticated(self, username):
        session_id = self.get_session_id()
        current_username = self.__model.getUserName(session_id)
        return username == current_username

    def authenticate_user(self, username, password):
        session_id = self.__model.checkUser(username, password)
        if session_id:
            self.logout_user()
            self.__current_username= self.__model.getUserName(session_id)
            return session_id, username
        return None, None
    
    def signup_user(self, username, password, passwordconf):
        if passwordconf == password:
            if self.__model.usernameFree(username):
                self.__model.book(username, password)
                session_id = self.__model.checkUser(username, password)
                if session_id:
                    self.logout_user()
                    self.__current_username= self.__model.getUserName(session_id)
                    return session_id, username
                return None, None
            
            return None, None
        return None, None
    
    def logout_user(self):
        self.__current_username= None
        session_id = self.get_session_id()
        if session_id:
            self.__model.logout(session_id)

    def getOptions(self, input_value):
        options = []
        if input_value == "Pizza":
            for sab in self.sabores.sabores:
                if sab.tipo == "pizza":
                    options = sab.listaSabor
        else:
            for sab in self.sabores.sabores:
                if sab.nome == input_value:
                    options = sab.listaSabor

        return json.dumps(options)

    def add_Prod(self, tipo, nome, preço, alcoolico=None):
        if alcoolico:
            self.produtos.book(tipo, preço, nome, True)
        else:
            self.produtos.book(tipo, preço, nome, False)

    def edit_Prod(self, tipo, nome, param, value):
        if param == "alcoolico":
            if value == "true":
                temp = True
                self.produtos.update(tipo, nome, param, temp)
            elif value == "false":
                temp = False
                self.produtos.update(tipo, nome, param, temp)
            return False
        elif param == "nome":
            print('nome')
            self.produtos.update(tipo, nome, param, value)
            self.sabores.updateName(tipo, nome, value)
        else:
            self.produtos.update(tipo, nome, param, value)

    def del_Prod(self, tipo, nome):
        self.produtos.delete(tipo, nome)

    def add_Sab(self, tipo, sabor, nome=None):
        self.sabores.add(tipo, sabor, nome)

    def edit_Sab(self, tipo, oldval, value, nome=None):
        self.sabores.update(tipo, oldval, value, nome)

    def del_Sab(self, tipo, sabor, nome=None):
        self.sabores.delete(tipo, sabor, nome)


#Socket Funcs

    def addToCart(self, tipo, nome, tam, prec, sab):
        session_id = self.get_session_id()
        user = self.__model.getCurrentUser(session_id)

        if tipo == "pizza":
            new_prod =  Pizza(prec, tam, sab)
            self.__model.addToCart(user, new_prod)
        else:
            for prod in self.produtos.models:
                if prod.tipo == tipo:
                    if prod.nome == nome:
                        new_prod = prod
                        new_prod.sabor = sab
                        self.__model.addToCart(user, new_prod)

    def delCartItem(self, tipo, nome, sab, tam):
        session_id = self.get_session_id()
        user = self.__model.getCurrentUser(session_id)

        return self.__model.delCartItem(user, tipo, nome, sab, tam)

    def getCartTot(self, username):
        Tot = 0
        cart = self.__model.getUserCart(username)

        for item in cart:
            Tot += float(item["preco"])
        
        Tot = round(Tot, 2)
                        
        return Tot
    
    def getCart(self, username):
        cart = self.__model.getUserCart(username)
        return cart
    
    def getCurrCart(self):
        session_id = self.get_session_id()
        username = self.__model.getUserName(session_id)

        cart = self.__model.getUserCart(username)
        return cart
    
    def SendPedido(self, username):
        cart = self.__model.getUserCart(username)
        pedido = Pedido(username, cart)
        self.__pedidos.book(pedido)
        self.__model.addToPed(pedido)
        self.__model.delCart(username)
        return True
    
    def getPeds(self):
        peds = self.__pedidos.getPeds()
        return peds
    
    def delPed(self, username, id):
        self.__model.delFromPed(username, id)
        self.__pedidos.delPed(username, id)