/*
	1.$('#title').val().replace(/\s/gi,"").length == 0;
	2.$('#title').val().trim() 
*/

$(function(){
	
	$('#TCinCheck').submit(function(e){

		if($('#title').val().trim() == ""){
			alert('제목을 입력하여 주십시오.');
			e.preventDefault();
			$('#tilte').focus();
			return;
		}
		
		if($('#content').val().trim() == ""){
			alert('내용을 입력하여 주십시오.');
			e.preventDefault();
			$('#content').focus();
			return;
		}
		
		alert('입력하신 QnA 가 등록되었습니다.');
	})
	
})//ready 
