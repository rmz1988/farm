<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table table-responsive">
    <thead>
    <tr>
        <th>产币量</th>
        <th>推荐奖励</th>
        <th>领导奖</th>
        <th>激活奖</th>
        <th>金币转入</th>
        <th>复购支出</th>
        <th>金币转出</th>
        <th>提现</th>
        <th>系统维护费</th>
        <th>当前余额</th>
        <th>日期</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="total" items="${page.list}">
        <tr>
            <td>${total.output}</td>
            <td>${total.recommendIncome}</td>
            <td>${total.leaderIncome}</td>
            <td>${total.activeIncome}</td>
            <td>${total.transferIncome}</td>
            <td>${total.repurchase}</td>
            <td>${total.transferOutput}</td>
            <td>${total.withdrawOutput}</td>
            <td>${total.operationFee}</td>
            <td>${total.currentTotal}</td>
            <td>${total.createTime}</td>
        </tr>
    </c:forEach>
    <data:emptyData cols="11"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryTotalList"/>
