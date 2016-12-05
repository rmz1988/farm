<%--
  发出的收购申请
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="purchase.purchaseUser"/></th>
        <th><data:i18n key="purchase.amount"/></th>
        <th><data:i18n key="withdraw.fees"/></th>
        <th><data:i18n key="withdraw.actualAmount"/></th>
        <th><data:i18n key="status"/></th>
        <th><data:i18n key="account.applyTime"/></th>
        <th><data:i18n key="purchase.payAccount"/></th>
        <th><data:i18n key="purchase.oppositeStatusTime"/></th>
        <th><data:i18n key="operation"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="apply" items="${page.list}">
        <tr>
            <td>${apply.oppositeUserId}</td>
            <td>${apply.money}</td>
            <td>${apply.fee}</td>
            <td>${apply.realMoney}</td>
            <td><data:dict dictgroup="purchaseSendStatus" value="${apply.status}"/></td>
            <td><data:date value="${apply.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:if test="${not empty apply.bankCard}">
                    <data:dict dictgroup="bank" value="${apply.bank}"/> ${apply.accountName}(<data:bankcard
                        value="${apply.bankCard}" hidden="false"/>)
                </c:if>
            </td>
            <td><data:date value="${apply.oppositeStatusTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:if test="${apply.status == 1}">
                    <button id="${apply.applyId}" class="btn btn-info btn-sm" type="button" name="payBtn">
                        <data:i18n key="purchase.payment"/>
                    </button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="9"/>
    </tbody>
</table>
<data:page contentId="sendContent" url="${basePath}/account/queryPurchaseSendList"/>