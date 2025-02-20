class UserAccount():
    def __init__(self, username, password, cart=[], pedidos = []):
        self.username = username
        self.password = password
        self.cart = cart
        self.pedidos = pedidos