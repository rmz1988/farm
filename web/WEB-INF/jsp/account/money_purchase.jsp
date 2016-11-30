<%--
  金币收购
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/money_purchase');
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
            <c:choose>
                <c:when test="${canPurchase == true}">
                    <button id="purchaseBtn" type="button" class="btn btn-success">
                        我要收购
                    </button>
                    <input type="hidden" id="canPurchase" value="${canPurchase}"/>
                    <hr/>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            我发出的收购申请
                        </div>
                        <div id="sendContent" class="panel-body table-responsive">
                            <jsp:include page="purchase_send_list.jsp" flush="true"/>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <span class="rule-tip-lg">您不具备激活中心权限，暂不能发起金币收购！</span>
                    <hr/>
                </c:otherwise>
            </c:choose>

            <div class="panel panel-success">
                <div class="panel-heading">
                    我收到的收购申请
                </div>
                <div id="receiveContent" class="panel-body table-responsive">
                    <jsp:include page="purchase_receive_list.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
