let sabData;
const tabs = document.querySelectorAll(".tab-btn");

console.log(tabs)

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

fetch("../../../app/controllers/db/bs.json").then(res => res.json())
.then(data => sabData = data).catch(err => console.log(err));

let array = sabData.find(item => item.tipo == "pizza")

console.log(array)

var htmlElements = "oloko";
var bebidas = document.getElementById("bebidas");
bebidas.appendChild(htmlElements)


    