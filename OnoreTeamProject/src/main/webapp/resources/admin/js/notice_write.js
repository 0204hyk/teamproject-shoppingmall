function writeNotice(url){
    if ($('input[name=notice_title]').val() == '') {
        alert('공지사항의 제목을 입력해주세요.');
    } else if ($('.summernote').summernote('isEmpty')) {
        alert('공지사항의 내용을 작성해주세요.')
    } else {
        var result = confirm('공지사항을 등록하시겠습니까?');
        var writeFormData = $('#notice-write-form').serialize();
        if (result) {
            $.ajax({
                url: url,
                type: "POST",
                cache: false,
                data: writeFormData,
                success: function(data){
                    alert('공지사항이 등록되었습니다.');
                    movePageByGet(contextPath + '/admin/notice/list');
                },
                error: function (request, status, error){        
                    console.log(error);
                }
            })     
        } else {

        }
    }
}    

$("#write-cancle-btn").click(function(){
    var result = confirm('공지사항 등록을 취소하시겠습니까?');
    if (result) {
        movePageByGet(contextPath + '/admin/notice/list');
    } else {

    }
});

function modifyNotice(url){
    if ($('input[name=notice_title]').val() == '') {
        alert('공지사항의 제목을 입력해주세요.');
    } else if ($('.summernote').summernote('isEmpty')) {
        alert('공지사항의 내용을 작성해주세요.')
    } else {
        var result = confirm('공지사항을 수정하시겠습니까?');
        var modifyFormData = $('#notice-modify-form').serialize();
        if (result) {
            $.ajax({
                url: url,
                type: "POST",
                cache: false,
                data: modifyFormData,
                success: function(data){
                    alert('공지사항이 수정되었습니다.');
                    movePageByGet(contextPath + '/admin/notice/list');
                },
                error: function (request, status, error){        
                    console.log(error);
                }
            })     
        } else {

        }
    }
}

$("#modify-cancle-btn").click(function(){
    var result = confirm('공지사항 수정을 취소하시겠습니까?');
    if (result) {
        movePageByGet(contextPath + '/admin/notice/list');
    } else {

    }
});