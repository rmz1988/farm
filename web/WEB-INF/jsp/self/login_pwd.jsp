<%--
  修改登录密码
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.personalInfo"/></title>
    <script>
        seajs.use('user/self');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li><a href="${basePath}/self"><data:i18n key="menu.personalInfo"/></a></li>
            <li class="active"><data:i18n key="self.changeLoginPwd"/></li>
        </ol>
        <div class="content">
            <form id="loginPwdForm" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.oldLoginPwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="oldLoginPwd" name="oldLoginPwd"
                               placeholder="<data:i18n key="self.oldLoginPwdTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.newLoginPwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="loginPwd" name="loginPwd"
                               placeholder="<data:i18n key="self.newLoginPwdTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.confirmLoginPwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="repeatLoginPwd" name="repeatLoginPwd"
                               placeholder="<data:i18n key="self.confirmLoginPwdTip"/>">
                    </div>
                </div>

                <button id="loginPwdChangeBtn" type="button" class="btn btn-success">
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
