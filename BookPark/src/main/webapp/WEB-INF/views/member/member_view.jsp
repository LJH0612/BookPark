<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ������ �� ������</title>
<%@ include file="../include/header.jsp" %>
<script>
   $(document).ready(function(){
      $("#btnUpdate").click(function(){
         if(confirm("�����Ͻðڽ��ϱ�?")){
         document.form1.action= "${path}/member/update.do";
         document.form1.submit();
         }
      });
   });
   $(document).ready(function(){
      $("#btnDelete").click(function(){
         if(confirm("�����Ͻðڽ��ϱ�?")){
         document.form1.action= "${path}/member/delete.do";
         document.form1.submit();
         }
      });
   });
</script>
<style>
h1{
margin-top:150px;
text-align:center;
}
.mvc{
margin:auto;
width: 800px;
}
table{
margin: auto;
width: 800px;
}
table tr td{
   border-top: solid 2px;
   height: 50px;
}
#index{
background-color: lightgray;
text-align: center;
}
#btnUpdate, #btnDelete{
    width: 75px;
    height: 40px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="mvc">
<h1>ȸ������ ��</h1>
<form name="form1" method="post">
   <table>
      <tr>
         <td id="index">���̵�</td>
         <td><input name="userId" value="${dto.userId}" readonly="readonly" style="border: none;"></td>
      </tr>
      <tr>
         <td id="index">��й�ȣ</td>
         <td><input type="password" name="userPw" value="${dto.userPw}" ></td>
      </tr>
      <tr>
         <td id="index">�̸�</td>
         <td><input type="text" name="userName" value="${dto.userName}" ></td>
      </tr>
      <tr>
         <td id="index">�̸���</td>
         <td><input type="text" name="userEmail" value="${dto.userEmail}" ></td>
      </tr>
      
      <tr>
         <td colspan="2" style="text-align:right;">
            <input type="button" value="����" id="btnUpdate">
            <input type="button" value="Ż��" id="btnDelete">
            <div style="color: red;">${message}</div>
         </td>
      </tr>
   </table>
</form>
</div>
</body>
</html>