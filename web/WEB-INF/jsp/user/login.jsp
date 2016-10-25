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
</head>
<body>
<div class="container">
    <div class="login-area col-md-6">
        <form action="#" class="login-form form-horizontal" method="post">
            <div class="form-group">
                <label class="control-label col-md-3">玩家编号：</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="userId" placeholder="玩家编号">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">
                    登录密码：
                </label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="loginPwd" placeholder="登录密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-7 col-md-offset-3">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="rememberUser" value="1">
                        下次自动登录
                    </label>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="button" class="btn btn-success">登 录</button>
                <button type="button" class="btn btn-info">注 册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
