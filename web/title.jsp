<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<div class="title">
    <div class="title-brand">
        <data:i18n key="kxmc"/>
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
            <a href="${basePath}/login/logout"><data:i18n key="logout"/></a>
        </li>
        <li class="short-hidden"><span>|</span></li>
        <li class="short-hidden">
            <a href="${basePath}/notice"><data:i18n key="menu.notice"/></a>
        </li>
        <li class="short-hidden"><span>|</span></li>
        <li class="short-hidden">
            <a href="${basePath}/feedback"><data:i18n key="menu.feedback"/></a>
        </li>
    </ul>
</div>