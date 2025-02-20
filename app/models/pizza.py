from app.models.produto import Produto

class Pizza(Produto):
    def __init__(self, preco, tamanho, sabor = None, img = None):
        super().__init__(tipo="pizza", img=img, preco=preco, sabor=sabor)
        self.tamanho = tamanho