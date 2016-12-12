<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="date"/></th>
        <th><data:i18n key="finance.output"/></th>
        <th><data:i18n key="finance.recommendIncome"/></th>
        <th><data:i18n key="finance.leaderIncome"/></th>
        <th><data:i18n key="finance.transferIn"/></th>
        <th><data:i18n key="finance.repurchase"/></th>
        <th><data:i18n key="finance.transferOut"/></th>
        <th><data:i18n key="finance.transferToActive"/></th>
        <th><data:i18n key="finance.operationFee"/></th>
        <th><data:i18n key="finance.todayIncome"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="total" items="${page.list}">
        <tr>
            <td>${total.createTime}</td>
            <td>${total.output}</td>
            <td>${total.recommendIncome}</td>
            <td>${total.leaderIncome}</td>
            <td>${total.transferIncome}</td>
            <td>${total.repurchase}</td>
            <td>${total.transferOutput}</td>
            <td>${total.transferToActive}</td>
            <td>${total.operationFee}</td>
            <td><fmt:formatNumber
                    value="${total.output+total.recommendIncome+total.leaderIncome +total.transferIncome-total.repurchase-total.transferOutput-total.transferToActive-total.operationFee}"
                    pattern="0.00"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="10"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/finance/queryTotalList"/>
