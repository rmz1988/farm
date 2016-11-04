<%--
  反馈
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-反馈</title>
    <script>
        seajs.use('user/feedback');
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
            <li class="active">反馈</li>
        </ol>
        <div class="content">
            <button id="feedbackBtn" type="button" class="btn btn-success">
                问题反馈
            </button>
            <hr>
            <div id="content" class="table-responsive">
                <jsp:include page="feedback_list.jsp" flush="true"/>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
