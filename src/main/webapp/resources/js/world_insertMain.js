attachFile = {
				add : function(asd) { // 파일필드 추가
					var idx = asd;
					//alert("첫 시작 idx="+idx)
					var div = document.createElement('div');
					div.style.marginTop = '3px';
					div.id = 'file' + (idx);
					
					var check = document.getElementById('file'+idx).childElementCount;
					
					if(idx == 0){
						if(check == 2){
							document.getElementById('img0').src = document.getElementById('file_img0').value;
							return
						}else{
							var img = document.createElement('img');
							//alert('이미지Element생성'+idx)
							img.setAttribute("id",'img'+idx);
							img.setAttribute("src", document.getElementById('file_img'+idx).value);
							img.setAttribute("width", "50");
							img.setAttribute("height", "50");	
							document.getElementById('file'+idx).appendChild(img);
							//alert(document.getElementById('file_img'+idx).value) //이미지 주소
						}	
					}
					//alert("check값:"+check)
//					if(idx != 0){
//						if(check == 2){
//							var img = document.createElement('img');
//							//alert('이미지Element생성'+idx)
//							img.setAttribute("id",'img'+idx);
//							img.setAttribute("src", document.getElementById('file_img'+idx).value);
//							img.setAttribute("width", "50");
//							img.setAttribute("height", "50");	
//							document.getElementById('file'+idx).appendChild(img);
//							//alert(document.getElementById('file_img'+idx).value) //이미지 주소	
//						}else if(check == 3){
//							document.getElementById('img'+idx).src = document.getElementById('file_img'+idx).value;
//							return
//						}	
//					}
					var file = document.all ? document
							.createElement('<input name="files">') : document
							.createElement('input');
					file.type = 'file';
					file.name = 'file_img'+(idx);
					file.size = '20';
					file.id = 'file_img' + (idx);
					file.onchange = function(){
						attachFile.add((idx));
					}
					
					var btn = document.createElement('input');
					btn.type = 'button';
					btn.value = '삭제';
					btn.onclick = function() {
						var isDel = confirm('삭제 하시겠습니까?')
						if(isDel && document.getElementById('file_img'+(idx)).value != ''){
							attachFile.del((idx));
						}
					}
					btn.style.marginLeft = '5px';
					var imgCount = document.getElementById('file-list').childElementCount;
					//alert("이미지 갯수:"+imgCount)
					var fileCount = document.getElementById('attachFileDiv').childElementCount;
					
					document.getElementById('attachFileDiv').appendChild(div);	
					
					//alert("attachFileDiv 자식 갯수 :"+ fileCount)
					div.appendChild(file);
					div.appendChild(btn);
					if((fileCount+imgCount) == 1){
						alert("이미지등록은 1개만 등록 가능합니다.")
						document.getElementById(file.id).disabled = true;
						return
					}
				},
				del : function(idx) { // 파일필드 삭제
				//	alert("del안에들어옴! idx="+idx)
					var fileCount = document.getElementById('attachFileDiv').childElementCount;
					if(fileCount == 1 && document.getElementById('file_img0').value != ''){
						document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
						attachFile.delAdd(idx); 
						//alert("해치웠나?")
						return
					}
					document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
					var imgCount = document.getElementById('file-list').childElementCount;
					var fileCount = document.getElementById('attachFileDiv').childElementCount;
					if((imgCount+fileCount) != 2){
						document.getElementById('attachFileDiv').lastElementChild.firstElementChild.disabled = false;
						return
					}
				},
				
				delAdd : function(idx){
					var div = document.createElement('div');
					div.style.marginTop = '3px';
					div.id = 'file' + idx;
					var file = document.all ? document
							.createElement('<input name="files">') : document
							.createElement('input');
					file.type = 'file';
					file.name = 'file_img'+idx;
					file.size = '20';
					file.id = 'file_img' + idx;
					file.onchange = function(){
						attachFile.add(idx);
					}
					
					
					var btn = document.createElement('input');
					btn.type = 'button';
					btn.value = '삭제';
					btn.onclick = function() {
						var isDel = confirm('삭제 하시겠습니까?')
						if(isDel && document.getElementById('file_img'+idx).value != ''){
							attachFile.del(idx);
						}
					}
					btn.style.marginLeft = '5px';
					var fileCount = document.getElementById('attachFileDiv').childElementCount;
					if(fileCount >= 1){
						alert("파일은 총 1개만 등록 가능합니다.")
						return
					}
					document.getElementById('attachFileDiv').appendChild(div);	
					
					//alert("attachFileDiv 자식 갯수 :"+ fileCount)
					div.appendChild(file);
					div.appendChild(btn);
				}
				
				
			}
		$(document).ready(function() {
	        $("a[name='file-delete']").on("click", function(e) {
	            e.preventDefault();
	            deleteFile($(this));
	        });
	        var imgCount = document.getElementById('file-list').childElementCount;
			var fileCount = document.getElementById('attachFileDiv').childElementCount;
			var lastFile = document.getElementById('attachFileDiv').lastElementChild.id;
			if((imgCount+fileCount) == 2){
				//alert("disabled되야댐")
				document.getElementById(lastFile).firstElementChild.disabled = true;
				return
			}else{
				//alert("disabled안되야함 : "+document.getElementById('attachFileDiv').lastElementChild.id)
				document.getElementById(lastFile).firstElementChild.disabled = false;
				return
			}
	    })
	    function deleteFile(obj) {
	        obj.parent().remove();
	        this.fileDisabled();
	    }
		function fileDisabled(){
			var imgCount = document.getElementById('file-list').childElementCount;
			var fileCount = document.getElementById('attachFileDiv').childElementCount;
			var lastFile = document.getElementById('attachFileDiv').lastElementChild.id;
			if((imgCount+fileCount) == 2){
			    //alert("disabled되야댐")
				document.getElementById(lastFile).firstElementChild.disabled = true;
				return
			}else{
				//alert("disabled안되야함 : "+document.getElementById('attachFileDiv').lastElementChild.id)
				document.getElementById(lastFile).firstElementChild.disabled = false;
				return
			}
		}
      
		
		
		
    	//사이즈 설정
    	$(document).ready(function() {
    	    $('button').click(function() {
    	        var value = $("input[type=radio][name=contact]:checked").val();
    	        if (value) {
    	            alert(value);
    	        }
    	        else {
    	            alert('Nothing is selected');
    	        }
    	    })
    	});
    	
    	
    	
    	
    	