<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th>日期</th>
        <th>产币数</th>
        <th>团队奖</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="daily" items="${page.list}">
        <tr>
            <td>${daily.createTime}</td>
            <td>${daily.output}</td>
            <td>${daily.recommendIncome + daily.leaderIncome}</td>
        </tr>
    </c:forEach>
    <data:emptyData cols="3"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryDailyList"/>