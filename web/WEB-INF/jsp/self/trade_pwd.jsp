<%--
  修改交易密码
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
            <li class="active"><data:i18n key="self.changeTradePwd"/></li>
        </ol>
        <div class="content">
            <form id="tradePwdForm" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.oldTradePwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="oldTradePwd" name="oldTradePwd"
                               placeholder="<data:i18n key="self.oldTradePwdTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.newTradePwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="tradePwd" name="tradePwd"
                               placeholder="<data:i18n key="self.newTradePwdTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <data:i18n key="self.confirmTradePwd"/>：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="repeatTradePwd" name="repeatTradePwd"
                               placeholder="<data:i18n key="self.confirmTradePwdTip"/>">
                    </div>
                </div>

                <button id="tradePwdChangeBtn" type="button" class="btn btn-success">
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
