<%--
  申请激活中心编辑
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/active_apply_edit');
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
            <li><data:i18n key="menu.applyActivate"/></li>
            <li class="active"><data:i18n key="edit"/></li>
        </ol>
        <div class="content">
            <form id="applyForm" class="form-horizontal" role="form" method="post">
                <input type="hidden" id="applyId" value="${activeAuthApply.applyId}">
                <input type="hidden" id="userId" value="${activeAuthApply.userId}">

                <div class="form-group">
                    <label class="control-label col-md-3">
                        <data:i18n key="userId"/>：
                    </label>

                    <div class="col-md-5 form-text">
                        ${activeAuthApply.userId}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">
                        <data:i18n key="register.name"/>：
                    </label>

                    <div class="col-md-5 form-text">
                        ${activeAuthApply.name}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">
                        <data:i18n key="account.recommendCount"/>：
                    </label>

                    <div class="col-md-4 form-text">
                        ${user.recommendCount}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">
                        <data:i18n key="account.applyActivateNo"/>：：
                    </label>

                    <div class="col-md-5">
                        <input type="number" class="form-control" id="activeNo" name="activeNo" maxlength="3"
                               value="${activeAuthApply.activeNo}">
                    </div>
                </div>
                <button id="applyBtn" class="btn btn-success" type="button"><data:i18n key="submit"/></button>
                <button id="backBtn" type="button" class="btn btn-default"><data:i18n key="back"/></button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
