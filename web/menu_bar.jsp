<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<nav class="navbar navbar-default" role="banner">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#farmMenu" style="color:#fff;">
                <span class="sr-only"><data:i18n key="menu"/></span>
                <%--<span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>--%>
                <data:i18n key="menu.more"/>
            </button>
            <a class="navbar-title navbar-brand" href="${basePath}/"><data:i18n key="kxmc"/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="farmMenu" role="navigation">
            <ul class="nav navbar-nav">
                <li <c:if test="${current == 'index'}">class="active"</c:if>>
                    <a href="${basePath}/"><data:i18n key="home"/></a>
                </li>
                <li <c:if test="${current == 'pet'}">class="active"</c:if>><a href="${basePath}/pet"><data:i18n
                        key="menu.pastureMgmt"/></a></li>
                <li class="dropdown <c:if test="${current == 'account'}">active</c:if>">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <data:i18n key="menu.accountMgmt"/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}/account/recommend"><data:i18n key="menu.recommendList"/></a></li>
                        <li><a href="${basePath}/account/apply"><data:i18n key="menu.applyActivate"/></a></li>
                        <li><a href="${basePath}/account/activate"><data:i18n key="menu.activateMgmt"/></a></li>
                    </ul>
                </li>
                <li class="dropdown <c:if test="${current == 'finance'}">active</c:if>">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <data:i18n key="menu.financeMgmt"/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}/finance/active"><data:i18n key="menu.activateIncome"/></a></li>
                        <%--<li><a href="${basePath}/finance/daily">每日收入列表</a></li>--%>
                        <li><a href="${basePath}/finance/recommend"><data:i18n key="menu.recommendIncome"/></a></li>
                        <li><a href="${basePath}/finance/total"><data:i18n key="menu.totalIncome"/></a></li>
                    </ul>
                </li>
                <li class="dropdown <c:if test="${current == 'trade'}">active</c:if>">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <data:i18n key="menu.tradeMgmt"/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}/trade/transfer"><data:i18n key="menu.transfer"/></a></li>
                        <li><a href="${basePath}/trade/withdraw"><data:i18n key="menu.withdraw"/></a></li>
                        <li><a href="${basePath}/trade/activate/transfer"><data:i18n key="menu.transferToActive"/></a>
                        </li>
                    </ul>
                </li>
                <li <c:if test="${current == 'shop'}">class="active"</c:if>><a href="${basePath}/shop"><data:i18n
                        key="menu.shop"/></a></li>
                <li <c:if test="${current == 'person'}">class="active"</c:if>><a href="${basePath}/self"><data:i18n
                        key="menu.personalInfo"/></a></li>
                <li class="short-show"><a href="${basePath}/notice"><data:i18n key="menu.notice"/></a></li>
                <li class="short-show"><a href="${basePath}/feedback"><data:i18n key="menu.feedback"/></a></li>
            </ul>
        </div>
    </div>
</nav>
