<%--
  注册
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <script>
        seajs.use("user/register");
    </script>
    <title><data:i18n key="kxmc"/>-<data:i18n key="register"/></title>
</head>
<body>
<div class="container">
    <div class="title">
        <div class="title-brand">
            <data:i18n key="kxmc"/>
        </div>
    </div>
    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li class="active"><data:i18n key="register"/></li>
        </ol>
        <div class="content">
            <form id="registerForm" action="#" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="userId"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" class="form-control" id="userId" name="userId"
                               placeholder="<data:i18n key="register.userIdTip"/>"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.name"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="<data:i18n key="register.nameTip"/>"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.phone"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="mobile" name="mobile" class="form-control"
                               placeholder="<data:i18n key="register.phoneTip"/>"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.idNumber"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="idCard" name="idCard" class="form-control"
                               placeholder="<data:i18n key="register.idNumberTip"/>"
                               maxlength="18">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.bank"/>：
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
                        <data:i18n key="register.accountName"/>：
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
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.loginPwd"/>：
                    </label>

                    <div class="col-md-6 form-text">
                        <data:i18n key="register.loginPwdTip"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.tradePwd"/>：
                    </label>

                    <div class="col-md-6 form-text">
                        <data:i18n key="register.tradePwdTip"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.recommendId"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="recommendUserId" name="recommendUserId" class="form-control"
                               placeholder="<data:i18n key="register.recommendIdTip"/>" maxlength="60">
                    </div>
                    <div id="recommendUserArea" class="col-md-6 col-md-offset-2" style="display:none;">
                        <span><data:i18n key="register.recommendUser"/>：</span>
                        <span id="recommendUserName"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.activateNo"/>：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="activatedNo" name="activatedNo" class="form-control"
                               placeholder="<data:i18n key="register.activateNoTip"/>" maxlength="3">
                    </div>
                    <div id="activeUserArea" class="col-md-6 col-md-offset-2" style="display:none;">
                        <span><data:i18n key="register.activateUser"/>：</span>
                        <span id="activeUserName"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        <data:i18n key="register.yourPet"/>：
                    </label>

                    <div class="col-md-10">
                        <c:forEach var="pet" items="${petList}" varStatus="st">
                            <div class="col-md-4">
                                <label class="select-pet text-center">
                                    <img src="${imgUrl}${pet.img}" alt="${pet.name}">
                                    <input type="radio" name="petNo" value="${pet.petNo}"
                                           <c:if test="${st.index == 0}">checked</c:if>>
                                    <data:petName petNo="${pet.petNo}"/>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button type="button" id="registerBtn" class="btn btn-success"><data:i18n key="submit"/></button>
                <button type="button" id="backBtn" class="btn btn-default"><data:i18n key="back"/></button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
