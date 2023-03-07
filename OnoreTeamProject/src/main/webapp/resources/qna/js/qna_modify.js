
const handler = {
            init() {
                const fileInput = document.querySelector('#file-input');
                var fileList = document.getElementById('imgBox1');
                fileInput.addEventListener('change', () => {
                    var files = Array.from(fileInput.files)
                    files.forEach(file => {
                        fileList.innerHTML = `
                            <input type='button' data-index='${file.lastModified}' id="${file.lastModified}" class='file-remove' value='x'></input>
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

                    var removeImage = document.getElementById('user-image1');

                    const files = document.querySelector('#file-input').files;

                    var dataTranster = new DataTransfer();

                    // document.querySelector('#file-input').files =
                    //             Array.from(files).filter(file => file.lastModified !== removeTarget);


                    Array.from(files)
                        .filter(file => file.lastModified != removeTargetId)
                        .forEach(file => {
                            dataTranster.items.add(file);

                        });


                    document.querySelector('#file-input').files = dataTranster.files;
                    removeTarget.remove();
                    removeImage.src = '';
                })
            }
        }

        handler.init()
        handler.removeFile()

const handler2 = {
            init2() {

                const fileInput2 = document.querySelector('#file-input2');

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
                    var removeImage2 = document.getElementById('user-image2');
                    const files2 = document.querySelector('#file-input2').files;
                    var dataTranster2 = new DataTransfer();
                    // document.querySelector('#file-input').files =
                    //             Array.from(files).filter(file => file.lastModified !== removeTarget);
                    Array.from(files2)
                        .filter(file => file.lastModified != removeTargetId2)
                        .forEach(file => {
                            dataTranster2.items.add(file);

                        });


                    document.querySelector('#file-input2').files = dataTranster2.files;
                    removeTarget2.remove();
                    removeImage2.src = '';
                })
            }
        }

        handler2.init2()
        handler2.removeFile2()
        const handler3 = {
            init3() {

                const fileInput3 = document.querySelector('#file-input3');

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


                    var removeImage3 = document.getElementById('user-image3');


                    const files3 = document.querySelector('#file-input3').files;


                    var dataTranster3 = new DataTransfer();

                    Array.from(files3)
                        .filter(file => file.lastModified != removeTargetId3)
                        .forEach(file => {
                            dataTranster3.items.add(file);

                        });


                    document.querySelector('#file-input3').files = dataTranster3.files;
                    removeTarget3.remove();
                    removeImage3.src = '';
                })
            }
        }

        handler3.init3()
        handler3.removeFile3()

const imageBox = document.getElementsByClassName('img-input')[0];
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