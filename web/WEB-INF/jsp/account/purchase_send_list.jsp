<%--
  发出的收购申请
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th>被收购人</th>
        <th>收购金额</th>
        <th>状态</th>
        <th>申请时间</th>
        <th>对方处理时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="apply" items="${page.list}">
        <tr>
            <td>${apply.oppositeUserId}</td>
            <td>${apply.money}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="sendContent" url="${basePath}/account/queryPurchaseSendList"/>