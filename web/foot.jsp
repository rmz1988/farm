<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<footer>
    <data:i18n key="kxmc"/>&nbsp;&nbsp;<data:i18n key="foot.custom"/>QQ：
    <c:choose>
        <c:when test="${empty sessionScope.qq}">${qq}</c:when>
        <c:otherwise>
            ${sessionScope.qq}
        </c:otherwise>
    </c:choose>
</footer>
