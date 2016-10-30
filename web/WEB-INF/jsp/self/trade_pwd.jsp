<%--
  修改交易密码
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-个人信息</title>
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
            <li>当前位置：</li>
            <li><a href="${basePath}/self">个人信息</a></li>
            <li class="active">修改交易密码</li>
        </ol>
        <div class="content">
            <form id="tradePwdForm" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        原交易密码：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="oldTradePwd" name="oldTradePwd"
                               placeholder="请输入原交易密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        新交易密码：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="tradePwd" name="tradePwd"
                               placeholder="请输入新交易密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        新密码确认：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="repeatTradePwd" name="repeatTradePwd"
                               placeholder="请再次输入新交易密码">
                    </div>
                </div>

                <button id="tradePwdChangeBtn" type="button" class="btn btn-success">
                    提 交
                </button>
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
