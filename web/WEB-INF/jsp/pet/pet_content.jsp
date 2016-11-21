<%--
  宠物明细
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/taglib.jsp" %>
<table class="table">
    <thead>
    <tr>
        <th><data:i18n key="pet.no"/></th>
        <th><data:i18n key="pet.purchaseTime"/></th>
        <th><data:i18n key="pet.liveDays"/></th>
        <th><data:i18n key="pet.outputPerDay"/></th>
        <th><data:i18n key="pet.alreadyOutput"/></th>
        <th><data:i18n key="status"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="lifecycle" items="${page.list}" varStatus="st">
        <tr>
            <td><data:i18n key="account.no"/>${page.totalRow - (page.pageNumber-1)*page.pageSize - st.index}<data:i18n key="pet.round"/></td>
            <td>
                <data:date value="${lifecycle.createTime}" fmt="yyyy-MM-dd"/>
            </td>
            <td>
                    ${lifecycle.liveDays}
            </td>
            <td>
                    ${lifecycle.dailyOutput}
            </td>
            <td>
                    ${lifecycle.totalOutput}
            </td>
            <td>
                <data:dict dictgroup="petStatus" value="${lifecycle.status}"/>
            </td>
        </tr>
    </c:forEach>
    <data:emptyData cols="6"/>
    </tbody>
</table>
<data:page contentId="content" url="${basePath}/pet/queryLifecycleList"/>
