
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

const re_modify = document.getElementById('com_modify'); // 수정버튼
const modify = document.getElementById('modify'); // 수정완료버튼

// 댓글 수정 구현
re_modify.addEventListener('click', (e) => {
    document.getElementById('reply_detail').style.display = "none";
    document.getElementById('reply_modify_form').style.display ="";
});


modify.addEventListener('click', (e) => {
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
   
    const com_num = re_modify.value;
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


const de_cnt = document.getElementsByClassName('com_delete');

for (var i = 0; i < de_cnt.length; ++i) {
const re_delete = document.getElementsByClassName('com_delete')[i]; // 삭제버튼

re_delete.addEventListener('click', (e) => {
    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            console.log(xhttp.responseXML);
           	refreshList();
        }
    });
	
	const num = document.getElementById('num').value;
	const com_num = re_delete.getAttribute('data');

    console.log(num);
    console.log(com_num);

    xhttp.open('GET', './com_delete/'+com_num);
    xhttp.send();
});
}