const tabs = document.querySelectorAll(".tab-btn");
const Popup = document.querySelector(".popup");
const Item = document.querySelectorAll(".item");

tabs.forEach(tab => tab.addEventListener('click', () => tabClicked(tab)));

const tabClicked = (tab) => {
    tabs.forEach(tab => tab.classList.remove("active"));
    tab.classList.add("active");

    const contents = document.querySelectorAll('.content');
    contents.forEach(content => content.classList.remove("show"));

    const contentId = tab.getAttribute("content-id");

    const content = document.getElementById(contentId);

    content.classList.add("show");
}

Item.forEach(item => item.addEventListener('click', () => ItemClicked(item)));

const ItemClicked = (item) => {

    const tipopop = Popup.querySelector(".tipoProd")
    const nomepop = Popup.querySelector(".nomeProd");
    const tampop = Popup.querySelector(".tamProd");
    const precpop = Popup.querySelector(".precProd");

    const itemTipo = item.querySelector(".tipoitem").value;
    const itemNome = item.querySelector(".nomeitem").innerText;
    const itemTamBox = item.querySelector(".tamanho");
    const itemPrec = item.querySelector(".preço").innerText;
    
    tipopop.setAttribute("value", itemTipo)
    nomepop.setAttribute("value", itemNome)
    precpop.setAttribute("value", itemPrec)    
    if(itemTamBox != null){
        const itemTam = itemTamBox.innerText;

        tampop.setAttribute("value", itemTam)
        const tambox = Popup.querySelector(".inputs.tam")
        tambox.setAttribute("style", "Display: flex;")
    }else{
        tampop.setAttribute("value", "")
        const tambox = Popup.querySelector(".inputs.tam")
        tambox.setAttribute("style", "Display: none;")
    }
    updateSelectOptions(itemNome)

    Popup.classList.add("show");
}

const updateSelectOptions = (input) => {
    const selectElement = document.querySelector(".sabProd");
    const inputValue = input;
    
    if (inputValue) {
        fetch(`/get-options?input_value=${inputValue}`)
        .then(response => response.json())
        .then(options => {
            if(options.length == 0){
                selectElement.innerHTML = '<option value="unico">Sabor único</option>';
            }else{
                selectElement.innerHTML = '<option value="">Selecione um Sabor</option>';
            }
            
            options.forEach(option => {
                const optionElement = document.createElement('option');
                optionElement.value = option;
                optionElement.textContent = option;
                selectElement.appendChild(optionElement);
            });
        })
        .catch(err => console.error('Error fetching options:', err));
    } else {
        selectElement.innerHTML = '<option value="">Selecione um sabor</option>';
    }
}

function closePopup() {
    Popup.classList.remove("show");
}

const socket = io('http://localhost:8080')

socket.on('connect', () => {
    console.log('Connect')
});

socket.on('disconnect', () => {
    console.log('Disconnect')
});

socket.on('AddToCart', () => {
    console.log('Item Added')
})

const AddCartBtn = document.querySelector(".AddCartBtn");
AddCartBtn.addEventListener('click', () => AddToCart());

function AddToCart(){
    const tipoProd = Popup.querySelector(".tipoProd").value;
    const nomeProd = Popup.querySelector(".nomeProd").value;
    const tamProd = Popup.querySelector(".tamProd").value;
    const precProd = Popup.querySelector(".precProd").value;
    const sabProd = Popup.querySelector(".sabProd").value;

    if(sabProd != ""){
        socket.emit('AddToCart', tipoProd, nomeProd, tamProd, precProd, sabProd)
    
        Popup.classList.remove("show");
    }
}