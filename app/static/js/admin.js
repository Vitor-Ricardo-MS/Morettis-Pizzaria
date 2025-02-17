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

const PrEdTabs = document.querySelectorAll(".PrEdBtn");

PrEdTabs.forEach(tab => tab.addEventListener('click', () => PrEdTabClicked(tab)));

const PrEdTabClicked = (tab) => {
    PrEdTabs.forEach(tab => tab.classList.remove("active"));
    tab.classList.add("active");

    const contents = document.querySelectorAll('.PrEdContent');
    contents.forEach(content => content.classList.remove("show"));

    const contentId = tab.getAttribute("content-id");

    const content = document.getElementById(contentId);

    content.classList.add("show");
}

const PrDeTabs = document.querySelectorAll(".PrDeBtn");

PrDeTabs.forEach(tab => tab.addEventListener('click', () => PrDeTabClicked(tab)));

const PrDeTabClicked = (tab) => {
    PrDeTabs.forEach(tab => tab.classList.remove("active"));
    tab.classList.add("active");

    const contents = document.querySelectorAll('.PrDeContent');
    contents.forEach(content => content.classList.remove("show"));

    const contentId = tab.getAttribute("content-id");

    const content = document.getElementById(contentId);

    content.classList.add("show");
}

const SbCrTabs = document.querySelectorAll(".SbCrBtn");

SbCrTabs.forEach(tab1 => tab1.addEventListener('click', () => SbCrTabClicked(tab1)));

const SbCrTabClicked = (tab1) => {
    SbCrTabs.forEach(tab => tab.classList.remove("active"));
    tab1.classList.add("active");

    const contents1 = document.querySelectorAll('.SbCrContent');
    contents1.forEach(content1 => content1.classList.remove("show"));

    const contentId1 = tab1.getAttribute("content-id");

    const content1 = document.getElementById(contentId1);

    content1.classList.add("show");
}

const SbEdTabs = document.querySelectorAll(".SbEdBtn");

SbEdTabs.forEach(tab1 => tab1.addEventListener('click', () => SbEdTabClicked(tab1)));

const SbEdTabClicked = (tab1) => {
    SbEdTabs.forEach(tab => tab.classList.remove("active"));
    tab1.classList.add("active");

    const contents1 = document.querySelectorAll('.SbEdContent');
    contents1.forEach(content1 => content1.classList.remove("show"));

    const contentId1 = tab1.getAttribute("content-id");

    const content1 = document.getElementById(contentId1);

    content1.classList.add("show");
}

const SbDeTabs = document.querySelectorAll(".SbDeBtn");

SbDeTabs.forEach(tab1 => tab1.addEventListener('click', () => SbDeTabClicked(tab1)));

const SbDeTabClicked = (tab1) => {
    SbDeTabs.forEach(tab => tab.classList.remove("active"));
    tab1.classList.add("active");

    const contents1 = document.querySelectorAll('.SbDeContent');
    contents1.forEach(content1 => content1.classList.remove("show"));

    const contentId1 = tab1.getAttribute("content-id");

    const content1 = document.getElementById(contentId1);

    content1.classList.add("show");
}