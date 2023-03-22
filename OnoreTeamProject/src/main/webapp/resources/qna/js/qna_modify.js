const title = document.getElementById('title');
const content = document.getElementById('qna_content');
const writeBtn = document.getElementById('write_btn');

writeBtn.addEventListener('click', (e) => {
	if (title.value === "") {
		alert('제목을 입력하세요.');
		title.focus();
		e.preventDefault();
	} else if (content.value === "") {
		alert('내용을 입력하세요.');
		content.focus();
		e.preventDefault();
	} 
	if (title.value != "" && content.value != "") {
		if (confirm('문의를 등록하시겠습니까?')) {
			alert('문의 등록이 완료되었습니다.');
		} else {
			e.preventDefault();
		}

	}
});


function PreviewImage() {
	
	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById('user-image1').src = e.target.result;
	};			
	preview.readAsDataURL(document.getElementById('file-input').files[0]);
};
const handler = {
            init() {
                const fileInput = document.querySelector('#file-input');
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

                    var removeImage = document.getElementById('user-image1');

                    const files = document.querySelector('#file-input').files;

                    var dataTranster = new DataTransfer();


                    Array.from(files)
                        .filter(file => file.lastModified != removeTargetId)
                        .forEach(file => {
                            dataTranster.items.add(file);

                        });


                    document.querySelector('#file-input').files = dataTranster.files;
                    removeTarget.remove();
                    removeImage.src = contextPath + '/resources/qna/images/blank.png';
                })
            }
        }

        handler.init()
        handler.removeFile()



function PreviewImage2() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image2').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('file-input2').files[0]);

};


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

                    Array.from(files2)
                        .filter(file => file.lastModified != removeTargetId2)
                        .forEach(file => {
                            dataTranster2.items.add(file);

                        });


                    document.querySelector('#file-input2').files = dataTranster2.files;
                    removeTarget2.remove();
                    removeImage2.src = contextPath + '/resources/qna/images/blank.png';
                })
            }
        }

        handler2.init2()
        handler2.removeFile2()

function PreviewImage3() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image3').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('file-input3').files[0]);

};

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
                    removeImage3.src = contextPath + '/resources/qna/images/blank.png';
                })
            }
        }

        handler3.init3()
        handler3.removeFile3()

const imageBox = document.getElementsByClassName('img-input')[0];


function changeSelect() {
		
	const itemSelect = document.getElementById('select');
	var value = itemSelect.options[itemSelect.selectedIndex].value;
	var input = document.getElementById('inputs');
	var product_num = document.getElementById('p_num');
	if (value == '상품') {
		input.innerHTML += `<input type="text" name="product_name" id="product" placeholder="상품명을 입력하세요." /><input type="button" id="search" value="검색하기" />`;
		input.innerHTML += `<div id="searchInput"></div>`;
	
		const searchBtn = document.getElementById('search');
		searchBtn.addEventListener('click', (e) => {
			let xhttp = new XMLHttpRequest();	
   			xhttp.addEventListener('readystatechange', (e) => {
        		if (xhttp.readyState == 4 && xhttp.status == 200) {
					let obj = JSON.parse(xhttp.responseText);
					var value = document.getElementById('product');
 					var searchInput = document.getElementById('searchInput');
 					for (var i = 0; i < obj.length; ++i) {
 						searchInput.innerHTML += `<div class="selectProduct"><input type="hidden" value=${obj[i].product_num} /><img id="searchImg" src=${obj[i].product_thumbnail_1}  /> <span class="product_name">${obj[i].product_name}</span></div>`;
 					}

 					var len = document.getElementsByClassName('selectProduct').length;
 				
 					for (var j = 0; j < len; ++j) {
 						var selected = document.getElementsByClassName('selectProduct')[j];
 						var product_name = document.getElementsByClassName('product_name')[j];
 				
 						selected.addEventListener('click', (e) => {
							console.log(e.target.children[0]);
							product_num.value = (e.target.children[0].defaultValue);
							value.value = e.target.innerText;
							searchInput.innerHTML = '';
							
 						});
 						
 					}	

 					product.addEventListener('click', (e) => {
 						
 						searchInput.innerHTML = '';
 						
 					});
				}	
		
		});
		var value = document.getElementById('product');
		var val = value.value;
		xhttp.open('GET', contextPath + '/restful/getProductName/' + val);
   	 	xhttp.send();

	});

	} else {
		input.innerHTML = '';
	}
}