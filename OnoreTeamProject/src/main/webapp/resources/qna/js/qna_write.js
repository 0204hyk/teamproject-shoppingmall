	var fileNo = 0;
	var filesArr = new Array();

	/* 첨부파일 추가 */
	function addFile(obj){
	    var maxFileCnt = 3;   // 첨부파일 최대 개수
	    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
	    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
	    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

	    // 첨부파일 개수 확인
	    if (curFileCnt > remainFileCnt) {
	        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
	    } else {
	        for (const file of obj.files) {
	            // 첨부파일 검증
	            if (validation(file)) {
	                // 파일 배열에 담기
	                var reader = new FileReader();
	                reader.onload = function () {
	                    filesArr.push(file);
	                };
	                reader.readAsDataURL(file);

	                // 목록 추가
	                let htmlData = '';
	                htmlData += '<div id="file' + fileNo + '" class="filebox">';
	                htmlData += '   <p class="name">' + file.name + '</p>';
	                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
	                htmlData += '</div>';
	                $('.file-list').append(htmlData);
	                fileNo++;
	            } else {
	                continue;
	            }
	        }
	    }
	    // 초기화
	    document.querySelector("input[type=file]").value = "";
	}
	/* 첨부파일 삭제 */
	function deleteFile(num) {
	    document.querySelector("#file" + num).remove();
	    filesArr[num].is_delete = true;
	}

	function changeSelect(e) {

		const input = document.getElementById('inputs');
		const value = e.value;

		if (value === '상품') {
			input.innerHTML += `<input type='text' name='category' />`;
			input.innerHTML += `<button name='search'>상품검색</button>`;
		} else {
			input.innerHTML = '';
		}

	}