<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookPark</title>
<script type="text/javascript">
 function keyword_check(){
  if(document.search.keyword.value==''){ //검색어가 없을 경우  
  alert('검색어를 입력하세요'); //경고창 띄움 
  document.search.keyword.focus(); //다시 검색창으로 돌아감 
  return false; 
  }
  else return true;
 }
</script>
<style>
ul{
margin-left:auto;
text-align:center;}
ul li{
float:left;
width:80px;
height:40px;
line-height:40px;
font-size:12px;
}
ul li ul li{
margin-top:0px;
position:static;
z-index:1;
display:none;
background-color:black;
opacity:0.5;
margin-left:-50px;
}
ul li:hover ul li{
	display: block;
}
ul li a: hover{
	background-color:white;
}
.s{
height:100px;
backgroud:white;
display:block;
}
.s img{
padding-left:100px;
}

.H {
float:right;
display:inline-block;
font-size:12px;
font-family:'굴림';
font-weight:bold;
}
a{
text-decoration:none;
color:black;
}
h2{
margin-top:20px;
color:black;
float:left;
font-size:20px;
}
h3{
margin-top:200px;
color:black;
float:left;
font-size:20px;
}
.F{
height:75px;
background:white;
border-style:outset;
display:block;
margin-bottom:-10px;
}

#mem{
text-align:"right";
}
/*common*/
.clearfix{content:''; display:block; clear:both;}

/*header*/
.menu{
display:inline-block;
background-color:black;
width:100%;
height:70px;
margin-top:32px;
position:absolute;
text-align:center;
}
.menu li{margin-right:20px;margin-left:250px;}
.menu a{color:white; font-size:15px; display:block;}
</style>
</head>
<body>
<header class='s'>
<a href="${path }"><img src="${path}/images/LG2.jpg" width="180px" height="95px";/></a>
<div class='H'>
<c:set var="id" value="${id}" >
</c:set>
<!-- 관리자 권한일 경우 -->
<c:choose>
	<c:when test="${sessionScope.userId == null}">
		<a href="${path}/member/login.do">로그인</a> &nbsp; | &nbsp;
		<a href="${path}/member/write.do">회원가입</a>
		<a href="${path}/admin/login.do"><img src="${path}/images/manager.jpg" width="20px" height="15px";/></a>
	</c:when>
	<c:otherwise>
		${sessionScope.userName}님 환영합니다.&nbsp; | &nbsp;
		<a href="${path}/member/logout.do">로그아웃</a> 
	</c:otherwise>
</c:choose>	

</div>
<form name="search" align="center" style="margin-right:70px;margin-top:-70px;" method = "post"  action ="${path}/shop/product/serch.do" onsubmit="return keyword_check()">
<!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , method : 전달 방식 ,  action : submit 시 이동 경로 ,onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->
<td>
  <input type="text" name="keyword" size="50" value="${keyword}" style="border-bottom: 1px solid black; border-right:0px; border-left:0px;border-top:0px" onfocus="this.value=''"; > 
  </td>
<td>
<input type="image" src="${path}/images/do.jpg" width="35px" height="30px"value="search" class="search">
</td>  
</form>

<div class="menu">
<ul>
<li><a href="${path}/shop/product/list.do">도서목록</a>
	<ul style="margin-left:-290px;">
		<li><a href="${path}/shop/product/list/0">전체보기</a></li>
		<li><a href="${path}/shop/product/list/100">판타지</a></li>
		<li><a href="${path}/shop/product/list/200">인문학</a></li>
		<li><a href="${path}/shop/product/list/300">여행</a></li>
	</ul>
</li>
<li><a href="${path}/shop/cart/list.do">장바구니</a> </li>
<li><a href="${path}/board/list.do">게시판</a></li>
<c:choose>
	<c:when test="${sessionScope.userId != null && sessionScope.userId != 'admin'}">
		<li><a href="${path}/member/view.do?userId=${userId}">마이페이지</a></li>
	</c:when>
</c:choose>
<c:if test="${sessionScope.adminId != null }">
<li><a href="${path}/shop/product/write.do">상품등록</a></li>
</c:if>
</ul>
</div>
</header>
</body>
</html>





