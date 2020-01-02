<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 리스트</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnAdd").click(function(){
			location.href="${path}/shop/product/write.do";
		});
		$("#btnEdit").click(function(){
			location.href="${path}/shop/product/edit.do";
		});
	});
</script>
<style>
img{
margin-left:20px;
margin-top:20px;
}
.p{
margin-left:30px;
float:left;
padding-left:30px;
padding-right:30px;
text-align:center;
display:inline-block;
}

.trend{
margin-top:100px;
width: 980px;
overflow: hidden;
margin-left:400px;
border: 1px solid;
float:left;
display:grid;
}
.trendherd{
 display:flex;
 flex-basis: 100%;
 align-items: center;
 color: rgba(0, 0, 0, 0.35);
 font-size: 12px;
 margin: 8px 0px;
}
.trendherd::before,
.trendherd::after {
 content: "";
 flex-grow: 1;
 background: rgba(0, 0, 0, 0.35);
 height: 1px;
 font-size: 0px;
 line-height: 0px;
 margin: 0px 16px;
 }
 
.leftRollBanWrap {
    position: absolute;
    left: 195px;
    top: 600px;
    width: 90px;
    background-color: #fff;
    margin: 0 0 0 -1px;
}
 
.leftRollBanWrap2 {
    position: absolute;
    left: 222px;
    top: 900px;
    width: 90px;
    background-color: #fff;
    margin: 0 0 0 -1px;
}

.leftRollBanWrap3 {
    position: absolute;
    top: 600px;
    width: 90px;
	right:150px;
    background-color: #fff;
    margin: 0 0 0 -1px;
}

</style>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
	<div class="trend">
	<div class="pantagi">
	<c:set var="doneLoop" value="false"/>
	<c:forEach var="low" items="${list}">
		<c:if test="${not doneLoop}">
			<c:if test="${low.productKind == '판타지'}">
		    <div class="trendherd">
		        <h2>판타지</h2>      
		    </div>
		    <c:set var="doneLoop" value="true"/>
		    </c:if>
	    </c:if>
    </c:forEach>
    
    <c:forEach var="row" items="${list}">
    <c:if test="${row.productKind == '판타지'}">
   		<div class="p">
		<a href="${path}/shop/product/detail/${row.productId}">
					<img src="${path}/images/${row.productUrl}" width="200px" height="250px">
				</a>
			<br>
				<p>제목 :<a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a></p>
			
				<p>가격 :<fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/></p>
			</div>	
			 </c:if>	
		</c:forEach>
	</div>
<div class="inmunhak">
	<c:set var="doneLoop" value="false"/>
		<c:forEach var="low" items="${list}">
			<c:if test="${not doneLoop}">
				<c:if test="${low.productKind == '인문학'}">
			    <div class="trendherd">
			        <h2>인문학</h2>      
			    </div>
			    <c:set var="doneLoop" value="true"/>
			    </c:if>
		    </c:if>
	</c:forEach>
	<c:forEach var="row" items="${list}">
	    <c:if test="${row.productKind == '인문학'}">
	   		<div class="p">
			<a href="${path}/shop/product/detail/${row.productId}">
						<img src="${path}/images/${row.productUrl}" width="200px" height="250px">
					</a>
				<br>
					<p>제목 :<a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a></p>
				
					<p>가격 :<fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/></p>
			</div>	
		</c:if>	
	</c:forEach>
</div>
		
<div class="trip">
<c:set var="doneLoop" value="false"/>
	<c:forEach var="low" items="${list}">
		<c:if test="${not doneLoop}">
			<c:if test="${low.productKind == '여행'}">
		    <div class="trendherd">
		        <h2>여행</h2>      
		    </div>
		    <c:set var="doneLoop" value="true"/>
		    </c:if>
	    </c:if>
    </c:forEach>
    
<c:forEach var="row" items="${list}">
    <c:if test="${row.productKind == '여행'}">
   		<div class="p">
		<a href="${path}/shop/product/detail/${row.productId}">
					<img src="${path}/images/${row.productUrl}" width="200px" height="250px">
				</a>
			<br>
				<p>제목 :<a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a></p>
			
				<p>가격 :<fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/></p>
			</div>	
			 </c:if>	
		</c:forEach>	
		</div>
</div>
</body>
</html>