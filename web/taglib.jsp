<%--
  
  User: rmz19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${basePath}/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.placeholder.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('input,textarea').placeholder();
    });
</script>
