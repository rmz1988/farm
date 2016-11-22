<%--
  登录
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="login"/></title>
    <script>
        seajs.use('user/login');
    </script>
</head>
<body>
<div class="login-area col-md-6">
    <div class="login-title col-md-12 text-center" style="line-height: 60px;">
        <data:i18n key="kxmc"/>
    </div>
    <form action="#" class="login-form form-horizontal" method="post">
        <div class="form-group">
            <label class="control-label col-md-3"><data:i18n key="userId"/>：</label>

            <div class="col-md-7">
                <input type="text" class="form-control" id="userId" name="userId" placeholder="<data:i18n key="userId"/>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">
                <data:i18n key="loginPwd"/>：
            </label>

            <div class="col-md-7">
                <input type="password" class="form-control" id="loginPwd" name="loginPwd" placeholder="<data:i18n key="loginPwd"/>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">
                <data:i18n key="changeLang"/>：
            </label>

            <div class="col-md-7">
                <select class="form-control" name="locale" id="lang">
                    <option value="zh_CN" <c:if test="${requestScope.locale == 'zh_CN'}">selected </c:if>>中文</option>
                    <option value="en_US" <c:if test="${requestScope.locale == 'en_US'}">selected </c:if>>English
                    </option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-3">
                <label class="checkbox-inline">
                    <input type="checkbox" id="rememberUser" name="rememberUser" value="1">
                    <data:i18n key="rememberMe" />
                </label>
            </div>
        </div>

        <div class="form-group text-center">
            <button type="button" id="loginBtn" class="btn btn-success"><data:i18n key="login"/> </button>
            <button type="button" id="registerBtn" class="btn btn-info"><data:i18n key="register"/> </button>
        </div>
    </form>
</div>
<%--<div style="position: absolute;left:0;bottom:0;width: 100%;">--%>
<%--<jsp:include page="/foot.jsp" flush="true"/>--%>
<%--</div>--%>
</body>
</html>