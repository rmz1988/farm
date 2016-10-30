<%--
  首页
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场</title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li class="active">首页</li>
        </ol>
        <div class="total-money-area col-md-12">
            <span>金币总额：</span>
            <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
            </span>
            <span id="totalMoney">
                ${total}
            </span>
        </div>
        <hr>
        <div class="content">
            <div class="base-info col-md-5 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        基本信息
                    </div>
                    <div class="panel-body">
                        <p>
                            玩家编号：${sessionScope.user.userId}
                        </p>

                        <p>
                            玩家姓名：${sessionScope.user.name}
                        </p>

                        <p>
                            手机号码：${sessionScope.user.mobile}
                        </p>

                        <p>
                            身份证号码：<data:idCard value="${sessionScope.user.idCard}"/>
                        </p>

                        <p>
                            开户银行：<data:dict dictgroup="bank" value="${sessionScope.user.bank}"/>
                        </p>

                        <p>
                            银行卡号：<data:bankcard value="${sessionScope.user.bankCard}"/>
                        </p>
                    </div>
                </div>
            </div>
            <div class="pet-info col-md-7 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        我的宠物
                    </div>
                    <div class="panel-body">
                        <div class="pet col-md-6 col-sm-12 col-xs-12">
                            <img src="${sessionScope.imageUrl}${pet.img}"
                                 alt="${pet.name}">
                        </div>
                        <div class="pet-info col-md-6 col-sm-12 col-xs-12">
                            <p>
                                宠物名称：${pet.name}
                            </p>

                            <p>
                                价值：${pet.price}金币
                            </p>

                            <p>
                                复购次数：${repurchase}次
                            </p>

                            <p>
                                今日是否喂养：<data:dict dictgroup="feedStatus" value="${isFeed}"/>
                            </p>

                            <p>
                                今日金币产量：${petDailyOutput}币
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/foot.jsp"/>
</div>
</body>
</html>
