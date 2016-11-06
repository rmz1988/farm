<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<div class="title">
    <div class="title-brand">
        开鑫牧场
    </div>
    <ul class="title-area pull-right">
        <li>
            <img class="pull-right" src="${sessionScope.imageUrl}${sessionScope.user.pet.img}" alt="" width="60"
                 height="60"/>
        </li>
        <li>
            <a href="${basePath}/self">
                ${sessionScope.user.userId}
            </a>
        </li>
        <li>
            <span>|</span>
        </li>
        <li>
            <a href="${basePath}/login/logout">退出</a>
        </li>
        <li class="short-hidden"><span>|</span></li>
        <li class="short-hidden">
            <a href="${basePath}/notice">公告</a>
        </li>
        <li class="short-hidden"><span>|</span></li>
        <li class="short-hidden">
            <a href="${basePath}/feedback">反馈</a>
        </li>
    </ul>
</div>