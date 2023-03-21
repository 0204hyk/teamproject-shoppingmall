const comms = document.getElementsByClassName('mem')
for (let k = 0;  k < comms.length; ++k ){


const comment_id = document.getElementsByClassName('mem')[k].innerText;
const masking_Id = maskingName(comment_id);

const setId = document.getElementsByClassName('com_id')[k];
console.log(comment_id);
console.log(maskingName(comment_id));

setId.innerHTML = masking_Id;
}

// 마스킹네임
function maskingName(name) {
    if (name.length <= 2) {
      return name.replace(name.substring(0, 1), "*");
    }
  
    return (
      name[0] +
      "*".repeat(name.substring(1, name.length - 1).length) +
      name[name.length - 1]
    );
  }

const comment = document.getElementById('comment');
const comment_content = document.getElementById('comment_content');

comment_content.addEventListener('click', (e) =>{
    comment_content.value="";
});



function refreshList() {
    location.reload();
}

const id = document.getElementById('comment_id').innerText;
console.log("로그인아이디" + id);


comment.addEventListener('click', (e) => {
if (id !== "") {	
    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
        console.log('readyState: ', xhttp.readyState);
        console.log('httpStatus: ', xhttp.status);
        if (e.target.readyState == 4 && e.target.status == 200) {
            refreshList();
        }
    });
    xhttp.open('POST', contextPath + '/review/comment');

    xhttp.setRequestHeader('Content-type', 'application/json');
    
    const num = document.getElementById('num').value;
    const content = document.getElementById('comment_content').value;
   
	
	

    const com = {
        review_num: num,
        comment_content: content,
        comment_id: id
    }

	
    // send(payload) : 데이터를 실어 보낼 수 있다
    xhttp.send(JSON.stringify(com));
} else {
	if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')) {
		location.href=contextPath + '/login';
	}
	}    
});



const re_modify = document.getElementById('com_modify'); // 수정버튼
const modify = document.getElementById('modify'); // 수정완료버튼

const modify_cancel = document.getElementById('modify_cancel'); // 수정취소
const get_content = document.getElementById('get_content').innerText;

// 댓글 수정 구현
re_modify.addEventListener('click', (e) => {
    document.getElementById('reply_detail').style.display = "none";
    document.getElementById('reply_modify_form').style.display ="";
});

modify_cancel.addEventListener('click', (e) =>{
    document.getElementById('reply_detail').style.display = "";
    document.getElementById('reply_modify_form').style.display ="none";
    document.getElementById('reply_modify').value = get_content;
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

    xhttp.open('POST', contextPath + '/review/com_modify');

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

    xhttp.open('GET', contextPath + '/review/com_delete/'+com_num);
    xhttp.send();
});
}