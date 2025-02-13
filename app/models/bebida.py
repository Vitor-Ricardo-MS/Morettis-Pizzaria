from app.models.produto import Produto

class Bebida(Produto):
    def __init__(self, tipo, preco, nome, alcoolico, sabor=None, img = None):
        super().__init__(tipo=tipo, img=img, preco=preco, sabor=sabor)
        self.nome = nome
        self.alcoolico = alcoolico