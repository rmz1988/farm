<%--
  激活管理列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table table-responsive">
    <thead>
    <tr>
        <th>玩家编号</th>
        <th>姓名</th>
        <th>宠物名称</th>
        <th>购买日期</th>
        <th>状态</th>
        <th>激活日期</th>
        <th>操作</th>
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
                <button id="${activeApply.applyId}" name="activeBtn" class="btn btn-info btn-sm">激 活</button>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="7"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/account/queryActivateApplyList"
           params="userId=${userId}&status=${status}"/>