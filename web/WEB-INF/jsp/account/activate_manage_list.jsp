<%--
  激活管理列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="userId"/></th>
        <th><data:i18n key="register.name"/></th>
        <th><data:i18n key="account.petName"/></th>
        <th><data:i18n key="account.buyTime"/></th>
        <th><data:i18n key="status"/></th>
        <th><data:i18n key="account.activeTime"/></th>
        <th><data:i18n key="operation"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="activeApply" items="${page.list}">
        <tr>
            <td>${activeApply.userId}</td>
            <td>${activeApply.name}</td>
            <td>${activeApply.petName}</td>
            <td><data:date value="${activeApply.applyTime}" fmt="yyyy-MM-dd"/></td>
            <td><data:dict dictgroup="activatedApplyStatus" value="${activeApply.status}"/></td>
            <td><data:date value="${activeApply.statusTime}" fmt="yyyy-MM-dd"/></td>
            <td>
                <button type="button" id="${activeApply.applyId}" name="activeBtn" class="btn btn-info btn-sm"
                        <c:if test="${activeApply.status != 0}">disabled </c:if>>
                    <data:i18n key="account.activate"/>
                </button>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="7"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/account/queryActivateApplyList"
           params="userId=${userId}&status=${status}"/>