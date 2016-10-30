<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table table-responsive">
    <thead>
    <tr>
        <th>操作类型</th>
        <th>转入编号</th>
        <th>转出编号</th>
        <th>金额</th>
        <th>操作日期</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="transfer" items="${page.list}">
        <tr>
            <td><data:dict dictgroup="transferType" value="${transfer.type}"/></td>
            <td>${transfer.inUserId}</td>
            <td>${transfer.outUserId}</td>
            <td>${transfer.money}</td>
            <td><data:date fmt="yyyy-MM-dd HH:mm:ss" value="${transfer.createTime}"/></td>
            <td><data:dict dictgroup="transferStatus" value="${transfer.status}"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/trade/queryTransferList"/>