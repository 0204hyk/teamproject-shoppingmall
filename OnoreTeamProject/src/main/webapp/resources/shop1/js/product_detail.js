
// 선택한값 보여주는 함수
const showValue = (target) => {
    const value = target.value;
    console.log(value);
}


const sizes = document.getElementById('size');
const heels = document.getElementById('heel');
const soles = document.getElementById('sole');

const op = document.getElementById('select');

const prices = document.getElementById('price').innerText;
const price = prices.replace(/[^0-9]/g, '');

const name = document.getElementById('product_name').innerText;



function count(type) {

    const cnt = document.getElementById('result');

    let number = cnt.innerText;

    if (type === 'plus') {

        number = parseInt(number) + 1;

    } else if (type === 'minus') {

        number = parseInt(number) - 1;
    }

    cnt.innerText = number;

    const a = document.getElementById('a');
    a.innerHTML = number * price;
};



// 사이즈
sizes.addEventListener('change', (e) => {
    const size = sizes.options[sizes.selectedIndex].value;
    if (size != 'default') {
        heels.removeAttribute("disabled");
        // 힐
        heels.addEventListener('change', (e) => {
            const heel = heels.options[heels.selectedIndex].value;
            if (heel != 'default') {
                soles.removeAttribute("disabled");
                // 밑창
                soles.addEventListener('change', (e) => {
                    const sole = soles.options[soles.selectedIndex].value;
                    if (sole != 'default') {
                       
                        op.innerHTML ="<div id='box'>" + "<hr>" + "<span>" + name + "&nbsp;&nbsp;[" + size + "/" + heel + "/" + sole + "]</span>" 
                        + "<br>" + "<div id='a'>" + price + " won &nbsp;&nbsp;&nbsp;&nbsp; <i class='fa-solid fa-xmark' id='cancel'></i> </div>" 
                        + "</div>"
                        ;
                        cnt.style.display = "";

                        const cancel = document.getElementById('cancel');
                        cancel.addEventListener('click', (e) => {
                            const box = document.getElementById('box');
                            box.remove();
                            cnt.style.display="none";
                            sizes.value = 'default';
                            heels.value = 'default';
                            soles.value = 'default';
                            heels.disabled = true;
                            soles.disabled = true;
                        });
                        
                    }
                });
            }
        });
    }
});

function idMasking(id) {
    const firstName = id.substr(0,1)
    const midName = id.substr(1, id.length - 1);

    const masking = "";
    for(var i = 0; i < midName.length; ++i) {
        masking += "*";
    }

    const lastName = id.substr(id.length - 1, id.length);

    const maskingName = firstName + masking + lastName;

    return maskingName;
};




