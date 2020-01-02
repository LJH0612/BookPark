<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>*BookPark에 오신걸 환영합니다^^*</title>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
    

<%@ include file="include/header.jsp" %>
<style>
.trend{
width: 980px;
height: 1080px;
overflow: hidden;
margin-left:160px;
border: 1px solid;
float:left;

}
.trendherd{
display: flex;
 flex-basis: 100%;
 align-items: center;
 color: rgba(0, 0, 0, 0.35);
 font-size: 12px;
 margin: 8px 0px;
}
.k{
float:left;
height:300px;
padding-left:50px;
padding-right:50px;
text-align:center;

}
.k1{
float:left;
height:300px;
padding-left:57px;
padding-right:50px;
text-align:center;
}

.k2{
float:left;
height:300px;
padding-left:57px;
padding-right:50px;
text-align:center;
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
 

 
.all{
margin-top:78px;
width:100%;
height:350px;
display:inline-block;
background:#F7F7F7;
}
.in{
position:relative;
float:left;
margin-top:140px;

}
    .slider {
        width:800px;
        height:350px; 
        overflow:hidden;
        position:relative;
        float:left;
        z-index:1;
        margin-left:160px;
    }

    .slider img {
        width: 100%;
        height: 100%;
    }
    .slick-prev { position:absolute; z-index:999; top:50%; left:5%; border:0; padding:10px; background: #000; color:#fff; box-shadow:0 0 10px rgba(255,255,255,0.8);}
    .slick-next { position:absolute; z-index:999; top:50%; right:5%; border:0; padding:10px; background: #000; color:#fff; box-shadow:0 0 10px rgba(255,255,255,0.8)}

.content{
width:300px;
height:350px;
background:	#000000;
position:absolute;
opacity:0.7;
float:right;
display:inline;
}
.content p{
font-size:12px;
color:white;
padding-left:10px;
}


.content h1{
padding-left:10px;
font-size:15px;
color:#FFF29C;
border-top:1px solid gray;
border-bottom:1px solid gray;
}

.footer{
	background:#F7F7F7;
	overflow: hidden;
    position:relative;
    bottom:0;
    height:150px; width:100%; text-align: center;
    margin-left:0px; margin-bottom:-1px;

}
.footer h1{
font-size:16px;
color:gray;
}

</style>
<link href="${path}/css/slick.css" rel="stylesheet">
<script src="${path}/js/slick.js"></script>
<script src="${path}/js/jquery.easing.js"></script> 
</head>
<body>
<%@ include file="include/menu.jsp" %>
<div class="leftRollBanWrap">
<img src="${path}/images/LR1.jpg"  width="220px" height="250px" />
</div>
<div class="leftRollBanWrap2">
<img src="${path}/images/LR2.jpg"  width="200px" height="250px" />
</div>
<div class="leftRollBanWrap3">
<img src="${path}/images/LR3.jpg"  width="200px" height="600px" />
</div>


	<c:if test="${result == null}">
		<div class="all">
	<div class="in">
	<a href="http://book.interpark.com/bookPark/html/book.html"><img src="${path}/images/oh1.png" alt="img" title="인터파크로 이동" style="width:300px; height:220px;"></a>
	</div>
    <div class="slider single-item">
        <img src="${path}/images/b1.jpg" alt="img" style="width:600px; height:350px;">
        <img src="${path}/images/b2.jpg" alt="img" style="width:600px; height:350px;">
        <img src="${path}/images/b3.jpg" alt="img" style="width:600px; height:350px;">
        <img src="${path}/images/b4.jpg" alt="img" style="width:600px; height:350px;">
         </div>
	    <div class="content">
	    <h1>이달의 베스트 셀러</h1>
	    <p>1 흔한남매1</p>
	    <p>2 여행의 이유</p>
	    <p>3 15초면 충분해 틱톡!</p>
	    <p>4 죽음2</p>
	    <p>5 죽음1</p>
	    <p>6 50대 사건으로 보는 돈의 역사</p>
	    <p>7 공부머리 독서법</p>
	    <p>8 이게 경제다</p>
	    <p>9 쳔년의 질문</p>
	    <h1>추천</h1>
	    </div>
   
   
 <div class="trend">
    <div class="trendherd">
        <h2>BookPark추천</h2>       
    </div>
    <div class="k">
    <a href="${path}/shop/product/detail/5">
   <img src="${path}/images/book1.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>죽고싶지만 떡볶이는 먹고싶어</p>
   </a>
   </div>
   <div class="k">
   <img src="${path}/images/book2.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>우아한 거짓말</p>
   </div>
   <div class="k">
   <img src="${path}/images/book4.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>개를 훔치는 완벽한 방법</p>
   </div>
   <br>
   <div class="k1">
   <img src="${path}/images/book3.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>우리들의 행복한 시간</p>
   </div>
   <div class="k1">
   <img src="${path}/images/book5.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>두근두근 내인생</p>
   </div>
   <div class="k1">
   <img src="${path}/images/book6.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>루머의루머의 루머</p>
   </div>
   <br>
   <div class="k2">
   <img src="${path}/images/book7.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>쌍둥이별</p>
   </div>
   <div class="k2">
   <img src="${path}/images/book8.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>세상에서 가장 아름다운 이별</p>
   </div>
   <div class="k2">
   <img src="${path}/images/book9.jpg" alt="img" style="width:200px; height:250px;"/>
   <p>노인과 바다</p>
   </div>
   </div> 
<script>
    $('.single-item').slick({
      autoplay:true,
      autoplaySpeed:5000,	
      fade:true,
      cssEase:"ease",
      easing:"ease",
    });
</script>
	</c:if>
	
	${result}
	
	<div class="footer">
<h1>회사소개 | 이용약관 | 개인정보 취급방침 | 제휴,광고</h1>
<p>
      대표자 : 이중화 | 이메일 : gmlwn@naver.com<br>
      고객상담 : 031-222-444 | 상담시간 : 10~18시(점심시간 : 13:00~14:00) <br>
      주소 : 경기도 안성시 공도읍 만정리 <br>
</P>
</div>
	
	
</body>
</html>
