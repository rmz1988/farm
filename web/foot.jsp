<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<footer>
    开鑫牧场&nbsp;&nbsp;客服QQ：
    <c:choose>
        <c:when test="${empty sessionScope.qq}">${qq}</c:when>
        <c:otherwise>
            ${sessionScope.qq}
        </c:otherwise>
    </c:choose>
</footer>
