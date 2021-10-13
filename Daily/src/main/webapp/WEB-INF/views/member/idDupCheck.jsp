<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 아이디 중복확인</title>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/Check.js"></script>
<script>
function idOK() {
	opener.$('#id').val('${newID}');
	opener.document.getElementById('submit').disabled='';
	opener.document.getElementById('idDup').disabled='disabled';
	
	opener.$('#id').prop('readonly',true);
	opener.$('#pw').focus();
	window.close(); // OK
} //idOK
</script>
<style>
	body {
		font-family: 맑은고딕;
	}
	#wrap {
		margin-left: 0;
		text-align: center;
	}
	h3 {
		color: #00008B; 
	}
</style>
</head>
<body>
<div id="wrap">
  <h2>아이디 중복 확인</h2>
  <form action="idCheck" method="post">
	아이디 :
	<input type="text" id="id" name="id">&nbsp;
	<input type="submit" value="중복확인" onclick="return idCheck()"><br>
	<span id="iMessage" class="eMessage"></span>		
  </form>
  <br><br><hr><br>
  <div id="msgBlock">
  	<c:if test="${idUse=='T'}">
  		${newID}는 사용가능합니다.
  		<input type="button" value="사용하기" onclick="idOK()"> 
  	</c:if>	
  	<c:if test="${idUse=='F'}">
  		${newID} 는 이미 사용중입니다.<br>
  		다시 입력해주세요.
  		<script>
  			$('#id').focus();
  			opener.document.getElementById('id').value='';
  		</script>     
  	</c:if>	
  </div>	
</div>

</body>
</html>