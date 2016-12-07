<%--
  收购申请
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/purchase_apply');
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
            <form id="purchaseForm" method="post" class="form-horizontal">
                <input type="hidden" id="purchaseUserId" value="${purchaseUser.userId}">
                <input type="hidden" id="max" value="${purchaseUser.money}">
                <input type="hidden" id="min" value="${minPurchase}">
                <input type="hidden" id="times" value="100">
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="userId"/>：
                    </label>
                    <div class="col-md-6 form-text">
                        ${purchaseUser.userId}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.name"/>：
                    </label>
                    <div class="col-md-6 form-text">
                        ${purchaseUser.name}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="purchase.balance"/>：
                    </label>`
                    <div class="col-md-6 form-text">
                        ${purchaseUser.money}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="purchase.amount"/>：
                    </label>
                    <div class="col-md-6">
                        <input class="form-control" type="number" name="purchaseMoney" id="purchaseMoney"
                               placeholder="<data:i18n key="purchase.amountTip"/>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.tradePwd"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="password" id="tradePwd" name="tradePwd" class="form-control"
                               placeholder="<data:i18n key="transfer.tradePwdTip"/>">
                    </div>
                </div>
                <button class="btn btn-success" type="button" id="submitBtn">
                    <data:i18n key="submit"/>
                </button>
                <button id="backBtn" class="btn btn-default" type="button">
                    <data:i18n key="back"/>
                </button>
            </form>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
