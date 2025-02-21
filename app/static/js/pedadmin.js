const socket = io('http://localhost:8080')

const DelPop = document.querySelector(".DelPopup")
let currentPed

socket.on('connect', () => {
    console.log('Connected');
    getUpdPeds();
})

socket.on('UpdPeds', (data) => {
    UpdatePeds(data)
    console.log('Pedidos Updated')
})

socket.on('DelPed', () => {
    console.log('Pedido Deleted')
})

//

function getUpdPeds(){
    socket.emit('UpdPeds')
}

function deletePed( ){
    nomeItem = currentPed.querySelector(".PedInfo").innerText
    arrNom = nomeItem.split(" ")
    usu = arrNom[0]
    id = parseFloat(arrNom[2])
    socket.emit('DelPed', usu, id)
    closeDelPop()
}

//

function UpdatePeds( data ) {
    const DisplayPeds = document.querySelector(".PedsContents")
    if (DisplayPeds) {
        DisplayPeds.innerHTML = '';
        data.forEach(item => {
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
        });

        const Pedi = document.querySelectorAll(".Ped")
        Pedi.forEach(ped => ped.addEventListener('click', () => openDelPop(ped)))
    } else {
        console.error('Elemento peds não encontrado');
    }
}

const openDelPop = (ped) => {
    currentPed = ped;
    nomeBox = document.querySelector(".DelPopItem")
    nomeItem = ped.querySelector(".PedInfo").innerText
    nomeBox.innerText = `${nomeItem}`
    DelPop.classList.add("show");
}

function closeDelPop() {
    DelPop.classList.remove("show");
}