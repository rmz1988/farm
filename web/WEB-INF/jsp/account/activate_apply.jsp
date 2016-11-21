<%--
  申请激活中心
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.applyActivate"/></title>
    <script>
        seajs.use('account/active_apply');
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
            <li class="active"><data:i18n key="menu.applyActivate"/></li>
        </ol>
        <div class="content table-responsive">
            <c:choose>
                <c:when test="${not empty activeNo}">
                    <span class="rule-tip-lg"><data:i18n key="account.haveRight"/></span>
                </c:when>
                <c:when test="${recommendCount < 10}">
                    <span class="rule-tip-lg"><data:i18n key="account.cannotApply"/></span>
                </c:when>
                <c:when test="${not empty activeAuthApply}">
                    <%--展示激活申请列表--%>
                    <table class="table">
                        <thead>
                        <tr>
                            <th><data:i18n key="userId"/></th>
                            <th><data:i18n key="account.name"/></th>
                            <th><data:i18n key="account.activateNo"/></th>
                            <th><data:i18n key="account.applyTime"/></th>
                            <th><data:i18n key="status"/></th>
                            <c:if test="${activeAuthApply.status != 0}">
                                <th><data:i18n key="account.auditTime"/></th>
                            </c:if>
                            <c:if test="${activeAuthApply.status == 2}">
                                <th><data:i18n key="operation"/></th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${activeAuthApply.userId}</td>
                            <td>${activeAuthApply.name}</td>
                            <td>${activeAuthApply.activeNo}</td>
                            <td><data:date value="${activeAuthApply.applyTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><data:dict dictgroup="activeApplyStatus" value="${activeAuthApply.status}"/></td>
                            <c:if test="${activeAuthApply.status != 0}">
                                <td><data:date value="${activeAuthApply.statusTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
                            </c:if>
                            <c:if test="${activeAuthApply.status == 2}">
                                <td>
                                    <button id="editBtn" name="${activeAuthApply.applyId}" type="button"
                                            class="btn btn-info btn-sm">
                                        <data:i18n key="edit"/>
                                    </button>
                                </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <%--展示申请表单--%>
                    <form id="applyForm" class="form-horizontal" role="form" method="post">
                        <input type="hidden" id="userId" value="${user.userId}">

                        <div class="form-group">
                            <label class="control-label col-md-3">
                                <data:i18n key="userId"/>：
                            </label>

                            <div class="col-md-5 form-text">
                                    ${user.userId}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                <data:i18n key="register.name"/>：
                            </label>

                            <div class="col-md-5 form-text">
                                    ${user.name}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                <data:i18n key="account.recommendCount"/>：
                            </label>

                            <div class="col-md-4 form-text">
                                    ${recommendCount}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <data:i18n key="account.applyActivateNo"/>：
                            </label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="activeNo" name="activeNo" maxlength="3"
                                       placeholder="<data:i18n key="applyActivateNoTip"/>">
                            </div>
                        </div>
                        <button id="applyBtn" class="btn btn-success" type="button"><data:i18n key="submit"/></button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
