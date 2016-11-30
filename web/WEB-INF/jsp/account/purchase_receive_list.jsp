<%--
  收到的收购申请
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="purchase.purchaser"/></th>
        <th><data:i18n key="purchase.amount"/></th>
        <th><data:i18n key="status"/></th>
        <th><data:i18n key="account.applyTime"/></th>
        <th><data:i18n key="purchase.myAccountName"/></th>
        <th><data:i18n key="purchase.payTime"/></th>
        <th><data:i18n key="operation"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="apply" items="${page.list}">
        <tr>
            <td>${apply.userId}</td>
            <td>${apply.money}</td>
            <td><data:dict dictgroup="purchaseReceiveStatus" value="${apply.status}"/></td>
            <td><data:date value="${apply.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:if test="${not empty apply.bankCard}">
                    <data:dict dictgroup="bank" value="${apply.bank}"/> ${apply.accountName}(<data:bankcard
                        value="${apply.bankCard}"/>)
                </c:if>
            </td>
            <td><data:date value="${apply.statusTime}" fmt="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:if test="${apply.status == 0}">
                    <button id="agree${apply.applyId}" class="btn btn-info btn-sm" type="button" name="agreeBtn">
                        <data:i18n key="purchase.agree"/>
                    </button>
                    <button id="disagree${apply.applyId}" class="btn btn-danger btn-sm" type="button"
                            name="disagreeBtn">
                        <data:i18n key="purchase.disagree"/>
                    </button>
                </c:if>
                <c:if test="${apply.status == 3}">
                    <button type="button" id="confirm${apply.applyId}" name="confirmBtn" class="btn btn-info btn-sm">
                        <data:i18n key="purchase.confirm"/>
                    </button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="sendContent" url="${basePath}/account/queryPurchaseReceiveList"/>
