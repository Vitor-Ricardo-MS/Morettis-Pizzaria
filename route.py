from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file, redirect, template, response
import socketio
import eventlet


app = Bottle()
ctl = Application()

sio = socketio.Server(async_mode='eventlet')

wsgi_app = socketio.WSGIApp(sio, app)


#-----------------------------------------------------------------------------
# Rotas:

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

#-----------------------------------------------------------------------------
# GET:

@app.route('/', methods='GET')
@app.route('/tela_inicial', methods='GET')
def action_tela_inicial():
    return ctl.render('tela_inicial')

@app.route('/usuario', methods='GET')
@app.route('/usuario/<username>', methods='GET')
def action_usuario(username=None):
    if not username:
        redirect('/login')
    else:
        return ctl.render('usuario', username)
    
@app.route('/menu', method='GET')
@app.route('/menu/<username>', methods='GET')
def menu(username=None):
    return ctl.render('menu', username)

@app.route('/login', method='GET')
def login():
    return ctl.render('login')

@app.route('/admin', method='GET')
def admin():
    return ctl.render('admin')

@app.route('/pedadmin', method='GET')
def pedadmin():
    return ctl.render('pedadmin')

@app.route('/signup', method='GET')
def signup():
    return ctl.render('signup')

# get value

@app.route('/get-options', method='GET')
def get_options():
    input_value = request.query.input_value
    response.content_type = 'application/json'
    return ctl.getOptions(input_value)

#-----------------------------------------------------------------------------
# POST:

@app.route('/signup', method='POST')
def action_signup():
    username = request.forms.get('username')
    password = request.forms.get('password')
    passwordconf = request.forms.get('passwordconf')
    session_id, username = ctl.signup_user(username, password, passwordconf)
    if session_id:
        response.set_cookie('session_id', session_id, httponly=True, \
        secure=True, max_age=3600)
        redirect(f'/usuario/{username}')
    else:
        return redirect('/signup')

@app.route('/login', method='POST')
def action_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    session_id, username = ctl.authenticate_user(username, password)
    if session_id:
        response.set_cookie('session_id', session_id, httponly=True, \
        secure=True, max_age=3600)
        redirect(f'/usuario/{username}')
    else:
        return redirect('/login')
    
@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/')

# Admin

@app.route('/addProd', method='POST')
def addProd():
    tipo = request.forms.get('tipoProd')
    nome = request.forms.get('nomeProd')
    preço = float(request.forms.get('precoProd'))
    alcoolico = request.forms.get('allcProd')
    ctl.add_Prod(tipo, nome, preço, alcoolico)
    redirect(f'/admin')

@app.route('/editProd', method='POST')
def editProd():
    tipo = request.forms.get('tipoProd')
    nome = request.forms.get('nomeProd')
    param = request.forms.get('paramProd')
    if param == "preco":
        value = float(request.forms.get('valueProd'))
    else:
        value = request.forms.get('valueProd')
    ctl.edit_Prod(tipo, nome, param, value)
    redirect(f'/admin')

@app.route('/dellProd', method='POST')
def delProd():
    tipo = request.forms.get('tipoProd')
    nome = request.forms.get('nomeProd')
    conf = request.forms.get('confDeProd')
    if conf:
        ctl.del_Prod(tipo, nome)
        redirect(f'/admin')
    redirect(f'/admin')

@app.route('/addSab', method='POST')
def addSab():
    tipo = request.forms.get('tipoProd')
    sabor = request.forms.get('nomeSab')
    nome = request.forms.get('nomeProd')
    ctl.add_Sab(tipo, sabor, nome)
    redirect(f'/admin')

@app.route('/editSab', method='POST')
def editSab():
    tipo = request.forms.get('tipoProd')
    nome = request.forms.get('nomeProd')
    oldval = request.forms.get('nomeParam')
    value = request.forms.get('valueSab')
    ctl.edit_Sab(tipo, oldval, value, nome)
    redirect(f'/admin')

@app.route('/dellSab', method='POST')
def delSab():
    tipo = request.forms.get('tipoProd')
    nome = request.forms.get('nomeProd')
    sabor = request.forms.get('nomeSab')
    ctl.del_Sab(tipo, sabor, nome)
    redirect(f'/admin')

#-----------------------------------------------------------------------------
# Socket

@sio.event
async def connect(sid, environ):
    print(sid, 'connected')

@sio.event
async def disconnect(sid):
    print(sid, 'disconnected')

@sio.event
def AddToCart(sid, tipoProd, nomeProd, tamProd, precProd, sabProd):
    prec = float(precProd)
    ctl.addToCart(tipoProd, nomeProd, tamProd, prec, sabProd)
    Cart = ctl.getCurrCart()
    sio.emit("UpdUserCart", Cart)
    sio.emit("AddToCart")

@sio.event
def DelCartItem(sid, tipoItem, currNome, currSab, currTam):
    ctl.delCartItem(tipoItem, currNome, currSab, currTam)
    sio.emit("DelCartItem")

@sio.event
def UpdUserCart(sid, username):
    Cart = ctl.getCart(username)
    sio.emit("UpdUserCart", Cart)

@sio.event
def UpdPrecTotCart(sid, username):
    Tot = ctl.getCartTot(username)
    sio.emit("UpdPrecTotCart", Tot)

@sio.event
def SendPedido(sid, username):
    ctl.SendPedido(username)
    Peds = ctl.getPeds()
    sio.emit("UpdPeds", Peds)
    sio.emit("SendPedido")

@sio.event
def UpdPeds(sid):
    Peds = ctl.getPeds()
    sio.emit("UpdPeds", Peds)

@sio.event
def DelPed(sid, usu, id):
    ctl.delPed(usu, id)
    Peds = ctl.getPeds()
    sio.emit('UpdPeds', Peds)
    sio.emit('DelPed')

#-----------------------------------------------------------------------------

if __name__ == '__main__':

    eventlet.wsgi.server(eventlet.listen(('0.0.0.0', 8080)), wsgi_app)