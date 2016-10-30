<%--
  个人信息
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
            <li class="active">个人信息</li>
        </ol>
        <div class="content">
            <p>
                玩家编号：${user.userId}
            </p>

            <p>
                玩家姓名：${user.name}
            </p>

            <p>
                手机号码：${user.mobile}
            </p>

            <p>
                身份证号码：<data:idCard value="${user.idCard}"/>
            </p>

            <p>
                开户银行(支付宝)：<data:dict dictgroup="bank" value="${user.bank}"/>
            </p>
            <p>
                户名(昵称)：${user.bankAccountName}
            </p>
            <p>
                银行卡号(支付宝账号)：<data:bankcard value="${user.bankCard}"/>
            </p>
            <p>
                <button id="loginPwdBtn" class="btn btn-success">
                    修改登录密码
                </button>
                <button id="tradePwdBtn" class="btn btn-success">
                    修改交易密码
                </button>
            </p>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
