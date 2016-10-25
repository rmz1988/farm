<%--
  首页
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场</title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li class="active">首页</li>
        </ol>
        <div class="total-money-area col-md-12">
            <span>金币总额：</span>
            <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
            </span>
            <span id="totalMoney">
                1000
            </span>
        </div>
        <hr>
        <div class="content">
            <div class="base-info col-md-5 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        基本信息
                    </div>
                    <div class="panel-body">
                        <p>
                            玩家编号：1111111
                        </p>
                        <p>
                            玩家姓名：无名氏
                        </p>
                        <p>
                            手机号码：157****0421
                        </p>
                        <p>
                            身份证号码：3****************9
                        </p>
                        <p>
                            开户银行：中国农业银行
                        </p>
                    </div>
                </div>
            </div>
            <div class="pet-info col-md-7 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        我的宠物
                    </div>
                    <div class="panel-body">
                        <div class="pet col-md-6 col-sm-12 col-xs-12">
                            <img src="${basePath}/images/tiane.gif" alt="天鹅">
                        </div>
                        <div class="pet-info col-md-6 col-sm-12 col-xs-12">
                            <p>
                                宠物名称：天鹅
                            </p>
                            <p>
                                复购次数：3次
                            </p>
                            <p>
                                每日金币产量：30币
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/foot.jsp"/>
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