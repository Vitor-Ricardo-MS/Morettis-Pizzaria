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
                    
    const nomepop = Popup.querySelector(".nomeProd");
    const tampop = Popup.querySelector(".tamProd");
    const precpop = Popup.querySelector(".precProd");

    const itemNome = item.querySelector(".nomeitem").innerText;
    const itemTamBox = item.querySelector(".tamanho");
    const itemPrec = item.querySelector(".preço").innerText;
    
    nomepop.setAttribute("value", itemNome)
    precpop.setAttribute("value", itemPrec)    
    if(itemTamBox != null){
        const itemTam = itemTamBox.innerText;

        tampop.setAttribute("value", itemTam)
        const lol = Popup.querySelector(".inputs.tam")
        lol.setAttribute("style", "Display: flex;")
    }else{
        tampop.setAttribute("value", "")
        const lol = Popup.querySelector(".inputs.tam")
        lol.setAttribute("style", "Display: none;")
    }
    updateSelectOptions(itemNome)

    Popup.classList.add("show");
}


const updateSelectOptions = (input) => {
    console.log(input);
    const selectElement = document.querySelector(".sabProd");
    console.log(selectElement);
    const inputValue = input;
    
    if (inputValue) {
        fetch(`/get-options?input_value=${inputValue}`)
        .then(response => response.json())
        .then(options => {
            if(options.length == 0){
                selectElement.innerHTML = '<option value="">Sabor único</option>';
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
        selectElement.innerHTML = '<option value="">Sabor único</option>';
    }
}

function closePopup() {
    Popup.classList.remove("show");
}