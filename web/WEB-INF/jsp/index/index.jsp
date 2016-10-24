<%--
  首页
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场</title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <div class="title">
        <ul class="title-area pull-right">
            <li>
                <img class="pull-right" src="${basePath}/images/tiane.gif" alt="" width="60" height="60"/>
            </li>
            <li>
                <a href="#">
                    1111111
                </a>
            </li>
            <li>|</li>
            <li>
                <a href="#">系统公告</a>
            </li>
            <li>|</li>
            <li>
                <a href="#">反馈</a>
            </li>
        </ul>
    </div>
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
                                <li><a href="#">架构管理</a></li>
                                <li><a href="#">邀请列表</a></li>
                                <li><a href="#">邀请中心</a></li>
                                <li><a href="#">邀请记录</a></li>
                            </ul>
                        </li>
                        <li><a href="#">宠物币管理</a></li>
                        <li><a href="#">玩家交易</a></li>
                        <li><a href="#">商城购物</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
<%--<script src="${basePath}/js/ueditor/ueditor.config.js"></script>--%>
<%--<script src="${basePath}/js/ueditor/ueditor.all.min.js"></script>--%>
<%--<script>--%>
<%--//    describe为div的id--%>
<%--var editor = UE.getEditor('describe', {--%>
<%--initialFrameHeight: 500,--%>
<%--scaleEnabled: true,--%>
<%--toolbars: [--%>
<%--[--%>
<%--'fontsize', '|',--%>
<%--'blockquote', 'horizontal', '|',--%>
<%--'removeformat', '|',--%>
<%--'insertimage', '|',--%>
<%--'bold', 'italic', 'underline', 'forecolor', 'backcolor', '|',--%>
<%--'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify',--%>
<%--'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',--%>
<%--'insertorderedlist', 'insertunorderedlist', '|',--%>
<%--'link', 'unlink', '|',--%>
<%--'emotion'--%>
<%--]--%>
<%--]--%>
<%--});--%>
<%--</script>--%>