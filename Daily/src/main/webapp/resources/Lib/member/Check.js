function idCheck(){
	var id=$('#id').val();
	if (id.length<4 || id.length>9) {
		$('#idMessage').html('4~8글자로 입력해주세요.');
		return false;
	}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
		$('#idMessage').html('영문, 숫자로 입력해주세요.');
		return false;
	}else {
		$('#idMessage').html('');
		return true;
	}
} //idCheck

function pwCheck(){
	var password=$('#pw').val();
	if (password.length<4) {
		$('#pwMessage').html('4글자 이상이여야 합니다.');
		return false;
	/*}else if (password.replace(/[!-*]/gi,'').length >= password.length ) {
		$('#pMessage').html('비밀번호는 특수문자가 반드시 1개 이상 포함되어야 합니다.');
		return false;*/
	}else if (password.replace(/[a-z.0-9.!-*]/gi,'').length > 0) {
		$('#pwMessage').html('영문자, 숫자, 특수문자로 입력해야합니다');
		return false;
	}else {
		$('#pwMessage').html('');
		return true;
	}
} //pwCheck

//  password 재입력 동일성 확인
function pw2Check(){
	var password=$('#pw').val();
	var password2=$('#pw2').val();
	if (password != password2) {
		$('#pw2Message').html('비밀번호가 다릅니다. 다시입력해주세요');
		$('#pw').focus();
		return false;
	}else {
		$('#pw2Message').html('');
		return true;
	}
}

function nameCheck() {
	var name=$("#name").val();
	if(name.replace(/[가-힇]/gi,'').length > 0 ){ //다음 확인
	   	$('#nameMessage').html('한글로 입력해주세요.');	
	    return false;
	}else {
	 	$('#nameMessage').html('');
	   	return true;
	}
} //nmCheck

function phoneCheck() {
	var phone=$("#phone").val();
	if(phone.length != 11){
		$('#phoneMessage').html('다시 입력해주세요 ex) 01012345678');
	    return false;
	}else if (phone.replace(/[0-9]/gi,'').length > 0) {
		$('#phoneMessage').html('숫자만 입력해주세요.');
		return false;
	}else {
	 	$('#phoneMessage').html('');
	   	return true;
	}
} //phCheck 
