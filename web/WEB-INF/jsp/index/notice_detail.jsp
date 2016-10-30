<%--
  公告详情
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-公告</title>
    <script>
        seajs.use('user/notice');
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
            <li><a href="${basePath}/notice">公告</a></li>
            <li class="active">详情</li>
        </ol>
        <div class="content">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        标题：
                    </label>
                    <div class="col-md-8 form-text">
                        ${notice.title}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        发布时间：
                    </label>
                    <div class="col-md-8 form-text">
                        <data:date value="${notice.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        内容：
                    </label>
                    <div class="col-md-8 form-text">
                        ${notice.content}
                    </div>
                </div>
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
