<%--
  公告详情
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.notice"/></title>
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
            <li><data:i18n key="currentLocation"/>：</li>
            <li><a href="${basePath}"><data:i18n key="home"/></a></li>
            <li><a href="${basePath}/notice"><data:i18n key="menu.notice"/></a></li>
            <li class="active"><data:i18n key="detail"/></li>
        </ol>
        <div class="content">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.title"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        ${notice.title}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.releaseTime"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        <data:date value="${notice.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="index.content"/>：
                    </label>

                    <div class="col-md-8 form-text">
                        ${notice.content}
                    </div>
                </div>
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
