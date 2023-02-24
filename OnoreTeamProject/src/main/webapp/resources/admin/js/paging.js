function acyncMovePage(url){
    var ajaxOption = {
            url : url,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        // Contents 영역 삭제
        $('#contents-div').children().remove();
        // Contents 영역 교체
		$('#contents-div').html(data);
    });
}

