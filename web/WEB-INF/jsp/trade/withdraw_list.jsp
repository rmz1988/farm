<%--
  
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglib.jsp" %>
<table class="table table-responsive">
    <thead>
    <tr>
        <th>提现账号</th>
        <th>提现金额(元)</th>
        <th>实到金额(元)</th>
        <th>手续费(元)</th>
        <th>提现日期</th>
        <th>状态</th>
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