
// 선택한값 보여주는 함수
const showValue = (target) => {
    const value = target.value;
    console.log(value);
}

// 사이즈
const sizes = document.getElementById('size');

const size = null;
sizes.addEventListener('change', (e)=> {
   size = sizes.options[sizes.selectedIndex].value;
   console.log("size : " + size);
});

console.log("size2 : " + size);

// 힐
const heels = document.getElementById('heel');

heels.addEventListener('change', (e)=> {
    const heel = heels.options[heels.selectedIndex].value;
    console.log("heel : " + heel);
 });

// 밑창
const soles = document.getElementById('sole');

soles.addEventListener('change', (e)=> {
    const sole = soles.options[soles.selectedIndex].value;
    console.log("sole : " + sole);
 });

