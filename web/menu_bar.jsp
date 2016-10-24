<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">

            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"
               style="margin-bottom: 5px;">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <!-- Be sure to leave the brand out there if you want it shown -->
            <%--<a class="brand" href="#">Project name</a>--%>

            <!-- Everything you want hidden at 940px or less, place within here -->
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active">
                        <a href="#">首页</a>
                    </li>
                    <li><a href="#">牧场管理</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            账号管理
                            <b class="caret"></b>
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
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">激活收入明细</a></li>
                            <li><a href="#">每日收入列表</a></li>
                            <li><a href="#">推荐奖励</a></li>
                            <li><a href="#">收入总明细</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            交易管理
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">金币互转</a></li>
                            <li><a href="#">金币提现</a></li>
                        </ul>
                    </li>
                    <li><a href="#">商城</a></li>
                    <li><a href="#">个人信息</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>
