<%--
  推荐列表
  User: rmz19
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head lang="zh-CN">
    <title><data:i18n key="kxmc"/>-<data:i18n key="menu.recommendList"/></title>
</head>
<body>
<div class="container" style="border-radius: 0;">
    <jsp:include page="/title.jsp" flush="true"/>
    <jsp:include page="/menu_bar.jsp" flush="true"/>

    <div class="row">
        <ol class="breadcrumb">
            <li><data:i18n key="currentLocation"/>：</li>
            <li><data:i18n key="menu.accountMgmt"/></li>
            <li class="active"><data:i18n key="menu.recommendList"/></li>
        </ol>
        <div class="content">
            <div class="total-money-area col-md-6">
                <span><data:i18n key="account.teamMembers"/>：${recommendResult[0]}</span>
            </div>
            <div class="total-money-area col-md-6">
                <span><data:i18n key="account.recommendMembers"/>：${recommendResult[1]}</span>
            </div>
            <c:forEach var="recommendList" items="${recommendResult[2]}" varStatus="st">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <data:i18n key="account.no"/>${st.index + 1}<data:i18n key="account.generation"/>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><data:i18n key="userId"/></th>
                                <th><data:i18n key="register.name"/></th>
                                <th><data:i18n key="status"/></th>
                                <th><data:i18n key="account.registerTime"/></th>
                                <th><data:i18n key="register.recommendUser"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="recommendUser" items="${recommendList}">
                                <tr>
                                    <td>${recommendUser.userId}</td>
                                    <td>${recommendUser.name}</td>
                                    <td><data:dict dictgroup="userStatus" value="${recommendUser.status}"/></td>
                                    <td><data:date fmt="yyyy-MM-dd" value="${recommendUser.registerTime}"/></td>
                                    <td>${recommendUser.recommendUserId}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/foot.jsp" flush="true"/>
</div>
</body>
</html>
