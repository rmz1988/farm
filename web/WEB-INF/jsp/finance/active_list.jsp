<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th>玩家编号</th>
        <th>姓名</th>
        <th>激活奖励</th>
        <th>时间</th>
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
