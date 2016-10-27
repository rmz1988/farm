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
    <title>开鑫牧场-注册</title>
</head>
<body>
<div class="container">
    <div class="title"></div>
    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li class="active">用户注册</li>
        </ol>
        <div class="content">
            <form id="registerForm" action="#" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2">
                        玩家编号：
                    </label>

                    <div class="col-md-6">
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="6位以上数字"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        玩家姓名：
                    </label>

                    <div class="col-md-6">
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的姓名"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        电话：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="mobile" name="mobile" class="form-control" placeholder="请输入联系电话"
                               maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        身份证号：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="idCard" name="idCard" class="form-control" placeholder="请输入您的身份证号码"
                               maxlength="18">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        开户银行/支付宝：
                    </label>

                    <div class="col-md-6">
                        <select id="bank" name="bank" class="form-control">
                            <option value="">请选择开户银行/支付宝</option>
                            <c:forEach var="dict" items="${bankList}">
                                <option value="${dict.dictName}">${dict.dictValue}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        户名/支付宝昵称：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankAccountName" name="bankAccountName" class="form-control"
                               placeholder="请输入您的银行开户名称或支付宝昵称" maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        银行卡号/支付宝账号：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="bankCard" name="bankCard" class="form-control"
                               placeholder="请输入您的银行卡号或支付宝账号" maxlength="60">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        登录密码：
                    </label>

                    <div class="col-md-6 form-text">
                        默认：111111，用于登录系统，请激活后自行修改。
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        交易密码：
                    </label>

                    <div class="col-md-6 form-text">
                        默认：222222，用于金币互转和提现操作，请激活后自行修改
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        推荐人编号：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="recommendUserId" name="recommendUserId" class="form-control"
                               placeholder="请填写您的推荐人编号" maxlength="60">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        激活中心编号：
                    </label>

                    <div class="col-md-6">
                        <input type="text" id="activatedNo" name="activatedNo" class="form-control"
                               placeholder="请填写您的激活中心编号：3位数字" maxlength="3">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        您要购买的宠物：
                    </label>

                    <div class="col-md-10">
                        <c:forEach var="pet" items="${petList}" varStatus="st">
                            <div class="col-md-4">
                                <label class="select-pet text-center">
                                    <img src="${imgUrl}${pet.img}" alt="${pet.name}">
                                    <input type="radio" name="petNo" value="${pet.petNo}"
                                           <c:if test="${st.index == 0}">checked</c:if>>
                                        ${pet.name}
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button type="button" id="registerBtn" class="btn btn-success">提交</button>
                <button type="button" id="backBtn" class="btn btn-default">返回</button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
