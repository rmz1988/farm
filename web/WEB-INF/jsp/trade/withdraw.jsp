<%--
  提现
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-提现</title>
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
            <li>当前位置：</li>
            <li>交易管理</li>
            <li class="active">金币提现</li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${user.isWithdraw == 1}">
                    <span class="rule-tip-lg">您今日已提现，请明天再来！</span>
                </c:when>
                <c:otherwise>
                    <div class="balance-tip col-md-6">
                        <span>金币余额：</span>
                        <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                        <span>
                                ${user.money}
                        </span>
                    </div>
                    <div class="balance-tip col-md-6">
                        <span>可提现金币：</span>
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
                                玩家编号：
                            </label>
                            <div class="form-text col-md-6">
                                    ${user.userId}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                玩家姓名：
                            </label>
                            <div class="form-text col-md-6">
                                    ${user.name}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                开户银行(支付宝)：
                            </label>
                            <div class="form-text col-md-6">
                                <data:dict dictgroup="bank" value="${user.bank}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                银行户名(昵称)：
                            </label>
                            <div class="form-text col-md-6">
                                    ${user.bankAccountName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                银行卡号(支付宝账号)：
                            </label>
                            <div class="form-text col-md-6">
                                <data:bankcard value="${user.bankCard}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                提现金额：
                            </label>
                            <div class="col-md-6">
                                <input type="number" id="money" name="money" class="form-control"
                                       placeholder="请输入提现金额，只能是${minWithdraw}的倍数">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">
                                交易密码：
                            </label>
                            <div class="col-md-6">
                                <input type="password" id="tradePwd" name="tradePwd" class="form-control"
                                       placeholder="请输入交易密码">
                            </div>
                        </div>
                        <input type="hidden" id="max" value="${user.money}">
                        <input type="hidden" id="times" value="${minWithdraw}">
                        <button id="withdrawBtn" type="button" class="btn btn-success col-md-offset-2"
                                <c:if test="${canWithdraw == false}">disabled</c:if>>
                            提交
                        </button>
                        <c:if test="${canWithdraw == false}">
                            <span style="color:#f00;">
                                <c:if test="${user.rePurchase > 0}">
                                    (您的宠物首轮未满15天，不能提现！)
                                </c:if>
                                <c:if test="${user.rePurchase == 0}">
                                    (您尚未复购宠物，不能提现！)
                                </c:if>
                            </span>
                        </c:if>
                    </form>
                </c:otherwise>
            </c:choose>
            <hr>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    提现注意事项
                </div>
                <div class="panel-body">
                    <span class="rule-tip-lg">
                        1、每名玩家须在宠物首轮满15天，且至少复购一次后才能提现；<br/>
                        2、每名玩家每天只能提现1次；<br/>
                        3、每次提现金额只能是${minWithdraw}的倍数；<br/>
                        4、每次提现需缴纳${fee}%的手续费，该笔费用在提现金额中扣除；<br/>
                        5、提现申请提交后，将由系统工作人员审核后将金额转入您预留的银行(支付宝)账号。
                    </span>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    提现记录
                </div>
                <div id="content" class="panel-body">
                    <jsp:include page="withdraw_list.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
