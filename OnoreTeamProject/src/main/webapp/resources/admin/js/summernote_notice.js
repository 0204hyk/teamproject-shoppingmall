$(document).ready(function() {
    $('.summernote').summernote({
            placeholder: '내용을 작성해주세요.',
            height: 560,
            lang: 'ko-KR',
            disableResizeEditor: true,
            toolbar: [
              // [groupName, [list of button]]
              ['fontname', ['fontname']],
              ['fontsize', ['fontsize']],
              ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
              ['color', ['forecolor','color']],
              ['table', ['table']],
              ['para', ['ul', 'ol', 'paragraph']],
              ['height', ['height']],
              ['insert',['picture','link','video']],
              ['view', ['fullscreen', 'codeview', 'help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            callbacks : { 
            	onImageUpload : function(files) {
                    // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                        uploadSummernoteImageFile(files[i], this);
                    }
            	}
            }
    });
    $('.dropdown-toggle').dropdown();
});

  
function uploadSummernoteImageFile(file, el) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data : data,
        type : "POST",
        url : contextPath + '/admin/notice_image.upload',
        contentType : false,
        enctype : 'multipart/form-data',
        processData : false,
        success : function(data) {
            $(el).summernote('editor.insertImage', data.url);
        }
    });
}