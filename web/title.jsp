<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<div class="title">
    <ul class="title-area pull-right">
        <li>
            <img class="pull-right" src="${sessionScope.imageUrl}${pet.img}" alt="" width="60" height="60"/>
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
        <li><span>|</span></li>
        <li>
            <a href="#">公告</a>
        </li>
        <li><span>|</span></li>
        <li>
            <a href="#">反馈</a>
        </li>
    </ul>
</div>