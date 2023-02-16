const fileInput1 = document.getElementById("fileUpload1");
const fileInput2 = document.getElementById("fileUpload2");
const fileInput3 = document.getElementById("fileUpload3");

const handleFiles1 = (e) => {
  const selectedFile = [...fileInput1.files];
  const fileReader = new FileReader();

  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg1").src = fileReader.result;
  };
};

fileInput1.addEventListener("change", handleFiles1);

const handleFiles2 = (e) => {
  const selectedFile = [...fileInput2.files];
  const fileReader = new FileReader();

  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg2").src = fileReader.result;
  };
};

fileInput2.addEventListener("change", handleFiles2);

const handleFiles3 = (e) => {
  const selectedFile = [...fileInput3.files];
  const fileReader = new FileReader();

  fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = function () {
    document.getElementById("previewImg3").src = fileReader.result;
  };
};

fileInput3.addEventListener("change", handleFiles3);

   function readURL(input) {
      var file = input.files[0] 
      console.log(file)
      if (file != '') {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
	     console.log(e.target)
		console.log(e.target.result)
           $('#preview').attr('src', e.target.result);
          }
      }
  }  

