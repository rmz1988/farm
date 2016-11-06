<%--
 奖励币转激活币
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-奖励币转激活币</title>
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
            <li>当前位置：</li>
            <li>交易管理</li>
            <li class="active">奖励币转激活币</li>
        </ol>
        <div class="content">
            <c:choose>
                <c:when test="${empty user.activeNo}">
                <span class="rule-tip-lg">
                   您暂不具备奖励币转权限，请先申请激活管理权限。
                </span>
                </c:when>
                <c:otherwise>
                    <div class="balance-tip col-md-6">
                        <span>奖励币余额：</span>
                        <span class="money-img">
                            <img src="${basePath}/images/money.png" alt="">
                        </span>
                        <span>
                                ${user.money}
                        </span>
                    </div>
                    <div class="balance-tip col-md-6">
                        <span>激活币余额：</span>
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
                                转换金额：
                            </label>

                            <div class="col-md-6">
                                <input type="number" id="money" name="money" class="form-control"
                                       placeholder="请输入转换金额,只能是${minTransfer}的倍数">
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
                        <input type="hidden" id="max" value="${user.money}"/>
                        <input type="hidden" id="times" value="${minTransfer}"/>
                        <button id="transferBtn" type="button" class="btn btn-success col-md-offset-2">提交</button>
                    </form>
                    <hr>
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            奖励币转激活币注意事项
                        </div>
                        <div class="panel-body">
                    <span class="rule-tip-lg">
                        1、奖励币转激活币为立即到账，转换金额只能是${minTransfer}的倍数；<br/>
                        2、每天转换次数无上限；不收取任何费用；<br/>
                        3、激活币可用于激活玩家操作，不可提现，不可再次转换为奖励币。
                    </span>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            奖励币转激活币记录
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
