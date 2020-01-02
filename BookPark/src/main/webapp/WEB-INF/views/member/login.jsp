<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if(userId == ""){
				alert("아이디를 입력하세요.");
				$("#userId").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(userPw == ""){
				alert("아이디를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${path}/member/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
</script>
<style type="text/css">
body{
         font-family: "맑은 고딕";
         font-size: 1em;
         color: #333;
}

h1{
text-align:center;
margin-top:110px;
}

#login-form{
         width:300px;
         margin:auto;      
         padding: 15px;
         border:1px solid gray;
         border-raider:15px;
}


/* inline이였던 요소들을 block으로 바꿈 */
#login-form input, #login-form label{
         display:block;
}

#login-form label{
         margin-top: 10px;
}

#login-form input{
         margin-top: 5px;
}

/* 애트리뷰트 선택자 */
#login-form input[type='image']{
         margin: 10px auto;
}
#btnLogin{



}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h1>로그인</h1>
	<form id="login-form" name="form1" method="post">
		<table>
			<tr>
				<td><label class="legend">아이디</label></td>
				<td><input name="userId" id="userId"></td>
			</tr>
			<tr>
				<td><label class="legend">비밀번호</label></td>
				<td><input type="password" name="userPw" id="userPw"></td>
			</tr>
			<tr>						
				<td colspan="1" align="center">
					<button type="button" id="btnLogin">로그인</button>
				<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>