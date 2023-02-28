function writeNotice(url){
    var writeFormData = $('#notice-write-form').serialize();
    
    $.ajax({
        url: url,
        type: "POST",
        cache: false,
        data: writeFormData,
        cache : false,
        success: function(data){
            alert('공지사항 등록 완료');
            movePageByGet('/project/admin/notice/list');
        },
        error: function (request, status, error){        
            console.log(error);
        }
    })     
}

function modifyNotice(url){
    var modifyFormData = $('#notice-modify-form').serialize();
    
    $.ajax({
        url: url,
        type: "POST",
        cache: false,
        data: modifyFormData,
        cache : false,
        success: function(data){
            alert('공지사항 수정 완료');
            movePageByGet('/project/admin/notice/list');
        },
        error: function (request, status, error){        
            console.log(error);
        }
    })     
}
