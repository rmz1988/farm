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
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="6位以上数字">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        电话：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请输入联系电话">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        身份证号：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请输入您的身份证号码">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        开户银行/支付宝：
                    </label>
                    <div class="col-md-6">
                        <select class="form-control">
                            <option value="">请选择开户银行/支付宝</option>
                            <option value="0">中国银行</option>
                            <option value="1">中国工商银行</option>
                            <option value="2">中国农业银行</option>
                            <option value="3">中国建设银行</option>
                            <option value="4">招商银行</option>
                            <option value="5">邮政储蓄银行</option>
                            <option value="6">兴业银行</option>
                            <option value="7">交通银行</option>
                            <option value="8">其他银行</option>
                            <option value="9">支付宝</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        户名/支付宝昵称：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请输入您的银行开户名称或支付宝昵称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        银行卡号/支付宝账号：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请输入您的银行卡号或支付宝账号">
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
                        <input type="text" class="form-control" placeholder="请填写您的推荐人编号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        激活中心编号：
                    </label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="请填写您的激活中心编号：3位数字">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">
                        您要购买的宠物：
                    </label>
                    <div class="col-md-10">
                        <div class="col-md-4">
                            <label class="select-pet text-center">
                                <img src="${basePath}/images/tiane.gif" alt="天鹅">
                                <input type="radio" name="selectPet" value="0">
                                天鹅
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label class="select-pet text-center">
                                <img src="${basePath}/images/kongque.gif" alt="孔雀">
                                <input type="radio" name="selectPet" value="0">
                                孔雀
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label class="select-pet text-center">
                                <img src="${basePath}/images/qilin.gif" alt="麒麟">
                                <input type="radio" name="selectPet" value="0">
                                麒麟
                            </label>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-success">提交</button>
                <button type="button" class="btn btn-default">返回</button>
            </form>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
