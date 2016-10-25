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
                    data-target="#farmMenu">
                <span class="sr-only">菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="farmMenu" role="navigation">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${basePath}/">首页</a>
                </li>
                <li><a href="${basePath}/pet">牧场管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        账号管理
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">推荐列表</a></li>
                        <li><a href="#">申请激活中心</a></li>
                        <li><a href="#">激活管理</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        财务管理
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">激活收入明细</a></li>
                        <li><a href="#">每日收入列表</a></li>
                        <li><a href="#">推荐奖励</a></li>
                        <li><a href="#">收入总明细</a></li>
                    </ul>
                </li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        交易管理
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}/trade/transfer">金币互转</a></li>
                        <li><a href="${basePath}/trade/withdraw">金币提现</a></li>
                    </ul>
                </li>
                <li><a href="#">商城</a></li>
                <li><a href="#">个人信息</a></li>
            </ul>
        </div>
    </div>
</nav>
