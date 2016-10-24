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