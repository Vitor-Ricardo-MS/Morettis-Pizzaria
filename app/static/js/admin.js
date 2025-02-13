const PrCrTabs = document.querySelectorAll(".PrCrBtn");

PrCrTabs.forEach(tab => tab.addEventListener('click', () => PrCrTabClicked(tab)));

const PrCrTabClicked = (tab) => {
    PrCrTabs.forEach(tab => tab.classList.remove("active"));
    tab.classList.add("active");

    const contents = document.querySelectorAll('.PrCrContent');
    contents.forEach(content => content.classList.remove("show"));

    const contentId = tab.getAttribute("content-id");

    const content = document.getElementById(contentId);

    content.classList.add("show");
}

const SbTabs = document.querySelectorAll(".SbBtn");

SbTabs.forEach(tab1 => tab1.addEventListener('click', () => SbTabClicked(tab1)));

const SbTabClicked = (tab1) => {
    SbTabs.forEach(tab => tab.classList.remove("active"));
    tab1.classList.add("active");

    const contents1 = document.querySelectorAll('.SbContent');
    contents1.forEach(content1 => content1.classList.remove("show"));

    const contentId1 = tab1.getAttribute("content-id");

    const content1 = document.getElementById(contentId1);

    content1.classList.add("show");
}