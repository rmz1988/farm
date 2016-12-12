<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.pastureMgmt"/></title>
    <script>
        seajs.use('pet/pet');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <input type="hidden" id="overIncome" value="${overIncome}"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li class="active"><data:i18n key="menu.pastureMgmt"/></li>
        </ol>
        <div class="content">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <data:i18n key="index.myPet"/>
                </div>
                <div class="panel-body">
                    <div class="pet col-md-4 col-sm-12 col-xs-12">
                        <img src="${sessionScope.imageUrl}${pet.img}"
                             alt="${pet.name}">
                    </div>
                    <div class="pet-info col-md-8 col-sm-12 col-xs-12">
                        <c:choose>
                            <c:when test="${canVisit == false}">
                                <span class="rule-tip-lg">
                                    <data:i18n key="pet.visitTime"/>
                                </span>
                            </c:when>
                            <c:otherwise>

                                <p>
                                    <data:i18n key="index.petName"/>：<data:petName
                                        petNo="${sessionScope.user.pet.petNo}"/>
                                </p>

                                <p>
                                    <button id="feedBtn" type="button" class="btn btn-success btn-lg"
                                            <c:if test="${isFeed == 1}">disabled</c:if>>
                                        <data:i18n key="pet.feed"/>
                                    </button>
                                    <span id="feedTip">
                            <c:if test="${isFeed == 1}">
                                （<data:i18n key="pet.alreadyFeed"/>）
                            </c:if>
                            </span>
                                    <span class="rule-tip"><data:i18n key="pet.feedRule"/></span>
                                </p>
                                <p>
                                    <button id="repurchaseBtn" type="button" class="btn btn-info btn-lg"
                                            <c:if test="${user.recommendCount == 0 || total + 0 <= pet.price + 0 || repurchase + 0 >= repurchaseLimit + 0}">disabled</c:if>>
                                        <data:i18n key="pet.repurchase"/>
                                    </button>
                                    <span id="repurchaseTip">

                            </span>
                                    <span class="rule-tip"><data:i18n key="pet.repurchaseTip1"/>${pet.price}<data:i18n key="pet.repurchaseTip2"/>：${total}。<data:i18n
                                            key="pet.repurchaseTip5"/></span>
                                    <span class="rule-tip"><data:i18n
                                            key="pet.repurchaseTip3"/>${repurchaseLimit}<data:i18n key="pet.repurchaseTip4"/>${repurchase}<data:i18n key="times"/></span>
                                </p>
                                <input type="hidden" id="petPrice" value="${pet.price}"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">
                    <data:i18n key="pet.petDetail"/>（<data:i18n key="pet.totalOutput"/>：${totalOutput}）
                </div>
                <div id="content" class="panel-body table-responsive">
                    <jsp:include page="pet_content.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
