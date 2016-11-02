<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table table-responsive">
    <thead>
    <tr>
        <th>日期</th>
        <th>产币数</th>
        <th>团队所得金币</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="daily" items="${page.list}">
        <tr>
            <td>${daily.createTime}</td>
            <td>${daily.dailyOutput}</td>
            <td>${daily.teamIncome}</td>
        </tr>
    </c:forEach>
    <data:emptyData cols="3"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryDailyList"/>