from app.controllers.datarecord import DataRecord
from app.controllers.BSRecord import BSRecord
from app.controllers.SaborRecord import SaborRecord
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
            'admin': self.admin
        }

        self.__model= DataRecord()
        self.sabores = SaborRecord()
        self.produtos = BSRecord()
        self.__current_username= None

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
        print(f' < {tipo}, {nome}, {sabor} >')
        self.sabores.delete(tipo, sabor, nome)