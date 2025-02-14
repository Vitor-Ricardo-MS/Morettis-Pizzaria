from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response


app = Bottle()
ctl = Application()


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
@app.route('/admin/<username>', method='GET')
def admin(username=None):
    return ctl.render('admin', username)

@app.route('/signup', method='GET')
def signup():
    return ctl.render('signup')

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
    print(f' > {tipo}, {nome}, {conf} <')
    if conf:
        print('conf confirmed')
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
    print(f' > {tipo}, {nome}, {sabor} <')
    ctl.del_Sab(tipo, sabor, nome)
    redirect(f'/admin')

#-----------------------------------------------------------------------------

if __name__ == '__main__':

    run(app, host='0.0.0.0', port=8080, debug=True)
