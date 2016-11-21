<%--
  首页
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/></title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li class="active"><data:i18n key="home"/></li>
        </ol>
        <div class="total-money-area col-md-6">
            <span><data:i18n key="bonus"/>：</span>
            <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
            </span>
            <span id="totalMoney">
                ${totalMoney}
            </span>
        </div>
        <div class="total-money-area col-md-6">
            <span><data:i18n key="activateMoney"/>：</span>
            <span class="money-img">
                <img src="${basePath}/images/money.png" alt="">
            </span>
            <span id="activeMoney">
                ${activeMoney}
            </span>
        </div>
        <hr>
        <div class="content">
            <div class="base-info col-md-5 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <data:i18n key="index.userInfo"/>
                    </div>
                    <div class="panel-body">
                        <p>
                            <data:i18n key="index.userId"/>：${sessionScope.user.userId}
                        </p>

                        <p>
                            <data:i18n key="index.name"/>：${sessionScope.user.name}
                        </p>

                        <p>
                            <data:i18n key="index.phone"/>：${sessionScope.user.mobile}
                        </p>

                        <p>
                            <data:i18n key="index.idCard"/>：<data:idCard value="${sessionScope.user.idCard}"/>
                        </p>

                        <p>
                            <data:i18n key="index.bank"/>：<data:dict dictgroup="bank"
                                                                     value="${sessionScope.user.bank}"/>
                        </p>

                        <p>
                            <data:i18n key="index.bankCard"/>：<data:bankcard value="${sessionScope.user.bankCard}"/>
                        </p>
                    </div>
                </div>
            </div>
            <div class="pet-info col-md-7 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <data:i18n key="index.myPet"/>
                    </div>
                    <div class="panel-body">
                        <div class="pet col-md-6 col-sm-12 col-xs-12">
                            <img src="${sessionScope.imageUrl}${pet.img}"
                                 alt="${pet.name}">
                        </div>
                        <div class="pet-info col-md-6 col-sm-12 col-xs-12">
                            <p>
                                <data:i18n key="index.petName"/>：<data:petName petNo="${pet.petNo}"/>
                            </p>

                            <p>
                                <data:i18n key="index.petPrice"/>：${pet.price}
                            <data:i18n key="yuan"/>
                            </p>

                            <p>
                                <data:i18n key="index.repurchase"/>：${repurchase}
                            <data:i18n key="times"/>
                            </p>

                            <p>
                                <data:i18n key="index.feed"/>：<data:dict dictgroup="feedStatus" value="${isFeed}"/>
                            </p>

                            <p>
                                <data:i18n key="index.output"/>：30/39<data:i18n key="yuan"/>
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
