<%--
  登录
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-登录</title>
    <script>
        seajs.use('user/login');
    </script>
</head>
<body>
<div class="login-area col-md-6">
    <div class="login-title col-md-12 text-center">
        开 鑫 牧 场
    </div>
    <form action="#" class="login-form form-horizontal" method="post">
        <div class="form-group">
            <label class="control-label col-md-3">玩家编号：</label>

            <div class="col-md-7">
                <input type="text" class="form-control" id="userId" name="userId" placeholder="玩家编号">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">
                登录密码：
            </label>

            <div class="col-md-7">
                <input type="password" class="form-control" id="loginPwd" name="loginPwd" placeholder="登录密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-3">
                <label class="checkbox-inline">
                    <input type="checkbox" id="rememberUser" name="rememberUser" value="1">
                    下次自动登录
                </label>
            </div>
        </div>
        <div class="form-group text-center">
            <button type="button" id="loginBtn" class="btn btn-success">登 录</button>
            <button type="button" id="registerBtn" class="btn btn-info">注 册</button>
        </div>
    </form>
</div>
<div style="position: absolute;left:0;bottom:0;width: 100%;">
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
