const socket = io('http://localhost:8080')

const DelPop = document.querySelector(".DelPopup");
const EnvPop = document.querySelector(".EnvPopup");
let currentItem;
const username = document.querySelector(".username").value;
const envbutt = document.querySelector(".EnvPedBtn");
envbutt.addEventListener('click', () => openEnvPop());

//

socket.on('connect', () => {
    console.log('Connected');
    getUpdCart();
    getUpdPeds();
})

socket.on('UpdUserCart', (data) => {
    UpdateCart(data)
    console.log('Cart Updated')
})

socket.on('UpdPrecTotCart', (data) => {
    UpdateCartPrc(data);
    console.log('Price Updated');
})

socket.on('SendPedido', () => {
    console.log('Cart Sent')
})

socket.on('DelCartItem', () => {
    console.log('Item Deleted')
})

socket.on('UpdPeds', (data) => {
    UpdatePeds(data)
    console.log('Pedidos Updated')
})

//

function getUpdCart() {
    socket.emit("UpdUserCart", username)
    socket.emit("UpdPrecTotCart", username)
}

function getUpdPeds(){
    socket.emit('UpdPeds')
}

function deleteItem() {
    tipoItem = currentItem.querySelector(".Tipo").value
    nomeItem = currentItem.querySelector(".NomeBox").innerText
    if(nomeItem == "Produto: Pizza"){
        tamItem = currentItem.querySelector(".TamBox").innerText
        arrTam = tamItem.split(" ")
        currTam = arrTam[1]
    }else{
        currTam = null
    }
    sabItem = currentItem.querySelector(".SaborBox").innerText

    arrNome = nomeItem.split(" ")
    currNome = arrNome[1]

    arrSab = sabItem.split(" ")
    currSab = arrSab[1]

    socket.emit('DelCartItem', tipoItem, currNome, currSab, currTam)
    closeDelPop();
    getUpdCart();
}

function sendPedido() {
    socket.emit("SendPedido", username)
    closeEnvPop();
    getUpdCart();
    getUpdPeds();
}

//

function UpdateCartPrc( data ) {
    const DisplayPrec = document.querySelector(".PrecTot")

    DisplayPrec.innerHTML = `Preço Total: R$ ${data}`
}

function UpdateCart( data ) {
    const DisplayCart = document.querySelector(".CartContents")
    if (DisplayCart) {
        DisplayCart.innerHTML = '';
        data.forEach(item => {

            const itemBox = document.createElement('div');
            itemBox.setAttribute('class', 'item');

            const InfoBox = document.createElement('div');
            InfoBox.setAttribute('class', 'InfoBox')

            const NomeBox = document.createElement('div');
            NomeBox.setAttribute('class', 'NomeBox');
            const Nome = document.createElement('h3');

            const Tipo = document.createElement('input');
            Tipo.setAttribute('class', 'Tipo')
            Tipo.setAttribute('type', 'hidden');

            const TamBox = document.createElement('div');
            TamBox.setAttribute('class', 'TamBox')
            const Tam = document.createElement('h3');

            const SaborBox = document.createElement('div');
            SaborBox.setAttribute('class', 'SaborBox')
            const Sab = document.createElement('h3');

            const PreçoBox = document.createElement('div');
            PreçoBox.setAttribute('class', 'PreçoBox')
            const Preço = document.createElement('h3');

            Tipo.value = item["tipo"];
            InfoBox.appendChild(Tipo);
            
            if(item["tipo"] == "pizza"){
                Nome.innerText = "Produto: Pizza"
                NomeBox.appendChild(Nome)
                InfoBox.appendChild(NomeBox)
                
                Tam.innerText = `Tamanho: ${item["tamanho"]}`
                TamBox.appendChild(Tam)
                InfoBox.appendChild(TamBox)
            }else{
                Nome.innerText = `Produto: ${item["nome"]}`
                NomeBox.appendChild(Nome)
                InfoBox.appendChild(NomeBox)
            }
            
            Sab.innerText = `Sabor: ${item["sabor"]}`
            SaborBox.appendChild(Sab)
            InfoBox.appendChild(SaborBox)
            
            Preço.innerText = `Preço: R$ ${item["preco"]}`
            PreçoBox.appendChild(Preço)
            InfoBox.appendChild(PreçoBox)
            
            itemBox.appendChild(InfoBox)

            DisplayCart.appendChild(itemBox);
        });

        const items = document.querySelectorAll(".item")
        items.forEach(item => item.addEventListener('click', () => openDelPop(item)))
    } else {
        console.error('Elemento cart não encontrado');
    }
}

function UpdatePeds( data ) {
    const DisplayPeds = document.querySelector(".PedsContents")
    if (DisplayPeds) {
        DisplayPeds.innerHTML = '';
        data.forEach(item => {
            if(item["username"] == username){
                var Totval = 0;
    
                const Pedido = document.createElement('div');
                Pedido.setAttribute('class', 'Ped');
    
                const PedNome = document.createElement('div');
                PedNome.setAttribute('class', 'PedInfo')
    
                const NomePed = document.createElement('h3');
                NomePed.innerText = `${item["username"]} - ${item["id"]}`
    
                PedNome.appendChild(NomePed)
                Pedido.appendChild(PedNome)
    
                const PedList = document.createElement('div');
                PedList.setAttribute('class', 'PedList');
    
                const Items = document.createElement('table');
                Items.setAttribute('class', 'Items');
    
                const Header = document.createElement('tr');
                Header.setAttribute('class', 'Header');
    
                const NomeBox = document.createElement('th');
                NomeBox.innerText = "Nome";
    
                const TamBox = document.createElement('th');
                TamBox.innerText = "Tamanho";
    
                const SaborBox = document.createElement('th');
                SaborBox.innerText = "Sabor";
    
                const PreçoBox = document.createElement('th');
                PreçoBox.innerText = "Preço";
    
                Header.appendChild(NomeBox)
                Header.appendChild(TamBox)
                Header.appendChild(SaborBox)
                Header.appendChild(PreçoBox)
                Items.appendChild(Header)
    
                item["items"].forEach(value =>{
    
                    const CurrRow = document.createElement('tr');
                    CurrRow.setAttribute('class', 'Item')
    
                    const nome = document.createElement('td');
                    const tam = document.createElement('td');
                    const sabor = document.createElement('td');
                    const preço = document.createElement('td');
    
                    if(value.tipo == "pizza"){
                        nome.innerText = 'Pizza'
                        tam.innerText = `${value["tamanho"]}`
                    }else{
                        nome.innerText = `${value["nome"]}`
                        tam.innerText = "---"
                    }
    
                    sabor.innerText = `${value["sabor"]}`
                    preço.innerText = `${value["preco"]}`
                    
                    Totval += value["preco"]
    
                    CurrRow.appendChild(nome)
                    CurrRow.appendChild(tam)
                    CurrRow.appendChild(sabor)
                    CurrRow.appendChild(preço)
    
                    Items.appendChild(CurrRow)
                })
                
                PedList.appendChild(Items);
                Pedido.appendChild(PedList)
                
                Totval = Totval.toFixed(2)
                const PedBott = document.createElement('div');
                PedBott.setAttribute('class', "PedBott");
                const Bott = document.createElement('h3')
                Bott.innerText = `Preço Total: R$ ${Totval}`
                PedBott.appendChild(Bott)
                
                Pedido.appendChild(PedBott)
                
                DisplayPeds.appendChild(Pedido);
            }
        });
    } else {
        console.error('Elemento peds não encontrado');
    }
}

//

function openEnvPop(){
    EnvPop.classList.add("show");
}

function closeEnvPop(){
    EnvPop.classList.remove("show");
}

const openDelPop = (item) => {
    currentItem = item;
    nomeBox = document.querySelector(".DelPopItem")
    nomeItem = item.querySelector(".NomeBox").innerText
    sabItem = item.querySelector(".SaborBox").innerText
    nomeBox.innerText = `${nomeItem}, ${sabItem}`
    DelPop.classList.add("show");
}

function closeDelPop(){
    DelPop.classList.remove("show");
}