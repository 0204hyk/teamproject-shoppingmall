var popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
let openurl = './pagenation'
const test = document.getElementById('more');

test.addEventListener('click',(e) => {
    open(openurl,'pop',popOption);
});

window.open();