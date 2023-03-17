$('#review-delete-btn').click(function() {
    if ($("input:checkbox[name=row_check]:checked").length == 0) {
        alert('삭제할 항목을 선택해주세요.');
    } else {
        var result = confirm('삭제하시겠습니까?');
        
        if(result) {
            var formData = $('#review-list-form').serialize();
            
            var checked = $("input:checkbox[name=row_check]:checked").length;
            $.ajax({
                url: "<%=request.getContextPath()%>/admin/board/review/delete",
                type: "POST",
                cache: false,
                data: formData,
                cache : false,
                success: function(data){
                    alert(checked + "개의 후기글을 삭제하였습니다.");
                    movePageByGet('<%=request.getContextPath()%>/admin/board/review');
                },
                error: function (request, status, error){        
                    console.log(error);
                    alert('삭제 실패 (오류)');
                }
            })     
        } else {
            
        }
    }
});

$('#search-btn').click(function() {
    var search_type = $('select[name=search_type]').val();
    var search_keyword = $('input[name=search_keyword]').val();
    movePageByGet(contextPath + "/admin/board/review?search_type=" + search_type + "&search_keyword=" + search_keyword);
});

$('input[name=search_keyword]').click(function() {
    $('input[name=search_keyword]').val('');
});

$('input[name=search_keyword]').keydown(function (key) {
    // 엔터키 누르면 검색 (엔터키의 키코드 13)
    if(key.keyCode == 13) {
        var search_type = $('select[name=search_type]').val();
        var search_keyword = $('input[name=search_keyword]').val();
        movePageByGet(contextPath + "/admin/board/review?search_type=" + search_type + "&search_keyword=" + search_keyword);
    }
});
