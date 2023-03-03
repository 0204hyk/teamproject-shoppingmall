function PreviewImage() {
	
	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image1').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image1').files[0]);
	
	var fileInput = document.getElementsByClassName("img-input");

		
	
	
};


function PreviewImage2() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image2').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image2').files[0]);

};

function PreviewImage3() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image3').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image3').files[0]);

};