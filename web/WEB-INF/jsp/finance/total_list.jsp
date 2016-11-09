<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th>产币量</th>
        <th>推荐奖</th>
        <th>领导奖</th>
        <th>激活奖</th>
        <th>金币转入</th>
        <th>复购</th>
        <th>奖励币转出</th>
        <th>奖励币转激活币</th>
        <th>提现</th>
        <th>系统维护费</th>
        <th>今日收益</th>
        <th>累计收益</th>
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
            <td>${total.transferToActive}</td>
            <td>${total.withdrawOutput}</td>
            <td>${total.operationFee}</td>
            <td><fmt:formatNumber
                    value="${total.output+total.recommendIncome+total.leaderIncome + total.activeIncome+total.transferIncome-total.repurchase-total.transferOutput-total.transferToActive-total.withdrawOutput-total.operationFee}"
                    pattern="0.00"/></td>
            <td>${total.currentTotal}</td>
            <td>${total.createTime}</td>
        </tr>
    </c:forEach>
    <data:emptyData cols="11"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryTotalList"/>
