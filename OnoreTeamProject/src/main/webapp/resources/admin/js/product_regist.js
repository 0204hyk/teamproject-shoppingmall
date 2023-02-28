// 썸네일 이미지 추가
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

// input 숫자 포맷
const input = document.querySelector('#input-price');
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

// 상품등록 ajax POST
function productRegist(url){
    var registFormData = $('#product-regist-form').serialize();
    
    $.ajax({
        url: url,
        type: "POST",
        cache: false,
        data: registFormData,
        cache : false,
        success: function(data){
            alert('상품 등록 완료');
            movePageByGet('/project/admin/product/regist');
        },
        error: function (request, status, error){        
            console.log(error);
        }
    })     
}

