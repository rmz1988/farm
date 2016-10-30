<%--
  玩家互转
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-金币互转</title>
    <script>
        seajs.use('trade/transfer');
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
            <li class="active">金币互转</li>
        </ol>
        <div class="content">
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
                <span>可转出金币：</span>
                <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                <span>
                    ${allowMoney}
                </span>
            </div>
            <hr>
            <form id="transferForm" action="#" class="form-horizontal" method="post">
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
                        转出玩家编号：
                    </label>
                    <div class="col-md-6">
                        <input type="text" id="userId" name="userId" class="form-control" placeholder="请输入转出玩家编号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        转出金额：
                    </label>
                    <div class="col-md-6">
                        <input type="number" id="money" name="money" class="form-control"
                               placeholder="请输入转出金额，只能是${minTransfer}的倍数">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        交易密码：
                    </label>
                    <div class="col-md-6">
                        <input type="password" id="tradePwd" name="tradePwd" class="form-control" placeholder="请输入交易密码">
                    </div>
                </div>
                <input type="hidden" id="max" value="${user.money}"/>
                <input type="hidden" id="times" value="${minTransfer}" 、>
                <button id="transferBtn" type="button" class="btn btn-success col-md-offset-2">提交</button>
            </form>
            <hr>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    金币互转注意事项
                </div>
                <div class="panel-body">
                    <span class="rule-tip-lg">
                        1、金币互转金额只能是${minTransfer}的倍数；<br/>
                        2、金币互转直接计入对方金币余额，操作不可撤销；<br/>
                        3、金币互转不收取手续费，每天互转次数无限制。
                    </span>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    金币互转记录
                </div>
                <div id="content" class="panel-body">
                    <jsp:include page="transfer_list.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
