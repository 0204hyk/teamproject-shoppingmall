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

// 파일 선택 클릭 시 이미지 미리보기 초기화
$('input[name=product_thumbnail_1]').click(function(){
  $('#preview1').attr('src', "/project/resources/admin/image/default_image.png");
})
$('input[name=product_thumbnail_2]').click(function(){
  $('#preview2').attr('src', "/project/resources/admin/image/default_image.png");
})
$('input[name=product_thumbnail_3]').click(function(){
  $('#preview3').attr('src', "/project/resources/admin/image/default_image.png");
})

// 상품등록 ajax POST
function productRegist(url){

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
            alert('상품 등록 완료');
            movePageByGet('/project/admin/product/list');
        },
        error: function (request, status, error){        
            console.log(error);
        }
    })     
}

function productModify(url){
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
          alert('상품 수정 완료');
          movePageByGet('/project/admin/product/list');
      },
      error: function (request, status, error){        
          console.log(error);
      }
  })     
}