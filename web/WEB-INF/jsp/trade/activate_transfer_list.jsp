<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="transferActive.transferTime"/></th>
        <th><data:i18n key="transferActive.transferAmount"/></th>
        <th><data:i18n key="transferActive.activeMoneyBalance"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="transfer" items="${page.list}">
        <tr>
            <td>
                <data:date value="${transfer.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>${transfer.transferMoney}</td>
            <td>${transfer.activeMoney}</td>
        </tr>
    </c:forEach>
    <data:emptyData cols="3"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/trade/queryTransferToActiveList"/>
