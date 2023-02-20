const fileInput1 = document.getElementById("fileUpload1");
const fileInput2 = document.getElementById("fileUpload2");
const fileInput3 = document.getElementById("fileUpload3");
 
 /* 이미지1을 위한 코드추가 */
 const handleFiles1 = (e) => {
 	const selectedFile = [...fileInput1.files];
 	const fileReader = new FileReader();
 
  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg1").src = fileReader.result;
  };
};

fileInput1.addEventListener("change", handleFiles1); 

 
 /* 이미지2를 위한 코드추가 */
 const handleFiles2 = (e) => {
 	const selectedFile = [...fileInput2.files];
 	const fileReader = new FileReader();
 
  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg2").src = fileReader.result;
  };
};

fileInput2.addEventListener("change", handleFiles2); 

 
 /* 이미지3를 위한 코드추가 */
 const handleFiles3 = (e) => {
 	const selectedFile = [...fileInput3.files];
 	const fileReader = new FileReader();
 
  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg3").src = fileReader.result;
  };
};

fileInput3.addEventListener("change", handleFiles3); 

function getrating(event) {
    console.log(event.target.value);
  }
  
/* 별점 불러와서 체크하기 */
const star = document.getElementsByName('review_rating');
const rating = document.getElementById('star').value;

for (var i = 0; i < star.length; ++i) {
	if (star[i].value == rating) {
    star[i].checked=true;
  } 
}
  