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
            <div class="balance-tip col-md-6">
                <span>金币余额：</span>
                <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                <span>
                    1000
                </span>
            </div>
            <div class="balance-tip col-md-6">
                <span>可提现金币：</span>
                <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                <span>
                    900
                </span>
            </div>
            <hr>
            <form action="#" class="form-horizontal" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2">
                        玩家编号：
                    </label>
                    <div class="form-text col-md-6">
                        1111111
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        玩家姓名：
                    </label>
                    <div class="form-text col-md-6">
                        无名氏
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        开户银行：
                    </label>
                    <div class="form-text col-md-6">
                        招商银行
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        银行户名：
                    </label>
                    <div class="form-text col-md-6">
                        无名氏
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        银行卡号：
                    </label>
                    <div class="form-text col-md-6">
                        621483******0117
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        提现金额：
                    </label>
                    <div class="col-md-6">
                        <input type="number" class="form-control" placeholder="请输入提现金额，只能是整百的倍数">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        交易密码：
                    </label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" placeholder="请输入交易密码">
                    </div>
                </div>
                <button type="button" class="btn btn-success">提交</button>
            </form>
            <hr>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    提现注意事项
                </div>
                <div class="panel-body">
                    <span class="rule-tip-lg">
                        1、每名玩家每天只能提现1次；<br/>
                        2、每次提现金额只能是100的倍数；<br/>
                        3、每次提现将从玩家提现后的余额中扣除10%的手续费；<br/>
                        4、提现申请提交后，将由系统工作人员审核后将金额转入您预留的银行(支付宝)账号。
                    </span>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    提现记录
                </div>
                <div class="panel-body">
                    <table class="table table-responsive">
                        <thead>
                        <tr>
                            <th>提现账号</th>
                            <th>提现金额(元)</th>
                            <th>提现日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>支付宝：15700003022</td>
                            <td>200</td>
                            <td>2016-10-20 23:00:00</td>
                            <td>已到账</td>
                        </tr>
                        <tr>
                            <td>支付宝：15700003022</td>
                            <td>500</td>
                            <td>2016-10-25 12:00:03</td>
                            <td>待审核</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
