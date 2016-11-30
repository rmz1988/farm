<%--
同意收购填写银行账户信息
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/purchase_agree');
    </script>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li><data:i18n key="menu.accountMgmt"/></li>
            <li class="active"><data:i18n key="menu.moneyPurchase"/></li>
        </ol>
        <div class="content">
            <form id="agreeForm" class="form-horizontal" method="post">
                <input type="hidden" id="applyId" value="${applyId}">
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="purchase.bank"/>：
                    </label>

                    <div class="col-md-6">
                        <select id="bank" name="bank" class="form-control">
                            <option value=""><data:i18n key="register.bankTip"/></option>
                            <c:forEach var="dict" items="${bankList}">
                                <option value="${dict.dictName}"><data:dict dictgroup="bank"
                                                                            value="${dict.dictName}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="purchase.accountName"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankAccountName" name="bankAccountName" class="form-control"
                               placeholder="<data:i18n key="register.accountNameTip"/>" maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.bankCard"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankCard" name="bankCard" class="form-control"
                               placeholder="<data:i18n key="register.bankCardTip"/>" maxlength="60">
                    </div>
                </div>
                <button class="btn btn-success" id="submitBtn" type="button">
                    <data:i18n key="submit"/>
                </button>
                <button class="btn btn-default" id="backBtn" type="button">
                    <data:i18n key="back"/>
                </button>
            </form>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</body>
</html>
