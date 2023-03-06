
// 선택한값 보여주는 함수
const showValue = (target) => {
    const value = target.value;
    console.log(value);
}


const sizes = document.getElementById('size');
const heels = document.getElementById('heel');
const soles = document.getElementById('sole');

const op = document.getElementById('select');
const cntinfo = document.getElementById('cntinfo');
const priceinfo = document.getElementById('priceinfo');

const prices = document.getElementById('price').innerText;
const price = prices.replace(/[^0-9]/g, '');

const name = document.getElementById('product_name').innerText;



function count(type) {

    const cnt = document.getElementById('result');

    let number = cnt.innerText;

    if (type === 'plus') {

        number = parseInt(number) + 1;

    } else if (type === 'minus') {
        if(number > 1) {
            number = parseInt(number) - 1; 
        } else {
            number = 1;
        }
       
    }

    cnt.innerText = number;

    const a = document.getElementById('a');
    a.innerHTML = number * price + " 원 &nbsp;&nbsp;&nbsp;&nbsp; <i class='fa-solid fa-xmark fa-lg' id='cancel'></i>";
    cntinfo.innerHTML = number + "개";
    priceinfo.innerHTML = number * price + "원";
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
                        + "<br>" + "<div id='a'>" + price + " 원 &nbsp;&nbsp;&nbsp;&nbsp; <i class='fa-solid fa-xmark fa-lg' id='cancel'></i> </div>" 
                        + "</div>"
                        ;
                        cnt.style.display = "";

                        console.log(cnt.innerText);

                        cntinfo.innerHTML = cnt.innerText + "개";
                        priceinfo.innerHTML = price + "원";

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

const detailView = document.getElementById('detailView');
const detail = document.getElementsByClassName('mid')[0];

const reviewView= document.getElementById('reviewView');
const review = document.getElementsByClassName('review')[0];

const qnaView= document.getElementById('qnaView');
const qna = document.getElementsByClassName('qna')[0];

detailView.addEventListener('click', () => {
    window.scrollBy({top: detail.getBoundingClientRect().top, behavior: 'smooth'});
});

reviewView.addEventListener('click', () => {
    window.scrollTo({top: qna.getBoundingClientRect().top, behavior: 'smooth'});
});

qnaView.addEventListener('click', () => {
    window.scrollBy({top: qna.getBoundingClientRect().top, behavior: 'smooth'});
});
