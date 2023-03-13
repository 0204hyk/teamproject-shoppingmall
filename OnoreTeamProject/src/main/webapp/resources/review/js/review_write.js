function PreviewImage() {
	
	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById('previewImg1').src = e.target.result;
	};			
	preview.readAsDataURL(document.getElementById('fileUpload1').files[0]);
};



const handler = {
            init() {
                const fileInput = document.querySelector('#fileUpload1');
                var fileList = document.getElementById('imgBox1');
                fileInput.addEventListener('change', () => {
                    var files = Array.from(fileInput.files)
                    files.forEach(file => {
                        fileList.innerHTML = `
                            <input type='button' data-index='${file.lastModified}' id="${file.lastModified}" class='file-remove' value='X'></input>
                        `;
                    });
                });
                
            },

            removeFile: () => {
            
                document.addEventListener('click', (e) => {
                    if (e.target.className !== 'file-remove') return;
                    const removeTargetId = e.target.dataset.index;
                    console.log(e.target);
                    const removeTarget = document.getElementById(removeTargetId);

                    var removeImage = document.getElementById('previewImg1');

                    const files = document.querySelector('#fileUpload1').files;

                    var dataTranster = new DataTransfer();

                    // document.querySelector('#file-input').files =
                    //             Array.from(files).filter(file => file.lastModified !== removeTarget);


                    Array.from(files)
                        .filter(file => file.lastModified != removeTargetId)
                        .forEach(file => {
                            dataTranster.items.add(file);

                        });


                    document.querySelector('#fileUpload1').files = dataTranster.files;
                    removeTarget.remove();
                    removeImage.src = '';
                })
            }
        }

        handler.init()
        handler.removeFile()

function PreviewImage2() {
	
	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById('previewImg2').src = e.target.result;
	};			
	preview.readAsDataURL(document.getElementById('fileUpload2').files[0]);
};
const handler2 = {
            init2() {

                const fileInput2 = document.querySelector('#fileUpload2');

                var fileList = document.getElementById('imgBox2');


                fileInput2.addEventListener('change', () => {
           
                
                    var files2 = Array.from(fileInput2.files)

                    files2.forEach(file => {
                        fileList.innerHTML = `
                            <input type='button' data-index='${file.lastModified}' id='${file.lastModified}' class='file-remove2' value='X'></input>`;
                    });
                });
            },


            removeFile2: () => {
                var remove2 = document.getElementsByClassName('file-remove2');
                console.log(remove2);
                document.addEventListener('click', (e) => {
                    if (e.target.className !== 'file-remove2') return;
                    const removeTargetId2 = e.target.dataset.index;
                    console.log(e.target);

                    const removeTarget2 = document.getElementById(removeTargetId2);
                    var removeImage2 = document.getElementById('previewImg2');
                    const files2 = document.querySelector('#fileUpload2').files;
                    var dataTranster2 = new DataTransfer();
               
                    Array.from(files2)
                        .filter(file => file.lastModified != removeTargetId2)
                        .forEach(file => {
                            dataTranster2.items.add(file);

                        });


                    document.querySelector('#fileUpload2').files = dataTranster2.files;
                    removeTarget2.remove();
                    removeImage2.src = '';
                })
            }
        }

        handler2.init2()
        handler2.removeFile2()

function PreviewImage3() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('previewImg3').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('fileUpload3').files[0]);

};

        const handler3 = {
            init3() {

                const fileInput3 = document.querySelector('#fileUpload3');

                var fileList = document.getElementById('imgBox3');


                fileInput3.addEventListener('change', () => {
                    var files3 = Array.from(fileInput3.files)

                    files3.forEach(file => {
                        fileList.innerHTML = `
                            <input type='button' data-index='${file.lastModified}' id='${file.lastModified}' class='file-remove3' value='X'></input>`;
                    });
                });


            },


            removeFile3: () => {
         

                document.addEventListener('click', (e) => {
                    if (e.target.className !== 'file-remove3') return;
          
                    const removeTargetId3 = e.target.dataset.index;
                    console.log(e.target);

                    const removeTarget3 = document.getElementById(removeTargetId3);


                    var removeImage3 = document.getElementById('previewImg3');


                    const files3 = document.querySelector('#fileUpload3').files;


                    var dataTranster3 = new DataTransfer();

                    Array.from(files3)
                        .filter(file => file.lastModified != removeTargetId3)
                        .forEach(file => {
                            dataTranster3.items.add(file);

                        });


                    document.querySelector('#fileUpload3').files = dataTranster3.files;
                    removeTarget3.remove();
                    removeImage3.src = '';
                })
            }
        }

        handler3.init3()
        handler3.removeFile3()


const write_btn = document.getElementById('write_btn');

write_btn.addEventListener('click', (e) => {
	const content = document.getElementById('reviewContents');

    var value = document.querySelector('input[name = "review_rating"]:checked');
	console.log(value);

   if(value === null) {
        alert('별점을 선택해주세요');
         e.preventDefault();
    } else if (content.value === "") {
    	alert('내용을 입력해주세요')
    	e.preventDefault();
    	content.focus();
    }
    if (value !== null && content.value !== "") {
    	if(!confirm('완료하시겠습니까?')) {
    		e.preventDefault();
    	}
    	
    }
});




