<%--
 奖励币转激活币
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.transferToActive"/></title>
    <script>
        seajs.use('trade/transferActive');
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
            <li class="active"><data:i18n key="menu.transferToActive"/></li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${empty user.activeNo}">
                <span class="rule-tip-lg">
                   <data:i18n key="transfer.noAuth"/>
                </span>
                </c:when>
                <c:otherwise>
                    <div class="balance-tip col-md-4">
                        <span><data:i18n key="bonus"/>：</span>
                        <span class="money-img">
                            <img src="${basePath}/images/money.png" alt="">
                        </span>
                        <span>
                                ${user.money}
                        </span>
                    </div>
                    <div class="balance-tip col-md-4">
                        <span><data:i18n key="transfer.effective"/>：</span>
                        <span class="money-img">
                            <img src="${basePath}/images/money.png" alt="">
                        </span>
                        <span>
                                ${allowMoney}
                        </span>
                    </div>
                    <div class="balance-tip col-md-4">
                        <span><data:i18n key="activateMoney"/>：</span>
                        <span class="money-img">
                            <img src="${basePath}/images/money.png" alt="">
                        </span>
                        <span>
                                ${user.activeMoney}
                        </span>
                    </div>
                    <hr>
                    <form id="transferForm" action="#" class="form-horizontal" method="post">
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                <data:i18n key="transfer.money"/>：
                            </label>

                            <div class="col-md-6">
                                <input type="number" id="money" name="money" class="form-control"
                                       placeholder="<data:i18n key="transfer.moneyTip"/>${minTransfer}<data:i18n key="transfer.moneyTip2"/>">
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
                        <input type="hidden" id="max" value="${user.money}"/>
                        <input type="hidden" id="times" value="${minTransfer}"/>
                        <input type="hidden" id="todayRepurchase" value="${user.todayRepurchase}"/>
                        <input type="hidden" id="todayLimitMoney" value="${user.todayLimitMoney}"/>
                        <button id="transferBtn" type="button" class="btn btn-success col-md-offset-2"><data:i18n key="submit"/></button>
                    </form>
                    <hr>
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <data:i18n key="transferActive.warnings"/>
                        </div>
                        <div class="panel-body">
                    <span class="rule-tip-lg">
                        <data:i18n key="transferActive.warnTip1"/>${minTransfer}<data:i18n key="transferActive.warnTip2"/><br/>
                        <data:i18n key="transferActive.warnTip3"/><br/>
                        <data:i18n key="transferActive.warnTip4"/>
                    </span>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <data:i18n key="transferActive.record"/>
                        </div>
                        <div id="content" class="panel-body table-responsive">
                            <jsp:include page="activate_transfer_list.jsp" flush="true"/>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
