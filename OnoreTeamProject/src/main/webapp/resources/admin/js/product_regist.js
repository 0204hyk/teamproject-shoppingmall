// input 숫자 포맷
var input = document.querySelector('#input-price');
input.addEventListener('keyup', function(e) {
  let value = e.target.value;
  value = Number(value.replaceAll(',', ''));
  if(isNaN(value)) {
    input.value = 0;
  }else {
    const formatValue = value.toLocaleString('ko-KR');
    input.value = formatValue;
  }
})

// 썸네일 이미지 미리보기, 서버에 이미지 파일 저장
$('input[name="product_thumbnail_1"]').change(function(){
    setImageFromFile(this, '#preview1');
    $('input[name="product_thumbnail_2"]').attr("disabled", false);
});

$('input[name="product_thumbnail_2"]').change(function(){
    setImageFromFile(this, '#preview2');
    $('input[name="product_thumbnail_3"]').attr("disabled", false);
});

$('input[name="product_thumbnail_3"]').change(function(){
    setImageFromFile(this, '#preview3');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
    $(expression).attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}

// 파일 미선택시 이미지 미리보기 초기화, 다음 썸네일 등록창 비활성화, 이전 항목 null 될 경우 뒤의 항목도 null
$('input[name=product_thumbnail_1]').change(function(){
  if ($('input[name=product_thumbnail_1]').val() == '') {
    $('#preview1').attr('src', "/project/resources/admin/image/default_image.png");
    $('#preview2').attr('src', "/project/resources/admin/image/default_image.png");
    $('#preview3').attr('src', "/project/resources/admin/image/default_image.png");
    $('input[name="product_thumbnail_2"]').val('');
    $('input[name="product_thumbnail_3"]').val('');
    $('input[name="product_thumbnail_2"]').attr("disabled", true);
    $('input[name="product_thumbnail_3"]').attr("disabled", true);
  }
})
$('input[name=product_thumbnail_2]').change(function(){
  if ($('input[name=product_thumbnail_2]').val() == '') {
    $('#preview2').attr('src', "/project/resources/admin/image/default_image.png");
    $('#preview3').attr('src', "/project/resources/admin/image/default_image.png");
    $('input[name="product_thumbnail_3"]').val('');
    $('input[name="product_thumbnail_3"]').attr("disabled", true);
  } else if (!$('input[name=product_thumbnail_2]').val() == '') {
    $('input[name="product_thumbnail_3"]').attr("disabled", false);
  }
})
$('input[name=product_thumbnail_3]').change(function(){
  if ($('input[name=product_thumbnail_3]').val() == '') {
    $('#preview3').attr('src', "/project/resources/admin/image/default_image.png");
  }
})
// 상품등록 ajax POST
function productRegist(url){
  if ($('select[name=category_num]').val() == 0) {
    alert('상품의 카테고리를 선택해주세요.');
  } else if ($('input[name=product_name]').val() == '') {
    alert('상품명을 입력해주세요.');
  } else if ($('input[name=product_price]').val() == '') {
    alert('상품의 가격을 입력해주세요.');
  } else if ($('textarea[name=product_info]').val() == '') {
    alert('상품의 소개글을 작성해주세요.')
  } else if ($('.summernote').summernote('isEmpty')) {
    alert('상품의 상세정보를 작성해주세요.')
  } else if ($('input[name=product_thumbnail_1]').val() == '') {
    alert('상품 썸네일 이미지를 1개 이상 등록해주세요');
  } else {
    var result = confirm('상품을 등록하시겠습니까?');
    
    if (result) {
      let product_num = $('#input-num').val;
      let category_num = $('#input-category').val();
      let product_name = $('#input-name').val();
      let product_price = $('#input-price').val();
      let product_info = $('#input-info').val();
      let product_thumbnail_1 = $('#thumbnail1')[0];
      let product_thumbnail_2 = $('#thumbnail2')[0];
      let product_thumbnail_3 = $('#thumbnail3')[0];
      let product_detail = $('#input-detail').val();
      
      let registFormData = new FormData();
      registFormData.append("product_num", product_num);
      registFormData.append("category_num", category_num);
      registFormData.append("product_name", product_name);
      registFormData.append("product_price", product_price);
      registFormData.append("product_info", product_info);
      registFormData.append("product_thumbnail_1", product_thumbnail_1.files[0]);
      registFormData.append("product_thumbnail_2", product_thumbnail_2.files[0]);
      registFormData.append("product_thumbnail_3", product_thumbnail_3.files[0]);
      registFormData.append("product_detail", product_detail);
  
      $.ajax({
          url: url,
          type: "POST",
          enctype: 'multipart/form-data',
          cache: false,
          data: registFormData,
          contentType: false,
          processData: false,    
          success: function(data){
              alert('상품이 등록되었습니다.');
              movePageByGet('/project/admin/product/list');
          },
          error: function (request, status, error){        
              console.log(error);
          }
      })       
    } else {

    }
  }
}

function productModify(url){
  if ($('select[name=category_num]').val() == 0) {
    alert('상품의 카테고리를 선택해주세요.');
  } else if ($('input[name=product_name]').val() == '') {
    alert('상품명을 입력해주세요.');
  } else if ($('input[name=product_price]').val() == '') {
    alert('상품의 가격을 입력해주세요.');
  } else if ($('textarea[name=product_info]').val() == '') {
    alert('상품의 소개글을 작성해주세요.')
  } else if ($('.summernote').summernote('isEmpty')) {
    alert('상품의 상세정보를 작성해주세요.')
  } else if ($('input[name=product_thumbnail_1]').val() == '') {
    alert('상품 썸네일 이미지를 1개 이상 등록해주세요');
  } else {
    var result = confirm('상품을 등록하시겠습니까?');

    if (result) {
      let product_num = $('#input-num').val();
      let category_num = $('#input-category').val();
      let product_name = $('#input-name').val();
      let product_price = $('#input-price').val();
      let product_info = $('#input-info').val();
      let product_thumbnail_1 = $('#thumbnail1')[0];
      let product_thumbnail_2 = $('#thumbnail2')[0];
      let product_thumbnail_3 = $('#thumbnail3')[0];
      let product_detail = $('#input-detail').val();
      
      let registFormData = new FormData();
      registFormData.append("product_num", product_num);
      registFormData.append("category_num", category_num);
      registFormData.append("product_name", product_name);
      registFormData.append("product_price", product_price);
      registFormData.append("product_info", product_info);
      registFormData.append("product_thumbnail_1", product_thumbnail_1.files[0]);
      registFormData.append("product_thumbnail_2", product_thumbnail_2.files[0]);
      registFormData.append("product_thumbnail_3", product_thumbnail_3.files[0]);
      registFormData.append("product_detail", product_detail);
    
      $.ajax({
          url: url,
          type: "POST",
          enctype: 'multipart/form-data',
          cache: false,
          data: registFormData,
          contentType: false,
          processData: false,    
          success: function(data){
              alert('상품이 수정되었습니다.');
              movePageByGet('/project/admin/product/list');
          },
          error: function (request, status, error){        
              console.log(error);
          }
      })     
    } else {

    }
  }
}