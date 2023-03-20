$('#refund-btn').click(function() {

    // var result = confirm('취소/환불 처리하시겠습니까?');

    // if(result) {
    //     var formData = $('#order-list-form').serialize();
    
    //     $.ajax({
    //         url: contextPath + "/admin/order/refund",
    //         type: "POST",
    //         cache: false,
    //         data: formData,
    //         cache : false,
    //         success: function(data){
    //             alert("취소/환불 처리되었습니다.");
    //             movePageByGet(contextPath + '/admin/order/list');
    //         },
    //         error: function (request, status, error){        
    //             console.log(error);
    //             alert('환불 실패 (오류)');
    //         }
    //     })     
    // } else {
        
    // }
});

$('#search-btn').click(function() {
    var search_type = $('select[name=search_type]').val();
    var search_keyword = $('input[name=search_keyword]').val();

    movePageByGet(contextPath + "/admin/order/list?search_type=" + search_type + "&search_keyword=" + search_keyword);
});

$('input[name=search_keyword]').click(function() {
    $('input[name=search_keyword]').val('');
});

$('input[name=search_keyword]').keydown(function (key) {
    // 엔터키 누르면 검색 (엔터키의 키코드 13)
    if(key.keyCode == 13) {
        var search_type = $('select[name=search_type]').val();
        var search_keyword = $('input[name=search_keyword]').val();
        movePageByGet(contextPath + "/admin/order/list?search_type=" + search_type + "&search_keyword=" + search_keyword);
    }
});
