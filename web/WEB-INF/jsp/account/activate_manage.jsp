<%--
  激活管理
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.activateMgmt"/></title>
    <script>
        seajs.use('account/active_manage');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li><data:i18n key="menu.accountMgmt"/></li>
            <li class="active"><data:i18n key="menu.activateMgmt"/></li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${canVisit == false}">
                    <span class="rule-tip-lg">
                        <data:i18n key="account.visitTime"/>
                    </span>
                </c:when>
                <c:otherwise>
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <label class="label-control"><data:i18n key="userId"/>：</label>
                            <input type="text" class="form-control" id="userId" name="userId">
                        </div>
                        <div class="form-group">
                            <label class="label-control"><data:i18n key="status"/>：</label>
                            <select name="status" id="status" class="form-control">
                                <option value=""><data:i18n key="all"/></option>
                                <option value="0"><data:i18n key="account.waitForActivate"/></option>
                                <option value="1"><data:i18n key="account.activated"/></option>
                            </select>
                        </div>
                        <button id="queryBtn" type="button" class="btn btn-success"><data:i18n key="search"/></button>
                    </form>
                    <hr>
                    <div id="content" class="table-responsive">
                        <jsp:include page="activate_manage_list.jsp" flush="true"/>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
