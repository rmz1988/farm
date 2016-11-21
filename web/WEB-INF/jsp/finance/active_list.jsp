<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="userId"/></th>
        <th><data:i18n key="register.name"/></th>
        <th><data:i18n key="finance.activeIncome"/></th>
        <th><data:i18n key="time"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="active" items="${page.list}">
        <tr>
            <td>${active.activatedUserId}</td>
            <td>${active.name}</td>
            <td>${active.income}</td>
            <td><data:date value="${active.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="4"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryActiveList"/>
