<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>

<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="index.title"/></th>
        <th><data:i18n key="index.releaseTime"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="notice" items="${page.list}">
        <tr>
            <td><a href="${basePath}/notice/detail?noticeId=${notice.noticeId}">${notice.title}</a></td>
            <td><data:date fmt="yyyy-MM-dd HH:mm:ss" value="${notice.createTime}"/></td>
        </tr>
    </c:forEach>
    <data:emptyData cols="2"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/notice/queryNoticeList"/>

