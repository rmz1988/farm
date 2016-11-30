<%--
  我要收购列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/purchase');
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
            <form role="form" method="post" class="form-inline">
                <div class="form-group">
                    <label class="control-label">
                        <data:i18n key="userId"/>：
                    </label>
                    <input type="text" class="form-control" id="userId" name="userId">
                </div>
                <button id="queryBtn" class="btn btn-success" type="button">
                    <data:i18n key="search"/>
                </button>
                <button id="backBtn" class="btn btn-default" type="button">
                    <data:i18n key="back"/>
                </button>
            </form>
            <hr>
            <div id="content" class="table-responsive">
                <jsp:include page="purchase_list.jsp" flush="true"/>
            </div>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
