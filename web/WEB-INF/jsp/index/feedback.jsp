<%--
  反馈
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.feedback"/></title>
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
            <li><data:i18n key="currentLocation"/>：</li>
            <li><a href="${basePath}"><data:i18n key="home"/></a></li>
            <li class="active"><data:i18n key="menu.feedback"/></li>
        </ol>
        <div class="content">
            <button id="feedbackBtn" type="button" class="btn btn-success">
                <data:i18n key="index.feedback"/>
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
