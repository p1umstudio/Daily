<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 개인정보확인/수정</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/member.js"></script>
</head>
<body>
    <table>
        <tr height="40">
            <td>아이디</td>
            <td>${loginInfo.id}</td>
        </tr>
        <tr height="40">
            <td>이름</td>
            <td>${loginInfo.name}</td>
        </tr>
        <tr height="40">
            <td>연락 가능 번호</td>
            <td>${loginInfo.phone}</td>
        </tr>
        <tr height="40">
            <td>배송지</td>
            <td>${loginInfo.address}</td>
        </tr>
        <tr height="40">
            <td>보유 머니</td>
            <td>${loginInfo.money}</td>
        </tr>
        <tr height="40">
            <td>보유 포인트</td>
            <td>${loginInfo.point}</td>
        </tr>
    </table>
    <div id="menu">
        <input type="button" value="개인정보 변경" class="btn" id='info_change_page'><br>
    </div>
</body>
</html>