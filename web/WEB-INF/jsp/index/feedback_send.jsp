<%--
  发布反馈
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-反馈</title>
    <script>
        seajs.use('user/feedback_publish');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li><a href="${basePath}">首页</a></li>
            <li><a href="${basePath}/feedback">反馈</a></li>
            <li class="active">发布</li>
        </ol>
        <div class="content">
            <form id="feedbackForm" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        标题：
                    </label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="title" name="title" placeholder="请填写反馈标题">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        反馈内容：
                    </label>
                    <div class="col-md-8">
                        <div id="content"></div>
                    </div>
                </div>
                <button id="feedbackPublishBtn" type="button" class="btn btn-success">
                    提 交
                </button>
                <button id="backBtn" type="button" class="btn btn-default">
                    返 回
                </button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
<script src="${basePath}/js/ueditor/ueditor.config.js"></script>
<script src="${basePath}/js/ueditor/ueditor.all.min.js"></script>
<script>
    var editor = UE.getEditor('content', {
        initialFrameHeight: 500,
        scaleEnabled: true,
        toolbars: [
            [
                'fontsize', '|',
                'blockquote', 'horizontal', '|',
                'removeformat', '|',
                'insertimage', '|',
                'bold', 'italic', 'underline', 'forecolor', 'backcolor', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'insertorderedlist', 'insertunorderedlist', '|',
                'link', 'unlink', '|',
                'emotion'
            ]
        ]
    });
</script>
