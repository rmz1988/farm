<%--

  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>

<table class="table">
    <thead>
    <tr>
        <th>标题</th>
        <th>发布时间</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="feedback" items="${page.list}">
        <tr>
            <td><a href="${basePath}/feedback/detail?feedbackId=${feedback.feedbackId}">${feedback.title}</a></td>
            <td>
                <data:date value="${feedback.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <data:dict dictgroup="feedbackStatus" value="${feedback.status}"/>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="3"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/feedback/queryFeedbackList"/>

