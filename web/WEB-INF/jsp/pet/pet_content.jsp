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
        <th>序号</th>
        <th>领养日期</th>
        <th>领养天数</th>
        <th>每日产币</th>
        <th>已产币</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="lifecycle" items="${page.list}" varStatus="st">
        <tr>
            <td>第${page.totalRow - (page.pageNumber-1)*page.pageSize - st.index}轮</td>
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
