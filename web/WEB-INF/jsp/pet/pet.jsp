<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title>开鑫牧场-牧场管理</title>
    <script>
        seajs.use('pet/pet');
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li>当前位置：</li>
            <li class="active">牧场管理</li>
        </ol>
        <div class="content">
            <div class="panel panel-success">
                <div class="panel-heading">
                    我的宠物
                </div>
                <div class="panel-body">
                    <div class="pet col-md-4 col-sm-12 col-xs-12">
                        <img src="${sessionScope.imageUrl}${pet.img}"
                             alt="${pet.name}">
                    </div>
                    <div class="pet-info col-md-8 col-sm-12 col-xs-12">
                        <p>
                            宠物名称：${sessionScope.user.pet.name}
                        </p>

                        <p>
                            <button id="feedBtn" type="button" class="btn btn-success btn-lg"
                                    <c:if test="${isFeed == 1}">disabled</c:if>>
                                喂养
                            </button>
                            <c:if test="${isFeed == 1}">
                                （今日已喂养）
                            </c:if>
                            <span class="rule-tip">今天喂养将产生${petDailyOutput}奖励币，每天只能喂养1次。</span>
                        </p>
                        <p>
                            <button id="repurchaseBtn" type="button" class="btn btn-info btn-lg"
                                    <c:if test="${total <= pet.price || repurchase >= repurchaseLimit}">disabled</c:if>>
                                复购
                            </button>
                            <span class="rule-tip">复购将消耗${pet.price}奖励币，当前奖励币：${total}。</span>
                            <span class="rule-tip">每天复购不超过${repurchaseLimit}次，今日已复购${repurchase}次。</span>
                        </p>
                        <input type="hidden" id="petPrice" value="${pet.price}"/>
                    </div>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">
                    宠物明细
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
