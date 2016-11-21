<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="withdraw.account"/></th>
        <th><data:i18n key="withdraw.amount"/></th>
        <th><data:i18n key="withdraw.actualAmount"/></th>
        <th><data:i18n key="withdraw.fees"/></th>
        <th><data:i18n key="withdraw.date"/></th>
        <th><data:i18n key="status"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="withdraw" items="${page.list}">
        <tr>
            <td>${withdraw.bankName}:${withdraw.cardNo}</td>
            <td>
                    ${withdraw.money}
            </td>
            <td>
                    ${withdraw.realMoney}
            </td>
            <td>
                    ${withdraw.fee}
            </td>
            <td>
                <data:date value="${withdraw.createTime}" fmt="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <data:dict dictgroup="withdrawStatus" value="${withdraw.status}"/>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/trade/queryWithdrawList"/>