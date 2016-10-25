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
                    1000
                </span>
            </div>
            <div class="balance-tip col-md-6">
                <span>可转出金币：</span>
                <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
                </span>
                <span>
                    1000
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
                        转出玩家编号：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请输入转出玩家编号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        转出金额：
                    </label>
                    <div class="col-md-6">
                        <input type="number" class="form-control" placeholder="请输入转出金额，只能是整百的倍数">
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
                    金币互转注意事项
                </div>
                <div class="panel-body">
                    <span class="rule-tip-lg">
                        1、金币互转金额只能是100的倍数；<br/>
                        2、金币互转直接计入对方金币余额，操作不可撤销；<br/>
                        3、金币互转不收取手续费，每天互转次数无限制。
                    </span>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    金币互转记录
                </div>
                <div class="panel-body">
                    <table class="table table-responsive">
                        <thead>
                        <tr>
                            <th>操作类型</th>
                            <th>转入编号</th>
                            <th>转出编号</th>
                            <th>金额</th>
                            <th>操作日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>转入</td>
                            <td>2222222</td>
                            <td></td>
                            <td>500</td>
                            <td>2016-10-20 23:00:00</td>
                            <td>成功</td>
                        </tr>
                        <tr>
                            <td>转出</td>
                            <td></td>
                            <td>2222222</td>
                            <td>200</td>
                            <td>2016-10-25 12:00:03</td>
                            <td>失败</td>
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
