
function addFile(obj){
	    const input = document.getElementById('file-list');
	   	
	    for (var i = 0; i <= 2; i++) {
	    	if (i == 0) {
	    		input.innerHTML = `<input type='file' name='file' />`;
	    	} else if (i == 1) {
	    		input.innerHTML += `<input type='file' name='file' />`;
	    	} else if (i == 2) {
	    		alert('첨부파일은 최대 3개까지 가능합니다.');
	    	}
	    }
	}	
	
function changeSelect() {
		
		const itemSelect = document.getElementById('select');
		var value = itemSelect.options[itemSelect.selectedIndex].value;
		var input = document.getElementById('inputs');
		
		
		if (value == '상품') {
			input.innerHTML += `<input type="text" name="category" /><button>검색</button>`;
		
		}
	}