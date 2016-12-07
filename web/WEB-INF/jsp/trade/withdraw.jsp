<%--
  提现
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.withdraw"/></title>
    <script>
        seajs.use('trade/withdraw');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li><data:i18n key="menu.tradeMgmt"/></li>
            <li class="active"><data:i18n key="menu.withdraw"/></li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${user.isWithdraw == 1}">
                    <span class="rule-tip-lg"><data:i18n key="withdraw.alreadyTip"/></span>
                </c:when>
                <c:otherwise>
                    <div class="balance-tip col-md-6">
                        <span><data:i18n key="bonus"/>：</span>
                        <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                        <span>
                                ${user.money}
                        </span>
                    </div>
                    <div class="balance-tip col-md-6">
                        <span><data:i18n key="withdraw.effective"/>：</span>
                        <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                        <span>
                                ${allowMoney}
                        </span>
                    </div>
                    <hr>
                    <form id="withdrawForm" action="#" class="form-horizontal" method="post">
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="userId"/>：
                            </label>

                            <div class="form-text col-md-6">
                                    ${user.userId}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="register.name"/>：
                            </label>

                            <div class="form-text col-md-6">
                                    ${user.name}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="register.bank"/>：
                            </label>

                            <div class="form-text col-md-6">
                                <data:dict dictgroup="bank" value="${user.bank}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="register.accountName"/>：
                            </label>

                            <div class="form-text col-md-6">
                                    ${user.bankAccountName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="register.bankCard"/>：
                            </label>

                            <div class="form-text col-md-6">
                                <data:bankcard value="${user.bankCard}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="withdraw.amount"/>：
                            </label>

                            <div class="col-md-6">
                                <input type="number" id="money" name="money" class="form-control"
                                       placeholder="<data:i18n key="withdraw.amountTip"/>${minWithdraw}<data:i18n key="withdraw.amountTip2"/>">
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
                        <input type="hidden" id="max" value="${user.money}">
                        <input type="hidden" id="min" value="${minWithdraw}">
                        <input type="hidden" id="times" value="100">
                        <input type="hidden" id="todayRepurchase" value="${user.todayRepurchase}"/>
                        <input type="hidden" id="todayLimitMoney" value="${user.todayLimitMoney}"/>
                        <button id="withdrawBtn" type="button" class="btn btn-success col-md-offset-2"
                                <c:if test="${canWithdraw == false}">disabled</c:if>>
                            <data:i18n key="submit"/>
                        </button>
                        <c:if test="${canWithdraw == false}">
                            <span style="color:#f00;">
                                <c:if test="${user.rePurchase > 0}">
                                    (<data:i18n key="withdraw.reject1"/>)
                                </c:if>
                                <c:if test="${user.rePurchase == 0}">
                                    (<data:i18n key="withdraw.reject2"/>)
                                </c:if>
                            </span>
                        </c:if>
                    </form>
                </c:otherwise>
            </c:choose>
            <hr>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <data:i18n key="withdraw.warnings"/>
                </div>
                <div class="panel-body">
                    <span class="rule-tip-lg">
                        <data:i18n key="withdraw.warnTip1"/><br/>
                        <data:i18n key="withdraw.warnTip2"/><br/>
                        <data:i18n key="withdraw.warnTip3"/>${minWithdraw}<data:i18n key="withdraw.warnTip4"/><br/>
                        <data:i18n key="withdraw.warnTip5"/>${fee}<data:i18n key="withdraw.warnTip6"/><br/>
                        <data:i18n key="withdraw.warnTip7"/>
                    </span>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <data:i18n key="withdraw.record"/>
                </div>
                <div id="content" class="panel-body table-responsive">
                    <jsp:include page="withdraw_list.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
