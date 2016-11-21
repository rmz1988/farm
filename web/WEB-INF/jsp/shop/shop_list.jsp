<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<c:if test="${fn:length(page.list) == 0}">
    <div class="col-md-12 text-center" style="padding:20px;"><data:i18n key="shop.noGoods"/></div>
</c:if>
<div class="col-md-12" style="padding:20px;">
    <c:forEach var="goods" items="${page.list}">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="goods-area">
                <img src="${sessionScope.imageUrl}${goods.img}">
                <div class="goods-name" title="${goods.name}"
                     style="">
                        ${goods.name}
                </div>
                <div class="goods-price text-right" style="padding:4px;color:#51a351;">
                    <span class="tip"><data:i18n key="shop.price"/>：</span>
                    <span class="main">${goods.price}</span>
                    <span class="tip"><data:i18n key="yuan"/></span>
                </div>
                <div class="goods-btn text-center">
                    <button type="button" class="btn btn-success">
                        <data:i18n key="shop.buy"/>
                    </button>
                    <button type="button" class="btn btn-danger">
                        <data:i18n key="shop.cart"/>
                    </button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<data:page contentId="content" url="${basePath}/shop/queryShopList"/>