<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="../include/header.jsp" %>
<style>
h1{
margin-top:120px;
}
</style>
<script>
   $(document).ready(function(){
      $("#btnWrite").click(function(){
         // 페이지 주소 변경(이동)
         location.href = "${path}/board/write.do";
      });
   });
   // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
   function list(page){
      location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
   }
</script>
<style>
.bc{
    margin: auto;
    width: 1000px;
    height: 1000px
}
.bc h1{
   font-size: 2em;
    padding-top: 30px;
}
.form1{
    float: right;
}
#searchOption{
   width: 150px;
    display: inline-block;
    -webkit-appearance: menulist;
     border: solid 1px;
}
table tr td{
border-bottom: solid 2px;
padding: 8px;
}
#btnWrite{
    float: right;
    margin-top: -30px;
    width: 75px;
   height: 40px;
   color: black;
   font-size: large;
}
#sc{
width: 75px;
height: 40px;
color: black;
font-size: large;
}
table tr th{   
   padding: 10px;
    font-size: 1.2em;
    font-weight: bold;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="main-wrapper">
<div class="bc" >
   <h1>게시글 목록</h1>
   <form name="form1" class="form1" method="post" action="${path}/board/list.do">
      <select name="searchOption" id="searchOption">
         <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
         <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
         <option value="m.userName" <c:out value="${map.searchOption == 'm.userName'?'selected':''}"/> >이름</option>
         <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
         <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
      </select>
      <input name="keyword" value="${map.keyword}">
      <input type="submit" value="조회" id="sc">
   
   </form>
   <!-- 레코드의 갯수를 출력 -->
   <p style="font-size: 1.2em; font-weight: bold;">
   ${map.count}개의 게시물이 있습니다.</p>
   <table id="bordert" style=" border-top: solid; margin: 40px 0; width:100%; ">
      <tr style="background-color: gainsboro; text-align: left;"> 
         <th>번호</th>
         <th>제목</th>
         <th>이름</th>
         <th>작성일</th>
         <th>조회수</th>
      </tr>
   
   <c:forEach var="row" items="${map.list}">
      <c:choose>
         <c:when test="${row.show == 'y'}">
      <!-- show 컬럼이 y일때(삭제X 글) -->
      <tr>
         <td>${row.bno}</td>
         <!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
         <td>
            <a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} 
               <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
               <c:if test="${row.recnt > 0}">
                  <span style="color: red;">(${row.recnt})
                  </span>
               </c:if>
            </a>
         </td>
         <td>${row.userName}</td>
         <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
         </td>
         <td>${row.viewcnt}</td>
      </tr>
         </c:when>
         <c:otherwise>
      <!-- show 컬럼이 n일때(삭제된 글) -->
      <tr>
         <td colspan="5" align="left">
            <c:if test="${row.recnt > 0}">
               <a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">삭제된 게시물입니다.
               <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                  <span style="color: red;">(${row.recnt})
                  </span>
               </a>
            </c:if>
            <c:if test="${row.recnt == 0 }">
               삭제된 게시물입니다.
            </c:if>   
         </td>
      </tr>
         </c:otherwise>
      </c:choose>
   </c:forEach>
      
      <!-- 페이징 -->
      <tr style="border-bottom: hidden; text-align: center;">
         <td colspan="5">
            <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
            <c:if test="${map.boardPager.curBlock > 1}">
               <a href="javascript:list('1')">[처음]</a>
            </c:if>
            
            <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
            <c:if test="${map.boardPager.curBlock > 1}">
               <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
            </c:if>
            
            <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
            <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
               <!-- 현재페이지이면 하이퍼링크 제거 -->
               <c:choose>
                  <c:when test="${num == map.boardPager.curPage}">
                     <span style="color: red">${num}</span>&nbsp;
                  </c:when>
                  <c:otherwise>
                     <a href="javascript:list('${num}')">${num}</a>&nbsp;
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            
            <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
            <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
               <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
            </c:if>
            
            <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
            <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
               <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
            </c:if>
         </td>
      </tr>
      <!-- 페이징 -->
</table>
<!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
   <c:if test="${sessionScope.userId != null}">
      <button type="button" id="btnWrite">글쓰기</button>
   </c:if>
</div>
</div>
</body>
</html>