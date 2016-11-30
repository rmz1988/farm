<%--
  用户列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>

<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="userId"/></th>
        <th><data:i18n key="purchase.balance"/></th>
        <th><data:i18n key="operation"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${page.list}">
        <tr>
            <td>${user.userId}</td>
            <td>${user.money}</td>
            <td>
                <button name="purchaseBtn" class="btn btn-info btn-sm" type="button" id="${user.userId}">
                    <data:i18n key="purchase.purchase"/>
                </button>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="3"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/account/queryRepurchaseList" params="userId=${userId}"/>