<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="finance.output"/></th>
        <th><data:i18n key="finance.recommendIncome"/></th>
        <th><data:i18n key="finance.leaderIncome"/></th>
        <th><data:i18n key="finance.activeIncome"/></th>
        <th><data:i18n key="finance.transferIn"/></th>
        <th><data:i18n key="finance.repurchase"/></th>
        <th><data:i18n key="finance.transferOut"/></th>
        <th><data:i18n key="finance.transferToActive"/></th>
        <th><data:i18n key="finance.withdraw"/></th>
        <th><data:i18n key="finance.operationFee"/></th>
        <th><data:i18n key="finance.todayIncome"/></th>
        <th><data:i18n key="finance.totalIncome"/></th>
        <th><data:i18n key="date"/></th>
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
