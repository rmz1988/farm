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
        <th>奖励金币</th>
        <th>时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="recommend" items="${page.list}">
        <tr>
            <td>${recommend.recommendUserId}</td>
            <td>${recommend.name}</td>
            <td>${recommend.income}</td>
            <td><data:date value="${recommend.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="4"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryTotalList"/>