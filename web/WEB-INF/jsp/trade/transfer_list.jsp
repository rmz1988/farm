<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="transfer.type"/></th>
        <th><data:i18n key="transfer.inId"/></th>
        <th><data:i18n key="transfer.outId"/></th>
        <th><data:i18n key="amount"/></th>
        <th><data:i18n key="withdraw.actualAmount"/></th>
        <th><data:i18n key="withdraw.fees"/></th>
        <th><data:i18n key="transfer.date"/></th>
        <th><data:i18n key="status"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="transfer" items="${page.list}">
        <tr>
            <td><data:dict dictgroup="transferType" value="${transfer.type}"/></td>
            <td>${transfer.inUserId}</td>
            <td>${transfer.outUserId}</td>
            <td>${transfer.money}</td>
            <td>${transfer.realMoney}</td>
            <td>${transfer.fee}</td>
            <td><data:date fmt="yyyy-MM-dd HH:mm:ss" value="${transfer.createTime}"/></td>
            <td><data:dict dictgroup="transferStatus" value="${transfer.status}"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/trade/queryTransferList"/>