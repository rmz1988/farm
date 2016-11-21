<%--
  个人信息
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
            <li class="active"><data:i18n key="menu.personalInfo"/></li>
        </ol>
        <div class="content">
            <p>
                <data:i18n key="userId"/>：${user.userId}
            </p>

            <p>
                <data:i18n key="register.name"/>：${user.name}
            </p>

            <p>
                <data:i18n key="register.phone"/>：${user.mobile}
            </p>

            <p>
                <data:i18n key="register.idNumber"/>：<data:idCard value="${user.idCard}"/>
            </p>

            <p>
                <data:i18n key="register.bank"/>：<data:dict dictgroup="bank" value="${user.bank}"/>
            </p>
            <p>
                <data:i18n key="register.accountName"/>：${user.bankAccountName}
            </p>
            <p>
                <data:i18n key="register.bankCard"/>：<data:bankcard value="${user.bankCard}"/>
            </p>
            <p>
                <button id="loginPwdBtn" type="button" class="btn btn-success">
                    <data:i18n key="self.changeLoginPwd"/>
                </button>
                <button id="tradePwdBtn" type="button" class="btn btn-success">
                    <data:i18n key="self.changeTradePwd"/>
                </button>
            </p>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
