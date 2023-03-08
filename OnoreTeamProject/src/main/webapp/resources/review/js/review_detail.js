
const view = document.getElementById('view');
//const num = document.getElementById('num').value;
//const content = document.getElementById('comment_content').value;
const comment = document.getElementById('comment');

function refreshList() {
    location.reload();
}

comment.addEventListener('click', (e) => {
    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
        console.log('readyState: ', xhttp.readyState);
        console.log('httpStatus: ', xhttp.status);
        if (e.target.readyState == 4 && e.target.status == 200) {
            refreshList();
        }
    });
    xhttp.open('POST', './comment');

    xhttp.setRequestHeader('Content-type', 'application/json');
    const num = document.getElementById('num').value;
    const content = document.getElementById('comment_content').value;

    const com = {
        review_num: num,
        comment_content: content
    }

    console.log(num);
    console.log(content);

    // send(payload) : 데이터를 실어 보낼 수 있다
    xhttp.send(JSON.stringify(com));

});

const re_modifys = document.querySelectorAll('.com_modify'); // 수정버튼
const modify = document.querySelectorAll('.modify'); // 수정완료버튼
const re_deletes = document.querySelectorAll('.com_delete'); // 삭제버튼



// 댓글 수정 구현

re_modifys.forEach(btn => {
btn.addEventListener('click', (e) => {
    const re_modify = e.target;
    const reply_num = re_modify.document.getElementByClassName('com_modify').value;
    document.getElementById('reply_detail').style.display = "none";
    document.getElementById('reply_modify_form').style.display ="";
});
});

modify.forEach(btn3 => {
btn3.addEventListener('click', (e) => {
    const xhttp = new XMLHttpRequest();
    
    xhttp.addEventListener('readystatechange', (e) => {
        console.log('readyState: ', xhttp.readyState);
        console.log('httpStatus: ', xhttp.status);
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById('reply_detail').style.display = "";
            document.getElementById('reply_modify_form').style.display ="none";
            refreshList();
        }
    });

    xhttp.open('POST', './com_modify');

    xhttp.setRequestHeader('Content-type', 'application/json');
   
    const com_num = document.getElementById('com_num').value;
    const update_reply = document.getElementById('reply_modify').value;

    console.log(com_num);
    console.log(update_reply);

    const com = {
        comment_num: com_num,
        comment_content: update_reply
    }

    console.log(com);

    // send(payload) : 데이터를 실어 보낼 수 있다
    xhttp.send(JSON.stringify(com));
});
});

re_deletes.forEach(btn2 => {
btn2.addEventListener('click', (e) => {
    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            console.log(xhttp.responseXML);
           	refreshList();
        }
    });
	
	const num = document.getElementById('num').value;
	const com_num = document.getElementById('com_num').value;

    console.log(num);
    console.log(com_num);

    xhttp.open('GET', './com_delete/'+com_num);
    xhttp.send();
});
});