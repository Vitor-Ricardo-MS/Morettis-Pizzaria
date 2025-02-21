from numpy import random

class Pedido():
    def __init__(self, username, items=[], id=None):
        self.username = username
        self.items = items
        self.id = id