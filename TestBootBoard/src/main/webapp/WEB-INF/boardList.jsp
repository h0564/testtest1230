<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<script>
function muldelete() { 
   // form을 넘김.
   var form = document.getElementsByName("muldelForm");
   form[0].submit();
   return true;
}
</script>
 <style>
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:30px;}
  </style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<body>
<form name="muldelForm" action="muldelete">
<table align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgreen">
     <td >선택</td>
     <td >글번호</td>
     <td >작성자</td>              
     <td >제목</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${empty articlesList }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${!empty articlesList}" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
    <tr align="center">
    <td width="5%"> <input type="checkbox" name="chkbox" value="${article.articleNO}">
   <td width="5%">${articleNum.count}</td>
   <td width="10%">${article.id }</td>
   <td align='left'  width="35%">
     <input type='hidden' value="${article.isDelete}">
     <span style="padding-right:30px"></span>
      <c:choose>
         <c:when test='${article.level > 1 }'>  
            <c:forEach begin="1" end="${article.level }" step="1">
                 <span style="padding-left:20px"></span>    
            </c:forEach>
            <span style="font-size:12px;">[답변]</span>
            
            <c:if test="${article.isDelete eq 'Y'}">
                 <strike>${article.title}</strike>
          </c:if>
            <c:if test="${article.isDelete ne 'Y'}">
                <a class='cls1' href="update?articleNO=${article.articleNO}">${article.title}</a>
          </c:if>

         </c:when>
         <c:otherwise>
            <c:if test="${article.isDelete eq 'Y'}">
                 <strike>${article.title}</strike>
          </c:if>
            <c:if test="${article.isDelete ne 'Y'}">
                <a class='cls1' href="update?articleNO=${article.articleNO}">${article.title}</a>
          </c:if>
         </c:otherwise>
       </c:choose>
     </td>
     <td  width="10%"><fmt:formatDate value="${article.writeDate}" /></td> 
   </tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<a  class="cls1"  href="add"><p class="cls2">글쓰기</p></a>
<!-- 그냥 넘길수는 없고 form형태로 넘겨야함. -->
<!-- 한개씩 삭제할때는 ?하고 articleNO=값 하나면 하면 되지만, 여러개일때는 좀 다름 -->
<input type="button" onclick="return muldelete()" class="cls2" value="삭제하기">
</form>
</body>
</html>