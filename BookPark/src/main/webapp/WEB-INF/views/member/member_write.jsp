<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
 	function check(){
 		if(form1.userId.value=="")
 		{	
 			alert("아이디를 입력하지 않았습니다");
 			form1.userId.focus();
 			return(false);
 		}
 		if(form1.userPw.value=="")
 		{	
 			alert("비밀번호를 입력하지 않았습니다");
 			form1.userPw.focus();
 			return(false);
 		}
 		if(form1.passc.value != form1.userPw.value)
 		{	
 			alert("비밀번호가 일치하지 않습니다");
 			form1.passc.focus();
 			return(false);
 		}
 		if(form1.userName.value=="")
 		{	
 			alert("이름을 입력하지 않았습니다");
 			form1.userName.focus();
 			return(false);
 		}
 	}
 	

</script>
</head>
<style>

#form{
width:200px;

         margin:100px auto;
         margin-top:50px;

         border: 1px solid gray;

         border-radius: 5px;

         padding: 15px;
}
h4{
text-align:center;
font-size:25px;
margin-top:160px;
}

</style>
<body>
<%@ include file="../include/menu.jsp" %>
<td>
<h4>회원정보입력</h4>
<form name="form1" id="form" method="post" action="${path}/member/insert.do" >
<label>아이디:</label>
<input type="text" name="userId" id="userId">
</td>
<br>
<td>
<label>비밀번호:</label>
<input type="password" name="userPw" id="userPw">
</td>
<br>
<td>
<label>비밀번호확인:</label>
<input type="password" name="passc" id="passc">
</td>
<br>
<td>
<label>이름:</label>
<input type="text" name="userName" id="userName">
</td>
<br>
<td>
<label>이메일:</label>
<input type="text" name="userEmail" id="userEmail">
</td>
<br>
<td colspan="2">
<input type="submit" value="가입">
<input type="reset" value="취소">
</td>
</form>

</body>
</html>