<%--
  发布反馈
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.feedback"/></title>
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
            <li><data:i18n key="currentLocation"/>：</li>
            <li><a href="${basePath}"><data:i18n key="home"/></a></li>
            <li><a href="${basePath}/feedback"><data:i18n key="menu.feedback"/></a></li>
            <li class="active"><data:i18n key="index.release"/></li>
        </ol>
        <div class="content">
            <form id="feedbackForm" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.title"/>：
                    </label>

                    <div class="col-md-8">
                        <input type="text" class="form-control" id="title" name="title"
                               placeholder="<data:i18n key="index.feedbackTitleTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.feedbackContent"/>：
                    </label>

                    <div class="col-md-8">
                        <textarea class="form-control" name="content" id="content" cols="30" rows="10"
                                  placeholder="<data:i18n key="index.feedbackContentTip"/>"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <span class="col-md-offset-2 col-md-10 rule-tip-lg"><data:i18n key="index.imgTip"/></span>

                    <div class="col-md-10 col-md-offset-2">
                        <data:imgUpload id="pics" name="pics"/>
                    </div>
                </div>
                <button id="feedbackPublishBtn" type="button" class="btn btn-success">
                    <data:i18n key="submit"/>
                </button>
                <button id="backBtn" type="button" class="btn btn-default">
                    <data:i18n key="back"/>
                </button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
<%--
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
--%>
