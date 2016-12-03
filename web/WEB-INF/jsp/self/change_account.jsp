<%--
  修改银行账户
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
            <form class="form-horizontal" role="form" method="post" id="changeForm">
                <input type="hidden" id="userId" value="${user.userId}"/>

                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.bank"/>：
                    </label>

                    <div class="col-md-6">
                        <select id="bank" name="bank" class="form-control">
                            <option value=""><data:i18n key="register.bankTip"/></option>
                            <c:forEach var="dict" items="${bankList}">
                                <option value="${dict.dictName}"
                                        <c:if test="${user.bank == dict.dictName}">selected </c:if>><data:dict
                                        dictgroup="bank"
                                        value="${dict.dictName}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.accountName"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankAccountName" name="bankAccountName" class="form-control"
                               placeholder="<data:i18n key="register.accountNameTip"/>" maxlength="60"
                               value="${user.bankAccountName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.bankCard"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankCard" name="bankCard" class="form-control"
                               placeholder="<data:i18n key="register.bankCardTip"/>" maxlength="60"
                               value="<data:bankcard value="${user.bankCard}" hidden="false"/>">
                    </div>
                </div>
                <button class="btn btn-success" type="button" id="changeAccountBtn">
                    <data:i18n key="submit"/>
                </button>
                <button class="btn btn-default" type="button" id="backBtn">
                    <data:i18n key="back"/>
                </button>
            </form>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
